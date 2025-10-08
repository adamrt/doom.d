;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Run 'doom sync' after modifying this file!

(setq gc-cons-threshold 100000000) ;; 100mb
(setq read-process-output-max (* 1024 1024 3)) ;; 3mb

(setq user-full-name "Adam Patterson"
      user-mail-address "adam@adamrt.com")

;; Maximize the window on startup
(add-hook 'window-setup-hook #'toggle-frame-maximized)
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Berkeley Mono" :size 20)
      doom-big-font (font-spec :family "Berkeley Mono" :size 24))

(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;;
(use-package! treesit-auto
  :config
  (global-treesit-auto-mode)
  (setq treesit-auto-install 'prompt)) ;; ask before downloading grammars

(after! projectile
  (setq projectile-switch-project-action 'projectile-vc))

(after! magit
  (setq magit-save-repository-buffers t))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "templates/.*\\.html\\'")))

(after! apheleia
  ;; Djlint for Django templates
  (setf (alist-get 'djlint apheleia-formatters) '("djlint" "--reformat" "-"))
  (setf (alist-get 'web-mode apheleia-mode-alist) '(djlint))

  ;; Ruff lint and format
  (setf (alist-get 'ruff-check apheleia-formatters) '("ruff" "check" "--fix" "--stdin-filename" filepath "-"))
  (setf (alist-get 'ruff-format apheleia-formatters) '("ruff" "format" "--stdin-filename" filepath "-"))
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-check ruff-format))
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-check ruff-format)))

(use-package! pinentry
  :config
  (setq epg-gpg-program "gpg2")
  (setq epg-pinentry-mode 'loopback)
  :init
  ;; This shell command allows the agent to start and GPG_TTY to be set in this process.
  ;; Without this we don't pick up the environment since this isn't started with zshrc,
  ;; unless started from the command line.
  (shell-command "gpg-connect-agent /bye")
  (pinentry-start))

;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :bind (:map copilot-completion-map
;;               ("<tab>" . 'copilot-accept-completion)
;;               ("TAB" . 'copilot-accept-completion)
;;               ("C-TAB" . 'copilot-accept-completion-by-word)
;;               ("C-<tab>" . 'copilot-accept-completion-by-word)))

(setq mac-command-modifier      'meta
      ns-command-modifier       'meta
      mac-option-modifier       'super
      ns-option-modifier        'super
      mac-right-option-modifier 'none
      ns-right-option-modifier  'none)

;; global beacon minor-mode
(use-package! beacon)
(after! beacon (beacon-mode 1))

;; (after! lsp-mode
;;   (setq lsp-headerline-breadcrumb-enable t
;;         lsp-lens-enable t
;;         lsp-ui-sideline-enable t
;;         lsp-ui-sideline-show-hover t)

;;   (setq lsp-go-use-gofumpt t
;;         lsp-go-analyses '((nilness . t)
;;                           (unusedparams . t)
;;                           (unusedwrite . t)
;;                           (useany . t)
;;                           (unusedvariable . t))))

;; (add-hook 'go-mode-hook #'lsp-deferred)
;; Make sure you don't have other goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(map!
 (:map 'override
  :v "v" #'er/expand-region
  :v "V" #'er/contract-region))

;; (setqdap-auto-configure-mode t)
;; (after! dap-mode
;;   (require 'dap-cpptools))

;; (require 'dap-lldb)
;; (setq lsp-clangd-binary-path "/opt/homebrew/opt/llvm/bin/clangd")
;; (setq package-selected-packages '(realgud-lldb realgud))

;; (dap-register-debug-template
;;  "Heretic"
;;  (list :type "cppdbg"
;;        :request "launch"
;;        :name "Heretic"
;;        :MIMode "lldb"
;;        :MIDebuggerPath "/opt/homebrew/opt/llvm/bin/lldb"
;;        :program "/Users/adam/src/heretic/build/heretic"
;;        :cwd "/Users/adam/src/heretic/build"))

;; (map! :map dap-mode-map
;;       :leader
;;       :prefix ("d" . "dap")
;;       ;; basics
;;       :desc "dap next"          "n" #'dap-next
;;       :desc "dap step in"       "i" #'dap-step-in
;;       :desc "dap step out"      "o" #'dap-step-out
;;       :desc "dap continue"      "c" #'dap-continue
;;       :desc "dap hydra"         "h" #'dap-hydra
;;       :desc "dap debug restart" "r" #'dap-debug-restart
;;       :desc "dap debug"         "s" #'dap-debug
;;       :desc "dap disconnect"    "q" #'dap-disconnect

;;       ;; debug
;;       :prefix ("dd" . "Debug")
;;       :desc "dap debug recent"  "r" #'dap-debug-recent
;;       :desc "dap debug last"    "l" #'dap-debug-last

;;       ;; eval
;;       :prefix ("de" . "Eval")
;;       :desc "eval"                "e" #'dap-eval
;;       :desc "eval region"         "r" #'dap-eval-region
;;       :desc "eval thing at point" "s" #'dap-eval-thing-at-point
;;       :desc "add expression"      "a" #'dap-ui-expressions-add
;;       :desc "remove expression"   "d" #'dap-ui-expressions-remove

;;       :prefix ("db" . "Breakpoint")
;;       :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
;;       :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
;;       :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
;;       :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)
