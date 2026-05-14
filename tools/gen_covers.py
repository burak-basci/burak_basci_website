#!/usr/bin/env python3
"""Generate cinematic placeholder cover images for portfolio projects.

Design:
  - 1600x900 cinematic frame
  - Smooth diagonal gradient from the brand color to a darker shade
  - Faint diagonal-line texture for depth
  - A single huge wordmark (the title) centered, ~20% opacity, blurred
  - No edge-aligned text (so BoxFit.cover crops don't truncate anything)
  - Two thin accent rules in the lower-third for a "directed-by" feel
"""
import os
import math
from PIL import Image, ImageDraw, ImageFont, ImageFilter

OUT_ROOT = os.path.join(os.path.dirname(__file__), "..", "assets", "images", "projects")
W, H = 1600, 900

PROJECTS = [
    ("binance-tax",    "Binance Tax Report",       "#B45309"),
    ("cv-plugin",      "CV Plugin for Unreal",     "#0E7490"),
    ("postflow",       "Postflow",                 "#0F766E"),
    ("luminarep",      "LuminaRep",                "#047857"),
    ("python-recall",  "Recall",                   "#1D4ED8"),
    ("whisper",        "Whisper Service",          "#0284C7"),
    ("voice-assistant","Voice Assistant",          "#14B8A6"),
    ("theater",        "Theater",                  "#7E22CE"),
    ("wp-plugins",     "WordPress",                "#21759B"),
    ("turtlebot",      "Turtlebot",                "#B91C1C"),
    ("paper-citysim",  "City Simulation",          "#0E7490"),
    ("unity-hackathon","ALSignal",                 "#1F2937"),
    ("steam-market",   "Steam Market",             "#1B2838"),
    ("csfloat",        "CSFloat",                  "#EAB308"),
    ("image-uploader", "Image Uploader",           "#0EA5E9"),
    ("django-canva",   "Django Canvas",            "#064E3B"),
]


def hex_to_rgb(h):
    h = h.lstrip("#")
    return tuple(int(h[i:i+2], 16) for i in (0, 2, 4))


def darken(rgb, factor):
    return tuple(max(0, int(c * factor)) for c in rgb)


def lighten(rgb, factor):
    return tuple(min(255, int(c + (255 - c) * factor)) for c in rgb)


def _find_font(*candidates, size=120):
    for c in candidates:
        try:
            return ImageFont.truetype(c, size=size)
        except (OSError, IOError):
            continue
    return ImageFont.load_default()


def diagonal_gradient(top_left, bottom_right):
    img = Image.new("RGB", (W, H), top_left)
    px = img.load()
    diag = math.hypot(W, H)
    for y in range(H):
        for x in range(0, W, 2):
            t = (x + y) / diag
            r = int(top_left[0] * (1 - t) + bottom_right[0] * t)
            g = int(top_left[1] * (1 - t) + bottom_right[1] * t)
            b = int(top_left[2] * (1 - t) + bottom_right[2] * t)
            px[x, y] = (r, g, b)
            if x + 1 < W:
                px[x + 1, y] = (r, g, b)
    return img


def add_diagonal_lines(img, color, spacing=140, alpha=18):
    overlay = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    draw = ImageDraw.Draw(overlay)
    for i in range(-H, W + H, spacing):
        draw.line([(i, 0), (i + H, H)], fill=(*color, alpha), width=2)
    return Image.alpha_composite(img.convert("RGBA"), overlay).convert("RGB")


def add_vignette(img, strength=0.5):
    overlay = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    draw = ImageDraw.Draw(overlay)
    cx, cy = W // 2, H // 2
    max_d = math.hypot(cx, cy)
    for r in range(int(max_d), 0, -8):
        a = int(strength * 255 * (r / max_d) ** 3)
        draw.ellipse(
            [cx - r, cy - r * 0.7, cx + r, cy + r * 0.7],
            outline=(0, 0, 0, a),
            width=4,
        )
    return Image.alpha_composite(img.convert("RGBA"), overlay).convert("RGB")


def render(slug, title, color_hex):
    base = hex_to_rgb(color_hex)
    top = lighten(base, 0.10)
    bottom = darken(base, 0.35)

    img = diagonal_gradient(top, bottom)
    img = add_diagonal_lines(img, lighten(base, 0.50), spacing=160, alpha=22)

    # Huge wordmark of the title, centered, low alpha, slightly blurred
    wm_font = _find_font(
        "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf",
        size=200,
    )
    wm_layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    wd = ImageDraw.Draw(wm_layer)
    wbbox = wd.textbbox((0, 0), title, font=wm_font)
    wW = wbbox[2] - wbbox[0]
    wH_ = wbbox[3] - wbbox[1]
    # Don't let the wordmark overflow horizontally — auto-shrink if needed
    if wW > W - 200:
        scale = (W - 200) / wW
        new_size = max(80, int(200 * scale))
        wm_font = _find_font(
            "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
            size=new_size,
        )
        wbbox = wd.textbbox((0, 0), title, font=wm_font)
        wW = wbbox[2] - wbbox[0]
        wH_ = wbbox[3] - wbbox[1]
    wd.text(
        ((W - wW) // 2 - wbbox[0], (H - wH_) // 2 - wbbox[1] - 40),
        title,
        font=wm_font,
        fill=(255, 255, 255, 38),
    )
    wm_layer = wm_layer.filter(ImageFilter.GaussianBlur(radius=1.5))
    img = Image.alpha_composite(img.convert("RGBA"), wm_layer).convert("RGB")

    img = add_vignette(img, strength=0.55)

    # A thin pair of accent rules in the bottom third — premium "wide shot" feel
    d = ImageDraw.Draw(img)
    y1 = int(H * 0.66)
    d.line([(W * 0.08, y1), (W * 0.22, y1)], fill=(255, 255, 255, 120), width=2)
    d.line([(W * 0.08, y1 + 16), (W * 0.16, y1 + 16), ], fill=(255, 255, 255, 60), width=2)

    out_dir = os.path.join(OUT_ROOT, slug)
    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, "cover.png")
    img.save(out_path, "PNG", optimize=True)
    print(f"  {slug:18s} -> {out_path}")
    return out_path


def main():
    os.makedirs(OUT_ROOT, exist_ok=True)
    print(f"Generating {len(PROJECTS)} cinematic placeholders into {OUT_ROOT}")
    for slug, title, color_hex in PROJECTS:
        render(slug, title, color_hex)
    print("Done.")


if __name__ == "__main__":
    main()
