;;;; Catherine's Emacs

;;; Configuration

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "~/.eamcs/diary")
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(all-the-icons-ivy all-the-icons counsel doom-modeline-now-playing doom-modeline swiper ivy command-log-mode use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(set-face-attribute 'default nil :font "Ubuntu Mono" :height 120)
(load-theme 'wombat)

;;; Packages
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper) ("M-x" . counsel-M-x))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom((doom-modeline-height 15)))

(use-package nerd-icons)

;;; Keybinds
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; ESC quits prompts
