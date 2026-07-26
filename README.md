# LifePointe Greater Lekki — Announcements

A lightweight, mobile-first announcements page for LifePointe Greater Lekki.
Built as a single static `index.html` (no build step, no backend) with optimized WebP images.

## Live URL

https://lifepointeng.org/gl/updates/

## Update flow

1. Edit `index.html` (and images if needed)
2. Commit and push to `main`
3. Within a few minutes, cPanel cron runs `deploy.sh` and the live site updates

No cPanel login needed after the one-time cron setup below.

## One-time auto-deploy setup (cPanel cron)

1. Deploy the latest commit once (so `deploy.sh` exists on the server):
   cPanel → Git™ Version Control → Update from Remote → Deploy HEAD Commit
2. cPanel → **Cron Jobs** → Add New Cron Job
3. Common Settings: **Every 5 Minutes** (or paste `*/5 * * * *`)
4. Command:

```bash
/bin/bash /home/lifepoin/repositories/lpgl-announcements/deploy.sh
```

5. Save.

After that: edit → push → wait up to 5 minutes → live.

Deploy log: `/home/lifepoin/logs/lpgl-deploy.log`

## Structure

- `index.html` — the page (tap any item to expand)
- `images/` — optimized WebP banners
- `assets/` — logos
- `deploy.sh` — pulls from GitHub and copies to `public_html/gl/updates`
- `.cpanel.yml` — used by the manual “Deploy HEAD Commit” button
