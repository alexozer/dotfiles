(condition-case nil
    (progn
      (add-to-list 'default-frame-alist '(font . "Ubuntu Mono Derivative Powerline"))
      (set-face-attribute 'default nil :font "Ubuntu Mono Derivative Powerline")
      (set-face-attribute 'default (selected-frame) :height 110))
  (error nil))

(require 'package)
(setq package-enable-at-startup nil)
;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
