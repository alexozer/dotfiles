;;
;; Iniitialize use-package package system
;;

;; Set repositories
(require 'package)
(package-initialize)
(setq-default
 load-prefer-newer t
 package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package t))
(setq-default use-package-always-ensure t)

;;
;; Editor settings not specific to a package
;;

(setq-default
  use-dialog-box nil
  inhibit-splash-screen t
  visible-bell nil
  help-window-select t ;; Focus help buffers so I can close them with q

  vc-follow-symlinks nil ;; Don't warn about my symlinked dotfiles

  indent-tabs-mode nil
  tab-width 2

  make-backup-files nil
  undo-tree-auto-save-history t
  undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))

  ;; Scroll better?
  scroll-conservatively 1000 ;; Only 'jump' when moving this fa
  Scrollxa-Marginxa 4 ;; Scroll N lines to screen edge
  scroll-step 1 ;; Keyboard scroll one line at a time
  mouse-wheel-progressive-speed nil ;; Don't accelerate scrolling
  redisplay-dont-pause t ;; Don't pause display on input
  ;; Always redraw immediately when scrolling,
  ;; More responsive and doesn't hang!
  fast-but-imprecise-scrolling nil
  jit-lock-defer-time 0

  custom-file (expand-file-name "custom.el" user-emacs-directory)
)

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)
(save-place-mode) ;; Restore cursor position in file on open
(add-hook 'focus-out-hook #'garbage-collect)
(when (file-exists-p custom-file)
  (load custom-file))

;;
;; Package config
;;

(use-package evil
  :init
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-ex-substitute-global t)
  (setq evil-insert-state-message nil)
  (setq evil-visual-state-message nil)

  :config (evil-mode))

;; (use-package spacemacs-common
;;   :ensure spacemacs-theme
;;   :init
;;   (setq spacemacs-theme-org-height nil)
;;   (setq spacemacs-theme-org-highlight nil)
;;   :config
;;   (load-theme 'spacemacs-dark t))

(use-package doom-themes
  :config
  (load-theme 'doom-nord-light))

(use-package evil-commentary
  :config (evil-commentary-mode))

(use-package org
  :ensure org-plus-contrib
  :hook (org-mode . org-indent-mode)
  )

(use-package general
  :config

  (defun ozer/new-org-heading ()
    (interactive)
    (if (org-get-todo-state)
        (org-insert-todo-heading-respect-content)
      (org-insert-heading-respect-content)
      )
    (evil-append 1))

  (general-def 'motion
    ":" 'evil-repeat-find-char
    ";" 'evil-ex
    "j" 'evil-next-visual-line          
    "k" 'evil-previous-visual-line
    "H" 'evil-first-non-blank
    "L" 'evil-end-of-line)

  (general-def 
    :states 'normal
    :prefix "SPC"

    "i" (lambda ()
          (interactive)
          (find-file (expand-file-name "init.el" user-emacs-directory)))
    )

  (general-def org-mode-map
    :states 'normal

    "RET" 'ozer/new-org-heading)
  )
