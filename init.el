;; --------- TODOS --------- ;;
;; 1. installed helm & helm-projectile, but I'm not sure I set them up correctly. Make sure they are properly setup.

;; --------- Misc. --------- ;;

(setq indent-tabs-mode nil)
;; for some reason tab-stop-list is what emacs uses for the length of 'tabs'(in my case the number of spaces it should insert)
(setq tab-stop-list (number-sequence 2 120 2))
;; don't want the toolbar
(tool-bar-mode -1)
;; don't want scroll bars on side
(scroll-bar-mode -1)
;; highlight the current line
(global-hl-line-mode 1)


;; only here because list-packages doesn't work without it for some reason
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
 '(package-selected-packages
   '(cider undo-tree undo-fu paredit golden-ratio company helm-projectile helm-lsp lsp-ui lsp-mode treemacs-evil treemacs-projectile emmet-mode flycheck git-gutter evil-smartparens exec-path-from-shell format-all rainbow-delimiters doom-themes doom-modeline all-the-icons command-log-mode evil use-package)))

;; initalize pacakges 
(require 'package)
;; switched from https to http
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))

(setq make-backup-files nil) ;; I don't want ~ files. Maybe I should rethink this?
(package-initialize)


(unless package-archive-contents
  (package-refresh-contents))


;; TODO: which all packages to use-package. It's just way better than what I'm currently doing with downloading them
;; download use-package on non linux platforms... 
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t) 
  :config
  (auto-package-update-maybe)
  ;; (auto-package-update-at-time "09:00") ;; I don't want this to call me during the day
  )



;; evil stuff
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))


(use-package command-log-mode)


;; note: after installing the package you need to run the function: all-the-icons-install-fonts
(use-package all-the-icons)

;; this couldn't be up downloaded... but then I did a package refresh and it worked...
; it's still not displaying the icons and other things properly....
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package rainbow-delimiters)

(use-package format-all)


(use-package exec-path-from-shell)
(use-package evil-smartparens
  :hook
  (smartparens-enabled . evil-smartparens-mode) )
(use-package smartparens 
	 :hook
	 (smartparens-enabled . evil-smartparens-mode)
	 (js-mode . smartparens-mode))

(require 'smartparens-config)

;; TODO: git gutter doesn't update after commiting. I should update the the gutter when I save files? Or some other time
;; so I can get up to date information.
(use-package git-gutter
  :config
  (global-git-gutter-mode +1))

(use-package flycheck )
(use-package emmet-mode
  :hook
  (js-mode . emmet-mode))
(use-package treemacs-projectile )
(use-package treemacs-evil)
(use-package treemacs)
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq gc-cons-threshold (* 2 100000000))
  (setq read-process-output-max (* 2 (* 1024 1024)))
  (setq lsp-completion-provider :capf)
  (setq lsp-log-io nil)
  (setq lsp-enable-file-watchers nil)
  :hook
  (js-mode . lsp)
  (scss-mode . lsp)
  (css-mode . lsp)
  (mhtml-mode . lsp)
  :commands lsp)
(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package helm-lsp
  :commands helm-lsp-workspace-symbol)
(use-package helm-projectile)
(use-package doom-themes )
(use-package projectile
  :config 
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package company
  :config
  (setq company-minimum-prefix-length 1
      company-idle-delay 0.2)
  :hook
  (scss-mode . company-mode)
  )
(use-package golden-ratio
  :config
  (golden-ratio-mode 1)
)
(use-package rainbow-delimiters )
(use-package paredit) ;; don't know if I even use this shit....
;; TODO: see if I can opt out of this for default emacs stuff
(use-package undo-fu
  :config 
  (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))
(use-package undo-tree)
(use-package cider)

(use-package clojure-mode)


;; honeslty no idea if I can't just use the 'use-package' syntax here..
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)





;; set font - this font won't be available for other computers by default... so not sure what else I should default to???
;; (set-face-attribute 'default nil :font "Cartograph Cf")

;; not sure where to set this so just setting it here
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; need both 'display-line-numbers-type + global display-line numerb mode 1 IF I want relative line numbers globally
(setq display-line-numbers-type 'relative)
;; stuff here that I had in custom-set-variables
(global-display-line-numbers-mode 1)




;; --------- Custom colors for rainbow-delimiters --------- ;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))




;; --------- Mode Setup? / Kinda Random / Need to figure out what to do with these --------- ;;


;; sets up exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; i don't fully understand this, but i need it
;(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-program-name "/opt/homebrew/bin/aspell")
(add-hook 'text-mode-hook 'flyspell-mode)


(setq js-indent-level 2)



;; commented out helm-config because it was causing issue... but don't
;; know why this started happening
;; (require 'helm-config)
(helm-mode 1)

(global-auto-revert-mode t)

;; --------- Hooks --------- ;;

;; for rainbow parens in clojure mode
(add-hook 'clojure-mode-hook (lambda ()
			       (rainbow-delimiters-mode)
			       (smartparens-mode)
			       ))
;; golden-ratio didn't seem to work out of the box with evil mode
(add-hook 'window-selection-change-functions (lambda (arg_one) (golden-ratio)))


;; --------- Keybindings --------- ;;

;; TODO: move this into use-package declarations

;; use helm instead of default
(global-set-key (kbd "M-x") 'helm-M-x)

(defun open-init-file ()
  "Opens init.el for editing"
  ;; I need this interactive thing for some reason
  (interactive)
  (find-file "~/.emacs.d/init.el"))


;; TODOs:
;; - can't close treemacs from within the treemacs buffer
;; - file I'm looking at doesn't open up when I run this. e.g if I open
;; learn-gramming/course/overview.md the file explorer doesn't fully show
;; the file that I'm currently on. This happens when switching projects.
(evil-define-key 'normal' evil-normal-state-map
  (kbd "s-\\") (lambda () (interactive)
		 ;; doesn't work exactly how I want, but it's pretty close
                    (treemacs-display-current-project-exclusively)
                     ))


(define-key evil-treemacs-state-map (kbd "s-\\")   #'treemacs)

;; binds SPC + c to startup cider-jack-in
(evil-define-key nil evil-normal-state-map
  (kbd "SPC c")  'cider-jack-in)

;; binds SPC d to open my dotfile
(evil-define-key nil evil-normal-state-map
  (kbd "SPC d")  'open-init-file)

;; binds C-c e to
(evil-define-key nil evil-normal-state-map
  (kbd "SPC e")  'cider-eval-buffer)
;; switches to the windows last open buffer
(evil-define-key nil evil-normal-state-map
  (kbd "SPC TAB") 'evil-switch-to-windows-last-buffer)
;; same thing as above, but I want it to work when I'm in the motion state.
(evil-define-key 'motion evil-motion-state-map (kbd ".") 'evil-switch-to-windows-last-buffer)


(evil-define-key nil evil-normal-state-map
  (kbd "SPC g") 'cider-find-dwim)

