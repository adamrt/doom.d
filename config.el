;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Frames and appearance.
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Identity.
(setq user-full-name "Adam Patterson"
      user-mail-address "adam@adamrt.com")

(setq doom-font (font-spec :family "Berkeley Mono" :size 24)
      doom-theme 'mute)

(setq display-line-numbers-type nil
      org-directory "~/org/"
      treesit-font-lock-level 4)

;; macOS modifiers.
(setq mac-command-modifier 'meta
      ns-command-modifier 'meta
      mac-option-modifier 'super
      ns-option-modifier 'super
      mac-right-option-modifier 'none
      ns-right-option-modifier 'none)


;; GPG passphrases through the minibuffer.
(setq epg-pinentry-mode 'loopback)

;; Eglot.
(setq eglot-ignored-server-capabilities '(:inlayHintProvider))

;; Projects and version control.
(after! projectile
  (setq projectile-switch-project-action 'projectile-vc))

(after! magit
  (setq magit-save-repository-buffers t))

;; Django templates.
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "templates/.*\\.html\\'")))

;; Formatting.
(after! apheleia
  (setf (alist-get 'djlint apheleia-formatters) '("djlint" "--reformat" "--profile=django" "-"))
  (setf (alist-get 'web-mode apheleia-mode-alist) 'djlint)

  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-isort ruff))
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-isort ruff)))

