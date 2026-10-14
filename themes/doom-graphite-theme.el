;;; doom-graphite-theme.el --- Quiet charcoal, blue, and sage -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;;
;; A personal, nearly monochrome dark theme.  Start tweaking the palette below;
;; the syntax roles and package faces reuse those colors throughout Doom.
;; Each palette entry contains a true-color, 256-color, and 16-color value.
;;
;; Preview in a separate process with your usual Doom config:
;;   EMACS_SERVER_NAME=graphite-preview emacs --eval \
;;     "(progn (mapc #'disable-theme custom-enabled-themes) (load-theme 'doom-graphite t))"
;;
;; After saving edits, run M-: (load-theme 'doom-graphite t) to reread this file.
;; To make it your default later, set doom-theme to 'doom-graphite in config.el.
;; No new packages or doom sync are needed.
;;
;;; Code:

(require 'doom-themes)

(def-doom-theme doom-graphite
  "A quiet charcoal theme with dusty blue and sage accents."
  :background-mode 'dark

  ;; Palette: adjust these first.  Keep the accent colors close to gray.
  ((bg         '("#282c34" "#262626" "black"))
   (bg-alt     '("#202325" "#1c1c1c" "black"))
   (fg         '("#c5c9c6" "#c6c6c6" "white"))
   (fg-alt     '("#959c98" "#949494" "brightblack"))

   ;; Neutral ramp, from the darkest surface to the brightest text.
   (base0      '("#1b1e20" "#1c1c1c" "black"))
   (base1      '("#202325" "#1c1c1c" "black"))
   (base2      '("#292d2f" "#303030" "brightblack"))
   (base3      '("#303537" "#303030" "brightblack"))
   (base4      '("#454c4f" "#444444" "brightblack"))
   (base5      '("#737d7d" "#767676" "brightblack"))
   (base6      '("#959c98" "#949494" "white"))
   (base7      '("#b0b6b2" "#b2b2b2" "white"))
   (base8      '("#d2d6d2" "#d0d0d0" "brightwhite"))

   ;; Dusty blue for language structure, sage for prose inside code.
   (blue       '("#8fb8d1" "#bcbcbc" "blue"))
   (dark-blue  '("#687f8d" "#808080" "blue"))
   (green      '("#9fbd8a" "#b2b2b2" "green"))
   (sage       '("#88a57c" "#9e9e9e" "brightblack"))
   (teal       '("#96aaa3" "#a8a8a8" "cyan"))
   (cyan       blue)
   (dark-cyan  dark-blue)
   (magenta    '("#aaa3af" "#a8a8a8" "magenta"))
   (violet     magenta)
   (yellow     '("#b4aa91" "#afafaf" "yellow"))
   (orange     '("#b09e8c" "#a8a8a8" "yellow"))
   (red        '("#b58f8c" "#afafaf" "red"))
   (grey       base4)

   ;; More chromatic anchors for the diff backgrounds.
   (diff-green '("#6f9b61" "#5f875f" "green"))
   (diff-red   '("#ac6661" "#af5f5f" "red"))

   ;; Universal syntax roles used by Doom's language and package faces.
   (highlight    blue)
   (vertical-bar base3)
   (selection    base3)
   (builtin      blue)
   (comments     sage)
   (doc-comments sage)
   (constants    base7)
   (functions    fg)
   (keywords     blue)
   (methods      fg)
   (operators    base7)
   (type         blue)
   (strings      green)
   (variables    fg)
   (numbers      base7)
   (region       '("#3b464c" "#444444" "brightblack"))
   (error        red)
   (warning      yellow)
   (success      green)
   (vc-modified  yellow)
   (vc-added     green)
   (vc-deleted   red)

   ;; Surface colors: shared by selections, searches, and diffs.
   (line-bg      '("#2b3032" "#303030" "brightblack"))
   (search-bg    '("#46555e" "#585858" "brightblack"))
   (diff-section-bg    (doom-blend blue bg 0.08))
   (diff-heading-bg    (doom-blend blue bg 0.16))
   (diff-heading-focus (doom-blend blue bg 0.24))
   (added-bg     (doom-blend diff-green bg 0.24))
   (removed-bg   (doom-blend diff-red bg 0.24))
   (added-focus  (doom-blend diff-green bg 0.34))
   (removed-focus (doom-blend diff-red bg 0.34)))

  ;; Most packages inherit Doom's base faces and the palette above.  Override
  ;; faces here when their default treatment is too bright or too colorful.
  ((cursor :background fg)
   (highlight :background selection :foreground fg)
   (hl-line :background line-bg :extend t)
   (shadow :foreground base5)
   (isearch :background search-bg :foreground base8 :weight 'bold)
   (lazy-highlight :background selection :foreground blue :weight 'normal)
   (match :background selection :foreground blue :weight 'bold)
   (show-paren-match :background selection :foreground blue :weight 'bold)
   (show-paren-mismatch :background removed-focus :foreground red)
   (link :foreground blue :underline t :weight 'normal)
   (font-lock-comment-face :foreground comments :slant 'normal)
   (font-lock-doc-face :foreground doc-comments :slant 'normal)
   (font-lock-function-call-face :foreground functions :slant 'normal)
   ;; Keep declarations slightly heavier, with independent reference styling.
   (font-lock-variable-name-face :foreground variables :weight 'semi-bold)
   (font-lock-variable-use-face :inherit nil :foreground fg :weight 'normal)
   ;; Eglot uses its variable/parameter faces for references as well.  Their
   ;; defaults inherit variable-name-face; declaration modifiers come first
   ;; in its face lists, so put declaration emphasis on those modifiers.
   (eglot-semantic-variable :inherit 'font-lock-variable-use-face)
   (eglot-semantic-parameter :inherit 'font-lock-variable-use-face)
   (eglot-semantic-declaration :weight 'semi-bold)
   (eglot-semantic-definition :weight 'semi-bold)
   ;; Eglot normally inherits bold for every occurrence of the symbol at point.
   ;; Use a background instead, preserving each occurrence's syntax weight.
   (eglot-highlight-symbol-face :inherit nil :background selection)
   (font-lock-property-name-face :foreground fg :weight 'normal)

   ;; Modeline and Solaire (Doom's slightly darker non-file buffers).
   (mode-line :background base3 :foreground fg :box nil)
   (mode-line-inactive :background bg-alt :foreground base6 :box nil)
   (header-line :background bg-alt :foreground fg :box nil)
   (solaire-hl-line-face :background line-bg :extend t)
   (solaire-mode-line-face :inherit 'mode-line)
   (solaire-mode-line-inactive-face :inherit 'mode-line-inactive)
   (doom-modeline-bar :background blue)
   (doom-modeline-bar-inactive :background base4)
   (doom-modeline-buffer-path :foreground base6 :weight 'normal)
   (doom-modeline-buffer-file :foreground fg :weight 'bold)
   (doom-modeline-buffer-project-root :foreground blue :weight 'normal)
   (doom-modeline-buffer-modified :foreground yellow)
   (doom-modeline-evil-normal-state :foreground base7)
   (doom-modeline-evil-insert-state :foreground green)
   (doom-modeline-evil-visual-state :foreground blue)

   ;; Company childframes, Vertico, and matching text.
   (company-tooltip-selection :background selection :foreground fg :weight 'normal)
   (company-tooltip-annotation :foreground base6)
   (company-tooltip-common :foreground blue :weight 'bold)
   (company-box-border :background base4)
   (vertico-current :background selection :foreground fg :extend t)
   (orderless-match-face-0 :foreground blue :weight 'bold)
   (orderless-match-face-1 :foreground base8 :weight 'bold)
   (orderless-match-face-2 :foreground green :weight 'bold)
   (orderless-match-face-3 :foreground base7 :weight 'bold)

   ;; Diredfl is enabled by your Dired module.  Keep metadata neutral so the
   ;; directory names, symlinks, and marked files are the useful accents.
   (dired-directory :foreground blue :weight 'normal)
   (dired-symlink :foreground teal :weight 'normal)
   (dired-marked :foreground yellow :background selection :inverse-video nil)
   (diredfl-dir-name :foreground blue :weight 'normal)
   (diredfl-dir-priv :foreground base6)
   (diredfl-file-suffix :foreground fg)
   (diredfl-date-time :foreground base6 :weight 'normal)
   (diredfl-number :foreground base6)
   (diredfl-read-priv :foreground base6)
   (diredfl-write-priv :foreground base6)
   (diredfl-exec-priv :foreground base7)
   (diredfl-link-priv :foreground base6)
   (diredfl-other-priv :foreground base6)
   (diredfl-rare-priv :foreground yellow)
   (diredfl-symlink :foreground teal)
   (diredfl-compressed-file-name :foreground fg)
   (diredfl-compressed-file-suffix :foreground base6)

   ;; Magit and ordinary diff buffers: restrained tints with stronger word
   ;; refinements.  Focused hunks change background without becoming bold.
   (diff-added :foreground green :background added-bg :extend t)
   (diff-removed :foreground red :background removed-bg :extend t)
   (diff-refine-added :foreground fg :background added-focus :inverse-video nil)
   (diff-refine-removed :foreground fg :background removed-focus :inverse-video nil)
   (diff-refine-changed :foreground fg :background selection :inverse-video nil)
   (magit-diff-added :foreground green :background added-bg :extend t)
   (magit-diff-removed :foreground red :background removed-bg :extend t)
   (magit-diff-added-highlight :foreground green :background added-focus :weight 'normal :extend t)
   (magit-diff-removed-highlight :foreground red :background removed-focus :weight 'normal :extend t)
   (magit-diff-context :foreground base7 :background bg :extend t)
   (magit-diff-context-highlight :foreground fg :background diff-section-bg :extend t)
   (magit-diff-hunk-heading :foreground base7 :background diff-heading-bg :extend t)
   (magit-diff-hunk-heading-highlight :foreground blue :background diff-heading-focus :weight 'bold :extend t)
   (magit-diff-file-heading-highlight :foreground fg :background diff-heading-bg :weight 'bold :extend t)
   (magit-diff-file-heading-selection :foreground blue :background diff-heading-focus :weight 'bold :extend t)
   (magit-diff-lines-heading :foreground yellow :background diff-heading-focus :extend t)
   (magit-diff-refine-added :foreground fg :background (doom-blend diff-green bg 0.46) :weight 'bold)
   (magit-diff-refine-removed :foreground fg :background (doom-blend diff-red bg 0.46) :weight 'bold)
   (magit-section-highlight :background diff-section-bg :extend t)
   (magit-section-heading :foreground blue :weight 'bold :extend t)
   (magit-branch-current :foreground blue :weight 'bold)
   (magit-branch-local :foreground base7)
   (magit-branch-remote :foreground green)
   (magit-filename :foreground fg)
   (magit-log-author :foreground base7)
   (magit-log-date :foreground base6)
   (magit-hash :foreground base6)

   ;; Org and Markdown headings use brightness and weight for hierarchy.
   (outline-1 :foreground fg :weight 'bold :extend t)
   (outline-2 :foreground blue :weight 'bold :extend t)
   (outline-3 :foreground base7 :weight 'bold :extend t)
   (outline-4 :foreground fg :weight 'normal :extend t)
   (outline-5 :foreground blue :weight 'normal :extend t)
   (outline-6 :foreground base7 :weight 'normal :extend t)
   (outline-7 :foreground base6 :weight 'normal :extend t)
   (outline-8 :foreground base6 :weight 'normal :extend t)
   (org-block :background bg-alt :extend t)
   (org-block-background :background bg-alt :extend t)
   (org-block-begin-line :foreground comments :background bg-alt :extend t)
   (org-code :foreground green)
   (org-todo :foreground yellow :weight 'bold)
   (org-done :foreground comments :weight 'normal)
   (org-table :foreground base7)
   (markdown-header-face :foreground blue :weight 'bold)
   (markdown-code-face :foreground green :background bg-alt)

   ;; Language details that otherwise introduce extra colors.
   (web-mode-block-control-face :foreground keywords)
   (web-mode-html-tag-face :foreground blue)
   (web-mode-html-tag-bracket-face :foreground base6)
   (web-mode-html-attr-name-face :foreground fg)
   (css-selector :foreground blue)
   (css-property :foreground fg)
   (rainbow-delimiters-depth-1-face :foreground base7)
   (rainbow-delimiters-depth-2-face :foreground base6)
   (rainbow-delimiters-depth-3-face :foreground base7)
   (rainbow-delimiters-depth-4-face :foreground base6)
   (rainbow-delimiters-depth-5-face :foreground base7)
   (rainbow-delimiters-depth-6-face :foreground base6)
   (rainbow-delimiters-depth-7-face :foreground base7)
   (rainbow-delimiters-depth-8-face :foreground base6)
   (rainbow-delimiters-depth-9-face :foreground base7))

  ;; Flycheck/Flymake, hl-todo, Eglot, tree-sitter syntax, vterm, and other
  ;; supported packages inherit Doom's faces with the muted palette above.
  ())

;;; doom-graphite-theme.el ends here
