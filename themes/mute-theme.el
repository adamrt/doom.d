;;; mute-theme.el --- Quiet charcoal theme -*- lexical-binding: t; no-byte-compile: t; -*-

;; Copyright (C) 2026 Adam Patterson

;;; Commentary:
;;
;; A nearly monochrome dark theme with dusty blue keywords, green strings,
;; sand function declarations, and gray comments.

;;; Code:

(require 'doom-themes)

(def-doom-theme mute
    "A quiet, nearly monochrome charcoal theme."
  :background-mode 'dark

  ((bg         '("#282c34" "#262626" "black"))
   (bg-alt     '("#202325" "#1c1c1c" "black"))
   (fg         '("#d8dcd9" "#d0d0d0" "white"))
   (fg-alt     '("#959c98" "#949494" "brightblack"))
   (fg-dim     '("#959c98" "#949494" "brightblack"))
   (fg-soft    '("#b0b6b2" "#b2b2b2" "white"))
   (comment    '("#8a948f" "#8a8a8a" "brightblack"))

   (base0      '("#1b1e20" "#1c1c1c" "black"))
   (base1      bg-alt)
   (base2      '("#292d2f" "#303030" "brightblack"))
   (base3      '("#303537" "#303030" "brightblack"))
   (base4      '("#454c4f" "#444444" "brightblack"))
   (base5      '("#737d7d" "#767676" "brightblack"))
   (base6      fg-dim)
   (base7      fg-soft)
   (base8      '("#e4e8e4" "#e4e4e4" "brightwhite"))

   (blue       '("#8fb8d1" "#bcbcbc" "blue"))
   (dark-blue  '("#687f8d" "#808080" "blue"))
   (green      '("#9fbd8a" "#b2b2b2" "green"))
   (sand       '("#c9b891" "#d7af87" "yellow"))
   (red        '("#b58f8c" "#afafaf" "red"))
   (yellow     '("#b4aa91" "#afafaf" "yellow"))
   (teal       fg-soft)
   (cyan       blue)
   (dark-cyan  dark-blue)
   (magenta    fg-soft)
   (violet     magenta)
   (orange     yellow)
   (grey       base4)

   (highlight    blue)
   (vertical-bar base4)
   (selection    base3)
   (builtin      fg)
   (comments     comment)
   (doc-comments comment)
   (constants    fg)
   (functions    sand)
   (keywords     blue)
   (methods      fg)
   (operators    fg)
   (type         fg-soft)
   (strings      green)
   (variables    fg)
   (numbers      fg)
   (region       '("#3b464c" "#444444" "brightblack"))
   (error        red)
   (warning      yellow)
   (success      green)
   (vc-modified  yellow)
   (vc-added     green)
   (vc-deleted   red)

   (line-bg        '("#2b3032" "#303030" "brightblack"))
   (search-bg      '("#46555e" "#585858" "brightblack"))
   (added-bg       '("#39473f" "#3a4a3a" "green"))
   (added-hl       '("#405243" "#445544" "green"))
   (added-refine   '("#495f49" "#4e624e" "green"))
   (removed-bg     '("#483a3f" "#4a3a3a" "red"))
   (removed-hl     '("#554043" "#5a4040" "red"))
   (removed-refine '("#654749" "#684848" "red"))
   (section-bg     '("#303741" "#303840" "brightblack"))
   (heading-bg     '("#38424d" "#3a444e" "brightblack"))
   (heading-hl     '("#414e5a" "#44505a" "brightblack")))

  ((cursor :background fg)
   (fringe :background bg)
   (region :background region :extend t)
   (secondary-selection :background selection)
   (highlight :background selection :foreground fg)
   (hl-line :background line-bg :extend t)
   (shadow :foreground fg-dim)
   (vertical-border :foreground base4)
   (window-divider :foreground base4)
   (minibuffer-prompt :foreground blue)
   (link :foreground blue :underline t)
   (line-number :foreground base4)
   (line-number-current-line :foreground fg-dim :background line-bg)
   (trailing-whitespace :background removed-bg)

   ;; Search and matching.
   (isearch :background search-bg :foreground fg :weight 'bold)
   (lazy-highlight :background selection :foreground fg)
   (match :background selection :foreground blue :weight 'bold)
   (show-paren-match :inherit 'match)
   (show-paren-mismatch :background removed-hl :foreground red)

   ;; Syntax.
   (font-lock-comment-delimiter-face :foreground comment)
   (font-lock-comment-face :foreground comment :slant 'normal)
   (font-lock-doc-face :foreground comment)
   (font-lock-function-name-face :foreground sand)
   (font-lock-function-call-face :foreground fg :weight 'normal)
   (font-lock-keyword-face :foreground blue)
   (font-lock-preprocessor-face :foreground fg-soft)
   (font-lock-string-face :foreground green)
   (font-lock-type-face :foreground fg-soft)
   (font-lock-warning-face :foreground yellow)
   (font-lock-variable-name-face :foreground fg)
   (font-lock-variable-use-face :foreground fg)
   (font-lock-builtin-face :foreground fg)
   (font-lock-constant-face :foreground fg)
   (font-lock-number-face :foreground fg)
   (font-lock-escape-face :foreground fg)
   (font-lock-property-name-face :foreground fg)
   (font-lock-property-use-face :foreground fg)
   (font-lock-operator-face :foreground fg)
   (font-lock-negation-char-face :foreground fg)

   ;; Eglot semantic highlighting.
   (eglot-semantic-variable :inherit 'font-lock-variable-use-face)
   (eglot-semantic-parameter :inherit 'font-lock-variable-use-face)
   (eglot-semantic-number :inherit 'font-lock-number-face)
   (eglot-semantic-declaration :foreground sand)
   (eglot-semantic-definition :inherit 'eglot-semantic-declaration)
   (eglot-highlight-symbol-face :background selection)

   ;; Mode line.
   (mode-line :background selection :foreground fg :box nil)
   (mode-line-inactive :background bg-alt :foreground fg-dim :box nil)
   (mode-line-highlight :background base4)
   (header-line :background bg-alt :foreground fg)
   (which-func :foreground blue)

   ;; Doom modeline.
   (doom-modeline-bar :background blue)
   (doom-modeline-bar-inactive :background base4)
   (doom-modeline-buffer-path :foreground fg-dim :weight 'normal)
   (doom-modeline-buffer-file :foreground fg :weight 'bold)
   (doom-modeline-buffer-project-root :foreground blue :weight 'normal)
   (doom-modeline-buffer-modified :foreground yellow)
   (doom-modeline-evil-normal-state :foreground fg-soft)
   (doom-modeline-evil-insert-state :foreground green)
   (doom-modeline-evil-visual-state :foreground blue)

   ;; Completion and which-key.
   (icomplete-selected-match :background selection :foreground fg :weight 'bold)
   (completions-common-part :foreground blue)
   (completions-first-difference :foreground fg :weight 'bold)
   (completions-highlight :background selection)
   (completion-preview :foreground comment)
   (which-key-key-face :foreground blue)
   (which-key-group-description-face :foreground fg-soft)
   (which-key-command-description-face :foreground fg)
   (vertico-current :background selection :foreground fg :extend t)
   (company-tooltip-selection :background selection :foreground fg)
   (company-tooltip-annotation :foreground fg-dim)
   (company-tooltip-common :foreground blue :weight 'bold)
   (orderless-match-face-0 :foreground blue :weight 'bold)
   (orderless-match-face-1 :foreground fg :weight 'bold)

   ;; Diagnostics.
   (flymake-error :underline `(:style wave :color ,red))
   (flymake-warning :underline `(:style wave :color ,yellow))
   (flymake-note :underline `(:style wave :color ,fg-dim))

   ;; Dired and xref.
   (dired-directory :foreground blue)
   (dired-symlink :foreground fg-soft)
   (dired-marked :foreground yellow :background selection)
   (xref-file-header :foreground fg-soft :weight 'bold)
   (xref-line-number :foreground fg-dim)

   ;; Diffs and Magit.
   (diff-added :foreground green :background added-bg :extend t)
   (diff-removed :foreground red :background removed-bg :extend t)
   (diff-refine-added :foreground fg :background added-hl)
   (diff-refine-removed :foreground fg :background removed-hl)
   (diff-refine-changed :foreground fg :background selection)

   (magit-diff-added :inherit 'diff-added)
   (magit-diff-removed :inherit 'diff-removed)
   (magit-diff-added-highlight :foreground green :background added-hl :extend t)
   (magit-diff-removed-highlight :foreground red :background removed-hl :extend t)
   (magit-diff-context :foreground fg-soft :background bg :extend t)
   (magit-diff-context-highlight :foreground fg :background section-bg :extend t)
   (magit-diff-hunk-heading :foreground fg-soft :background heading-bg :extend t)
   (magit-diff-hunk-heading-highlight :foreground fg :background heading-hl :weight 'bold :extend t)
   (magit-diff-file-heading-highlight :background heading-bg :weight 'bold :extend t)
   (magit-diff-refine-added :foreground fg :background added-refine :weight 'bold)
   (magit-diff-refine-removed :foreground fg :background removed-refine :weight 'bold)
   (magit-section-highlight :background section-bg :extend t)
   (magit-section-heading :foreground blue :weight 'bold)
   (magit-branch-current :foreground blue :weight 'bold)
   (magit-branch-local :foreground fg-soft)
   (magit-branch-remote :foreground fg-soft)
   (magit-hash :foreground fg-dim)
   (magit-filename :foreground fg)
   (magit-log-author :foreground fg-soft)
   (magit-log-date :foreground fg-dim)))

;;; mute-theme.el ends here

