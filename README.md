# LifePointe Greater Lekki — Announcements

A lightweight, mobile-first announcements page for LifePointe Greater Lekki.
Built as a single static `index.html` (no build step, no backend) with optimized WebP images.

## Live URL

https://lifepointeng.org/gl/updates/

## Weekly pack

1. Paste next Sunday’s announcement list
2. Archive current page: copy `index.html` → `archive/YYYY-MM-DD.html` (Sunday date)
3. Update `index.html` cards to match the new list
4. Generate the read-through script (from the working copy):

```bash
cd ../announcements
python3 build_script.py --date YYYY-MM-DD
```

5. Commit + push — cPanel cron deploys the web page within ~5 minutes
6. Upload `scripts/Announcement-Script-YYYY-MM-DD.docx` to Google Drive / open in Docs to edit or print

## Structure

- `index.html` — this week’s page (tap any item to expand)
- `archive/` — previous Sundays’ pages
- `scripts/` — Google Docs–style read-through Word files
- `images/` — optimized WebP banners
- `assets/` — logos
- `deploy.sh` — cron auto-deploy (pull + copy to `public_html/gl/updates`)

## Cron (already set)

```bash
*/5 * * * * /bin/bash /home/lifepoin/repositories/lpgl-announcements/deploy.sh
```
