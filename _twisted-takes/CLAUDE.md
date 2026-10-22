# Twisted Takes

Student team's movie and TV review blog; readers are mostly students aged 16–24.
Team is only who's in `_data/team.yml`. Never invent teammates or roles.

## Build and publish
- This folder is source only. GitHub Pages serves `ist444` as plain files and never runs Jekyll,
  so the live site is the committed build in `../twisted-takes/`. After any change, run
  `sh _twisted-takes/tools/build-ist444.sh` from `ist444/` (it also runs `check-site.mjs`) and
  commit both folders. Never hand-edit `../twisted-takes/`: every build overwrites it.
- A rebuild changes every built page (the `?v=` timestamp). That's expected.
- Outside the build script (e.g. `jekyll serve`), first run
  `export PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH"`. System Ruby 2.6 fails.
- Stay on the `github-pages` gem (Jekyll 3.10). Add no gems or plugins.
  Write links in Markdown and templates as `{{ '/path/' | relative_url }}`. Never write a bare
  `/…` href or use `{% link %}` (Jekyll 3 drops the base path). Front-matter `image:` paths
  stay root-relative; the layouts add the base path.
- Any new file or folder here ships to the live site unless it's in `exclude:` in `_config.yml`.
- Then run `cd _twisted-takes/tools && node browser-check.mjs --site ../../twisted-takes --expect-analytics`
  (GA4 is on).

## Content rules
- Your text gets `editorial_status: "sample"` and `score: null`. Only the team approves or scores.
  Never invent scores, IMDb or Rotten Tomatoes numbers, consensus, awards, anecdotes or counts.
- No spoilers outside a `<details class="spoiler" markdown="1">` block (then set
  `spoiler_status: "contains-spoilers"`). That includes headlines, excerpts, descriptions,
  premises, discussion questions and alt text.
- True crime: attribute every case detail to the film. Never state guilt or current legal status
  in the site's voice.
- `director`, `runtime_minutes`, `content_rating` (TV: `creator`, `network`) only if verified on an
  official or distributor page, and listed in `sources`. Otherwise `null`.
- Images: original art, or one official poster or key art per review saved in
  `assets/images/covers/` (never hotlinked) and credited in `image_credit`. Cards show only the
  top 800×640 of a cover, so compose posters like `covers/hocus-pocus.jpg`.
- Silent failures no check catches:
  - `date:` must be today or earlier. Future items vanish, and Pages never rebuilds.
  - `related_reviews`, `picks` and weekly-prompt slugs must match a `_reviews/` file name exactly,
    or they're dropped.
  - For new content, set `social_image: "/assets/images/social/<slug>.png"` and run
    `npm run social-cards -- <slug>` in `tools/` before building.
  - Adding a review to a genre: update `genres/<key>.md`, whose intro and description name every film.
- Social and form URLs in `_config.yml` stay empty until the team supplies real ones.
  Never guess a handle.

Field reference: `EDITOR_GUIDE.md`. GA4 and the tools: `README.md`.
