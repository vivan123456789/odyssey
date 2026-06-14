import { defineConfig } from 'astro/config';
import sitemap from "@astrojs/sitemap";
import mdx from "@astrojs/mdx";
import icon from "astro-icon";
import lit from "@astrojs/lit";

// https://astro.build/config
export default defineConfig({
  site: 'https://golden-parfait-c95801.netlify.app/',
  sitemap: true,
  integrations: [sitemap(), mdx(), lit(), icon()],
  vite: {
    ssr: {
      external: ['svgo']
    }
  }
});
