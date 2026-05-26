# Bay Collective — Odyssey Theme Customization

## What files to replace in your GitHub repo (vivan123456789/odyssey)

The build is working fine — it just has template content. Replace these files:

---

### 1. `src/config.ts`
→ Replace with `bay-collective-src/src/config.ts`

Controls: site name, nav links, footer columns, SEO metadata.

---

### 2. `src/pages/index.astro`
→ Replace with `bay-collective-src/src/pages/index.astro`

The homepage: hero, about blurb, feature cards, circuit teaser, roster teaser, blog posts, CTA.

---

### 3. `src/pages/about.astro`
→ Replace with `bay-collective-src/src/pages/about.astro`

About page: origin story, give-back model, circuit overview, ops pillars.

---

### 4. New pages to ADD (don't exist in template):

- `src/pages/roster.astro` — instrument/player grid + flexible config explainer
- `src/pages/shows.astro` — three-phase circuit, venue types, booking info
- `src/pages/contact.astro` — booking inquiry form (works with Netlify Forms or any form handler)

---

### 5. Blog posts — DELETE template posts, ADD these:

Delete everything in `src/pages/blog/posts/` and replace with:
- `introducing-bay-collective.mdx`
- `how-to-book-us.mdx`
- `the-give-back-model.mdx`

---

### 6. Images to add to `/public/images/`:

The pages reference these image paths — add your own photos here:
- `/images/hero-stage.jpg` — hero photo of a performance
- `/images/bay-area-map.jpg` — any Bay Area graphic or map
- `/images/roster-group.jpg` — group photo or collage
- `/images/blog/intro-post.jpg`
- `/images/blog/booking-post.jpg`
- `/images/blog/charity-post.jpg`

Until you have real photos, the Odyssey theme gracefully handles missing images with its placeholder system.

---

### 7. Update `astro.config.mjs`

Change the `site` URL to your final domain once you have one. Until then, the Vercel domain works:

```js
site: 'https://odyssey-psi-dun.vercel.app',
```

---

## Deployment

Once you push any of these changes to the `main` branch of `vivan123456789/odyssey`, Vercel auto-deploys. The build is already proven clean — these changes are all content/config, not framework changes, so nothing should break.

## Still to do

- [ ] Set up a real email (booking@baycollective.com or similar) and update contact page
- [ ] Add Instagram handle/link throughout
- [ ] Lock in the charity % and update Give Back section
- [ ] Add real photos to `/public/images/`
- [ ] Decide on a final domain name and update `astro.config.mjs`
- [ ] Set up form handling for contact page (Netlify Forms, Formspree, or EmailJS)
