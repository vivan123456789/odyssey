#!/bin/bash
# ─────────────────────────────────────────────────────────────
# Bay Collective — Deploy Script
# Run this ONCE from your terminal to push everything to GitHub.
#
# BEFORE RUNNING:
#   1. Make sure git is installed and you're logged into GitHub
#   2. Put this script and the bay-collective-src/ folder
#      in the same directory
#   3. Run:  chmod +x deploy.sh && ./deploy.sh
# ─────────────────────────────────────────────────────────────

set -e

REPO="https://github.com/vivan123456789/odyssey.git"
BRANCH="main"
SRC_DIR="$(dirname "$0")/bay-collective-src"

echo ""
echo "🎵 Bay Collective — Deploying to GitHub"
echo "────────────────────────────────────────"

# Clone the repo fresh
echo "→ Cloning repo..."
rm -rf /tmp/odyssey-deploy
git clone "$REPO" /tmp/odyssey-deploy
cd /tmp/odyssey-deploy

# ── Core config ──────────────────────────────────────────────
echo "→ Replacing config.ts..."
cp "$SRC_DIR/src/config.ts" src/config.ts

# ── Pages ────────────────────────────────────────────────────
echo "→ Replacing pages..."
cp "$SRC_DIR/src/pages/index.astro"          src/pages/index.astro
cp "$SRC_DIR/src/pages/about.astro"          src/pages/about.astro
cp "$SRC_DIR/src/pages/roster.astro"         src/pages/roster.astro
cp "$SRC_DIR/src/pages/shows.astro"          src/pages/shows.astro
cp "$SRC_DIR/src/pages/contact.astro"        src/pages/contact.astro
cp "$SRC_DIR/src/pages/contact-success.astro" src/pages/contact-success.astro

# ── Blog posts ───────────────────────────────────────────────
echo "→ Replacing blog posts..."
# Remove old template posts
rm -f src/pages/blog/posts/*.mdx src/pages/blog/posts/*.md 2>/dev/null || true
cp "$SRC_DIR/src/pages/blog/posts/"*.mdx src/pages/blog/posts/

# ── Images ───────────────────────────────────────────────────
echo "→ Adding images..."
mkdir -p public/images/blog
cp "$SRC_DIR/public/images/"*.jpg        public/images/ 2>/dev/null || true
cp "$SRC_DIR/public/images/blog/"*.jpg   public/images/blog/ 2>/dev/null || true

# ── Commit & push ────────────────────────────────────────────
echo "→ Committing..."
git add -A
git commit -m "feat: replace Odyssey template with Bay Collective content

- Updated site config, nav, footer, SEO
- New homepage: hero, feature cards, circuit, roster, CTA
- New pages: about, roster, shows, contact (Formspree wired), contact-success
- 3 new blog posts
- Placeholder images for all sections
- Formspree form handler with async submit + success/error states"

echo "→ Pushing to $BRANCH..."
git push origin $BRANCH

echo ""
echo "✅ Done! Vercel will auto-deploy in ~30 seconds."
echo "   Live URL: https://odyssey-psi-dun.vercel.app"
echo ""
echo "⚠️  One thing left: add your Formspree ID"
echo "   1. Go to https://formspree.io → New Form"
echo "   2. Copy your form ID"
echo "   3. In src/pages/contact.astro, replace YOUR_FORM_ID"
echo "   4. git add . && git commit -m 'chore: add formspree id' && git push"
echo ""
