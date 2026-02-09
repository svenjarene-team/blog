# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo blog using the Hugoplate theme (a Hugo + Tailwind CSS boilerplate). The site is a personal blog for Svenja Dunger and René Kuhn, hosted at https://svenjarene.team/.

## Commands

```bash
# Development server
npm run dev

# Production build (with CSS purging and minification)
npm run build

# Production preview
npm run preview

# Format code with Prettier
npm run format

# Update Hugo modules
npm run update-modules
```

## Prerequisites

- Hugo Extended v0.124+
- Node.js v20+
- Go v1.22+

## Architecture

### Content Structure
- `content/english/` - All site content in Markdown
  - `blog/` - Blog posts
  - `authors/` - Author profiles
  - `about/`, `contact/`, `pages/` - Static pages
  - `sections/` - Reusable section content (testimonials, CTAs)

### Configuration
- `hugo.toml` - Main Hugo config (baseURL, theme, plugins, build settings)
- `config/_default/params.toml` - Site parameters (logo, search, SEO, navigation)
- `config/_default/menus.en.toml` - Navigation menus
- `config/_default/languages.toml` - Language settings
- `data/theme.json` - Colors and fonts (primary colors, font families, sizes)
- `data/social.json` - Social media links

### Theming
- `layouts/` - Hugo template overrides
- `assets/` - CSS and JS assets processed by Hugo Pipes
- `themes/hugoplate/` - Base theme (via git submodule)
- Tailwind CSS with PostCSS for styling
- Dark mode supported via `theme_switcher` in params.toml

### Key Files
- Blog post frontmatter includes: title, meta_title, description, date, image, categories, author, tags, draft
- Authors are linked via the `author` field matching filenames in `content/english/authors/`
