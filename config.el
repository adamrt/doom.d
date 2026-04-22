;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Run 'doom sync' after modifying this file!

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq user-full-name "Adam Patterson"
      user-mail-address "adam@adamrt.com")
(setq doom-font (font-spec :family "Berkeley Mono" :size 24)
      doom-theme 'doom-one)
(setq mac-command-modifier      'meta
      ns-command-modifier       'meta
      mac-option-modifier       'super
      ns-option-modifier        'super
      mac-right-option-modifier 'none
      ns-right-option-modifier  'none)
(setq display-line-numbers-type nil
      org-directory "~/org/")
(setq eglot-ignored-server-capabilities '(:inlayHintProvider))

(after! projectile
  (setq projectile-switch-project-action 'projectile-vc))

(after! magit
  (setq magit-save-repository-buffers t))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "templates/.*\\.html\\'")))

;; This uses loopback and removes the need for GPG_TTY=$(tty).
(use-package! pinentry
  :init
  (setq epg-pinentry-mode 'loopback)
  (pinentry-start))

(after! apheleia
  ;; Djlint for Django templates
  (setf (alist-get 'djlint apheleia-formatters) '("djlint" "--reformat" "--profile=django" "-"))
  (setf (alist-get 'web-mode apheleia-mode-alist) '(djlint))

  ;; Ruff lint and format
  (setf (alist-get 'ruff-check apheleia-formatters) '("ruff" "check" "--fix" "--stdin-filename" filepath "-"))
  (setf (alist-get 'ruff-format apheleia-formatters) '("ruff" "format" "--stdin-filename" filepath "-"))
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-check ruff-format))
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-check ruff-format)))
