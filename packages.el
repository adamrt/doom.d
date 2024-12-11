;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Run doom/sync and restart emacs after modifying this file.

(package! pinentry)
(package! beacon)
(package! copilot
  :recipe (:host github
           :repo "copilot-emacs/copilot.el"
           :files ("*.el" "dist")))
