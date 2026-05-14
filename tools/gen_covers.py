#!/usr/bin/env python3
"""Generate placeholder cover images for portfolio projects.

Each card: 1600x900, vertical gradient from primary to a darker shade,
title + subtitle in white, subtle initials watermark.
"""
import os
import math
from PIL import Image, ImageDraw, ImageFont, ImageFilter

OUT_ROOT = os.path.join(os.path.dirname(__file__), "..", "assets", "images", "projects")
W, H = 1600, 900

PROJECTS = [
    ("binance-tax",    "Binance Tax Report",       "CSV to German PDF",              "#B45309"),
    ("cv-plugin",      "CV Plugin for Unreal",     "Segmentation & datasets",        "#0E7490"),
    ("postflow",       "Postflow",                 "Social-media SaaS for SMBs",     "#0F766E"),
    ("luminarep",      "LuminaRep",                "AI social proof for clinics",    "#047857"),
    ("python-recall",  "Recall",                   "AI screenshot analysis",         "#1D4ED8"),
    ("whisper",        "Whisper Service",          "Self-hosted speech-to-text",     "#0284C7"),
    ("voice-assistant","Local AI Voice Assistant", "Offline LLM + wake word",        "#14B8A6"),
    ("theater",        "Theater Website",          "Programme & ticketing",          "#7E22CE"),
    ("wp-plugins",     "WordPress Plugins",        "Open-source utilities",          "#21759B"),
    ("turtlebot",      "Turtlebot Programming",    "B.Sc. coursework",               "#B91C1C"),
    ("paper-citysim",  "Object-Detection Paper",   "Deep learning in simulated city","#0E7490"),
    ("unity-hackathon","ALSignal Hackathon",       "ASL detection prototype",        "#1F2937"),
    ("steam-market",   "Steam Market Arbitrage",   "Trading automation",             "#1B2838"),
    ("csfloat",        "CSFloat Sniper",           "Marketplace scanner",            "#EAB308"),
    ("image-uploader", "Image Uploader",           "Bulk-upload utility",            "#0EA5E9"),
    ("django-canva",   "Django Canvas",            "Programmatic image generator",   "#064E3B"),
]


def hex_to_rgb(h):
    h = h.lstrip("#")
    return tuple(int(h[i:i+2], 16) for i in (0, 2, 4))


def darken(rgb, factor=0.45):
    return tuple(max(0, int(c * factor)) for c in rgb)


def lighten(rgb, factor=0.18):
    return tuple(min(255, int(c + (255 - c) * factor)) for c in rgb)


def _find_font(*candidates, size=120):
    for c in candidates:
        try:
            return ImageFont.truetype(c, size=size)
        except (OSError, IOError):
            continue
    return ImageFont.load_default()


def gradient(top, bottom):
    img = Image.new("RGB", (W, H), top)
    px = img.load()
    for y in range(H):
        t = y / (H - 1)
        r = int(top[0] * (1 - t) + bottom[0] * t)
        g = int(top[1] * (1 - t) + bottom[1] * t)
        b = int(top[2] * (1 - t) + bottom[2] * t)
        for x in range(W):
            px[x, y] = (r, g, b)
    return img


def add_grain(img, strength=12):
    """Add subtle noise for a less flat look."""
    from random import randint
    px = img.load()
    for y in range(0, H, 2):
        for x in range(0, W, 2):
            r, g, b = px[x, y]
            n = randint(-strength, strength)
            px[x, y] = (max(0, min(255, r + n)), max(0, min(255, g + n)), max(0, min(255, b + n)))
    return img


def add_diagonal_lines(img, color, spacing=80, alpha=22):
    """Subtle diagonal lines for texture."""
    overlay = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    draw = ImageDraw.Draw(overlay)
    for i in range(-H, W + H, spacing):
        draw.line([(i, 0), (i + H, H)], fill=(*color, alpha), width=2)
    return Image.alpha_composite(img.convert("RGBA"), overlay).convert("RGB")


def render(slug, title, subtitle, color_hex):
    base = hex_to_rgb(color_hex)
    top = lighten(base, 0.05)
    bottom = darken(base, 0.40)
    img = gradient(top, bottom)
    img = add_diagonal_lines(img, lighten(base, 0.45), spacing=120, alpha=30)
    img = add_grain(img, strength=8)

    # Watermark initials (very faint, large)
    initials = "".join(w[0].upper() for w in title.split() if w[0].isalpha())[:3]
    wm_font = _find_font(
        "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf",
        size=620,
    )
    wm = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    wd = ImageDraw.Draw(wm)
    wbbox = wd.textbbox((0, 0), initials, font=wm_font)
    wW = wbbox[2] - wbbox[0]
    wH_ = wbbox[3] - wbbox[1]
    wd.text(
        ((W - wW) // 2 - wbbox[0], (H - wH_) // 2 - wbbox[1] - 20),
        initials,
        font=wm_font,
        fill=(255, 255, 255, 30),
    )
    wm = wm.filter(ImageFilter.GaussianBlur(radius=2))
    img = Image.alpha_composite(img.convert("RGBA"), wm).convert("RGB")

    # Title + subtitle (bottom-left)
    title_font = _find_font(
        "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
        size=96,
    )
    sub_font = _find_font(
        "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
        size=44,
    )
    d = ImageDraw.Draw(img)
    pad = 90
    sub_bbox = d.textbbox((0, 0), subtitle, font=sub_font)
    sub_h = sub_bbox[3] - sub_bbox[1]
    title_bbox = d.textbbox((0, 0), title, font=title_font)
    title_h = title_bbox[3] - title_bbox[1]
    y_sub = H - pad - sub_h
    y_title = y_sub - 28 - title_h
    d.text((pad, y_title), title, font=title_font, fill=(255, 255, 255))
    d.text((pad, y_sub), subtitle, font=sub_font, fill=(255, 255, 255, 220))

    # Top-right tag bar
    d.rectangle([W - 220, 60, W - 60, 64], fill=(255, 255, 255, 180))

    out_dir = os.path.join(OUT_ROOT, slug)
    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, "cover.png")
    img.save(out_path, "PNG", optimize=True)
    print(f"  {slug:18s} → {out_path}")
    return out_path


def main():
    os.makedirs(OUT_ROOT, exist_ok=True)
    print(f"Generating {len(PROJECTS)} cover images into {OUT_ROOT}")
    for slug, title, subtitle, color_hex in PROJECTS:
        render(slug, title, subtitle, color_hex)
    print("Done.")


if __name__ == "__main__":
    main()
