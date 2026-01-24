/*
 * Hide & neutralize YouTube Shorts (Manifest V3 content script)
 * - Redirect /shorts/VIDEOID to /watch?v=VIDEOID
 * - Remove Shorts shelves, buttons, guide entries, search results
 * - Observe SPA navigations (YouTube dynamic page loads)
 */

(function() {
  const SHORTS_PATH = '/shorts/';

  function isShortsPath(path) {
    return path.startsWith(SHORTS_PATH);
  }

  function extractVideoIdFromShorts(path) {
    // /shorts/<11char>[...]
    try {
      const part = path.slice(SHORTS_PATH.length).split(/[?&#]/)[0];
      return part.length === 11 ? part : null;
    } catch { return null; }
  }

  function redirectIfShorts() {
    if (isShortsPath(location.pathname)) {
      const id = extractVideoIdFromShorts(location.pathname);
      if (id) {
        const target = 'https://www.youtube.com/watch?v=' + id;
        if (location.href !== target) {
          location.replace(target);
        }
      }
    }
  }

  // Basic CSS injection (idempotent) to hide UI blocks referencing shorts.
  function injectCSS() {
    if (document.getElementById('hide-shorts-style')) return;
    const style = document.createElement('style');
    style.id = 'hide-shorts-style';
    style.textContent = `
      ytd-reel-shelf-renderer,
      ytd-reel-video-renderer,
      ytd-rich-shelf-renderer:has(a[href*="/shorts/"]),
      ytd-rich-item-renderer:has(a[href*="/shorts/"]),
      ytd-grid-video-renderer:has(a[href*="/shorts/"]),
      ytd-guide-entry-renderer:has(a[href^="/shorts"]),
      tp-yt-paper-tab:has(a[href*="shorts"]),
      ytd-video-renderer:has(a[href*="/shorts/"]) {
        display: none !important;
      }
    `;
    document.documentElement.appendChild(style);
  }

  // Mutation observer to remove dynamically inserted Shorts elements.
  function scrubShorts(node) {
    if (!node || !node.querySelectorAll) return;
    const selectors = [
      'ytd-reel-shelf-renderer',
      'ytd-reel-video-renderer',
      'ytd-rich-shelf-renderer a[href*="/shorts/"]',
      'ytd-rich-item-renderer a[href*="/shorts/"]',
      'ytd-grid-video-renderer a[href*="/shorts/"]',
      'ytd-guide-entry-renderer a[href^="/shorts"]',
      'tp-yt-paper-tab a[href*="shorts"]',
      'ytd-video-renderer a[href*="/shorts/"]'
    ];
    let removed = 0;
    selectors.forEach(sel => {
      node.querySelectorAll(sel).forEach(el => {
        // Remove container up the tree for cleaner layout
        let container = el.closest('ytd-rich-item-renderer') || el.closest('ytd-video-renderer') || el.closest('ytd-reel-shelf-renderer') || el.closest('ytd-grid-video-renderer') || el;
        if (container && container.parentNode) {
          container.parentNode.removeChild(container);
          removed++;
        }
      });
    });
    return removed;
  }

  function observe() {
    const root = document.documentElement;
    const mo = new MutationObserver(muts => {
      let total = 0;
      muts.forEach(m => {
        m.addedNodes.forEach(n => {
          if (n.nodeType === 1) total += scrubShorts(n);
        });
      });
      if (total > 0) {
        // Keep CSS in case dynamic pages swap documents
        injectCSS();
      }
    });
    mo.observe(root, {subtree: true, childList: true});
  }

  // Handle SPA navigations (YouTube internal router / history changes)
  function hookNavigation() {
    const pushState = history.pushState;
    history.pushState = function() {
      const r = pushState.apply(this, arguments);
      redirectIfShorts();
      queueMicrotask(scrubAll);
      return r;
    };
    window.addEventListener('popstate', () => {
      redirectIfShorts();
      queueMicrotask(scrubAll);
    });
    window.addEventListener('yt-navigate-finish', () => {
      redirectIfShorts();
      queueMicrotask(scrubAll);
    });
  }

  function scrubAll() {
    injectCSS();
    scrubShorts(document);
  }

  // Initial run
  redirectIfShorts();
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
      injectCSS();
      scrubAll();
    });
  } else {
    injectCSS();
    scrubAll();
  }
  observe();
  hookNavigation();
})();
