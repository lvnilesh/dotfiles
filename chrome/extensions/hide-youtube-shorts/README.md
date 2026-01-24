# Hide YouTube Shorts & Redirect (Chrome MV3 Extension)

Lightweight self-hosted extension (Manifest V3) that:

- Hides Shorts shelves, reels, tabs, guide entries, search results
- Redirects any `/shorts/VIDEOID` URL to the standard `watch?v=VIDEOID` page
- Cleans up dynamically inserted elements on SPA navigations

## Install (Developer Mode)
1. Open `chrome://extensions/`
2. Enable "Developer mode" (top right)
3. Click "Load unpacked"
4. Select this folder: `chrome/extensions/hide-youtube-shorts`
5. Navigate to YouTube and hard refresh (Shift+Reload)

## How it works
- Content script runs at `document_start` so Shorts pages are redirected early.
- Injected CSS plus mutation observer aggressively removes Shorts containers.
- Hooks `history.pushState`, `popstate`, and YouTube's `yt-navigate-finish` to catch SPA route changes.

## Adjusting Selectors
If YouTube changes DOM structure, edit `content.js` and add/modify selectors in the `selectors` array inside `scrubShorts()`.

## Limitations
- If YouTube A/B tests different tag names, some Shorts may temporarily appear until a selector update.
- Minimal performance impact: mutation observer filters quickly; removal count not logged to console (can add if debugging).

## Optional: Only Redirect (Disable Hiding)
Comment out the CSS injection + scrub calls and keep only `redirectIfShorts()`.

## License
Personal use; adapt freely.
