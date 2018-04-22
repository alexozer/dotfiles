;; -*- lexical-binding: t; -*-

;; Increase garbage collection threshold to prevent frequent gc during startup
(setq gc-cons-threshold 64000000)
;; Restore after startup
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq-default use-package-always-ensure t
              indent-tabs-mode nil
              tab-width 2)

(setq
 scroll-conservatively 1000                     ;; Only 'jump' when moving this far
 scroll-margin 4                                ;; Scroll N lines to screen edge
 scroll-step 1                                  ;; Keyboard scroll one line at a time
 mouse-wheel-progressive-speed nil              ;; Don't accelerate scrolling

 redisplay-dont-pause t                         ;; Don't pause display on input

 ;; Always redraw immediately when scrolling,
 ;; More responsive and doesn't hang!
 fast-but-imprecise-scrolling nil
 jit-lock-defer-time 0
 )

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.cache/emacs/backup"))
      auto-save-file-name-transforms `((".*" "~/.cache/emacs/backup/" t))
      inhibit-splash-screen t
      visible-bell nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq use-dialog-box nil)
(fset 'yes-or-no-p 'y-or-n-p)

(save-place-mode) ;; Restore cursor position in file on open

(use-package which-key
  :init
  (setq which-key-idle-delay 0.4) ;; Same small delay as Spacemacs

  :config
  (which-key-mode)
  (which-key-enable-god-mode-support)
  )

(use-package ivy
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "")
  (setq ivy-use-selectable-prompt t)

  :config 
  (ivy-mode))

(use-package counsel
  :config (counsel-mode))

(use-package vlf)

(use-package evil
  :init
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)

  :config
  (evil-mode)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-global-set-key 'motion ":" 'evil-repeat-find-char)
  (evil-global-set-key 'motion ";" 'evil-ex)
  (evil-global-set-key 'motion "H" 'evil-first-non-blank)
  (evil-global-set-key 'motion "L" 'evil-end-of-line)
  (evil-define-key 'motion global-map (kbd "SPC") 'evil-execute-in-god-state)
  (evil-define-key 'god global-map [escape] 'evil-god-state-bail)

  (defvar leader-map (make-sparse-keymap) "Keymap for comma leader key shortcuts")
  (evil-global-set-key 'motion "," leader-map)
  (define-key leader-map "i" (lambda () (interactive) (find-file user-init-file)))
  (define-key leader-map "l" (lambda () (interactive) (find-file "~/doc/sync/org/life.org")))
  )
  

(use-package god-mode)
(use-package evil-god-state :diminish 'god-local-mode)

(use-package spacemacs-common
  :ensure spacemacs-theme
  :config
  (load-theme 'spacemacs-light t))

(use-package org
  :hook (org-mode . org-indent-mode)
  :config
  (setq org-log-done 'time)
  )

(use-package evil-org
  :after org
  :hook ((org-mode . evil-org-mode)
         (evil-org-mode
          . (lambda () (evil-org-set-key-theme '(textobjects insert navigation additional todo)))))

  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package olivetti
  :init (setq-default olivetti-body-width 100))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   '("086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "444238426b59b360fb74f46b521933f126778777c68c67841c31e0a68b0cc920" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(tao-theme evil-god-state evil-escape evil-org spacemacs-theme evil vlf swiper ivy which-key use-package))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :foundry "CYEL" :slant normal :weight normal :height 119 :width normal)))))
