;; --------- TODOS --------- ;;
;; 0. Dig into Evil mode more.
;; 1. figure out how to do formating on save for clojure files (clojure mode) only!
;; 2. Figure out how to make lsp mode work with all of my JS projects
;;    right now it's hard coded to the crowd-funded-lottery project
;; 3. installed helm & helm-projectile, but I'm not sure I set them up correctly. Make sure they are properly setup.
;; 4. Dig into treemacs more. See if I can change icons & create keybindgs for it so I can work with it more easily.



;; --------- Misc. --------- ;;

(setq indent-tabs-mode nil)
;; for some reason tab-stop-list is what emacs uses for the length of 'tabs'(in my case the number of spaces it should insert)
(setq tab-stop-list (number-sequence 2 120 2))
;; don't want the toolbar
(tool-bar-mode -1)

(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages")
			 ("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
;; gets rid of ~ files
(setq make-backup-files nil)
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(doom-gruvbox))
 '(custom-safe-themes
   '("d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" default))
 '(display-line-numbers 'relative)
 '(helm-completion-style 'emacs)
 '(package-selected-packages
   '(nodejs-repl exec-path-from-shell evil-smartparens smartparens git-gutter json-mode flycheck format-all emmet-mode treemacs-projectile treemacs-evil treemacs helm-lsp helm-projectile helm doom-themes lsp-ui projectile company lsp-mode golden-ratio rainbow-delimiters paredit undo-fu undo-tree cider clojure-mode evil)))




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




;; --------- Mode Setup? / Kinda Random --------- ;;


;; sets up exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq markdown-list-indent-width 2)

(require 'smartparens-config)
(add-hook 'js-mode-hook #'smartparens-mode) ;; always enable smart-parens in programming modes

;; TODO: git gutter doesn't update after commiting. I should update the the gutter when I save files? Or some other time
;; so I can get up to date information.
(global-git-gutter-mode +1)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(require 'golden-ratio)
(golden-ratio-mode 1)


(require 'nodejs-repl)


(require 'lsp-mode)
;; performance for lsp mode
(setq gc-cons-threshold (* 2 100000000))
(setq read-process-output-max (* 2 (* 1024 1024)))
(setq lsp-completion-provider :capf)
(setq lsp-log-io nil)
(setq lsp-enable-file-watchers nil)
;; performance for lsp mode
(add-hook 'js-mode-hook  (lambda ()
			   (lsp)
			   (emmet-mode)
			   (format-all-mode)
			   (smartparens-mode)))
;; have to put company mode here because for some reason it doesn't just start automatically when the server starts
(add-hook 'scss-mode-hook  (lambda ()
			     (lsp)
			     (format-all-mode)
                             (company-mode)))
(add-hook 'css-mode-hook  (lambda ()
			    (lsp)
			    (format-all-mode)
                            (company-mode)))
(add-hook 'mhtml-mode-hook  (lambda ()
			      (lsp)
                              (format-all-mode)
			      (emmet-mode)
                              (company-mode)))

(add-hook 'text-mode-hook 'flyspell-mode)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; I don't think I need this .....
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq js-indent-level 2)

(setq company-minimum-prefix-length 1
      company-idle-delay 0)

(require 'helm-config)
(helm-mode 1)

(require 'treemacs-evil)
(require 'treemacs)


;; --------- Hooks --------- ;;

(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
;; for rainbow parens in clojure mode
(add-hook 'clojure-mode-hook (lambda ()
			       (rainbow-delimiters-mode)
			       (smartparens-mode)
			       ))
;; golden-ratio didn't seem to work out of the box with evil mode
(add-hook 'window-selection-change-functions (lambda (arg_one) (golden-ratio)))

;; TODO # 2 : integrate https://github.com/purcell/exec-path-from-shell
;; (add-to-list 'exec-path "/Users/sasacocic/development/crowd-funded-lottery/front/node_modules/.bin")

;; auto-fill-mode will make my lines wrap when they get too long.
;; Not sure how to change the line length tho :(
(add-to-list 'markdown-mode-hook #'auto-fill-mode)

;; easily clear the nodejs repl buffer
(add-to-list 'nodejs-repl-mode-hook (lambda ()
                                      (define-key nodejs-repl-mode-map (kbd "M-SPC k") 'comint-clear-buffer) ))




;; --------- Misc. --------- ;;
;; no idea why this is in here. I did set it though and I don't know why
;; should be using the exec-path-from-shell package/plugin


;; using undo-fu package for evil mode, which requires I set these key bindings.
(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)




;; --------- Keybindings --------- ;;

;; use helm instead of default
(global-set-key (kbd "M-x") 'helm-M-x)

(defun open-init-file ()
  "Opens init.el for editing"
  ;; I need this interactive thing for some reason
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun node-eval-region-mine ()
  "evaultae a region of JavaScript code in the nodejs-repl"
  ;; (nodejs-repl)
  )




;; https://github.com/emacs-evil/evil - has good documentation in the Documentation section
;; in the github page
(evil-define-key 'visual' evil-visual-state-map (kbd "SPC r e") 'nodejs-repl-send-region)

;; TODOs:
;; - can't close treemacs from within the treemacs buffer
;; - file I'm looking at doesn't open up when I run this. e.g if I open
;; learn-gramming/course/overview.md the file explorer doesn't fully show
;; the file that I'm currently on. This happens when switching projects.
(evil-define-key 'normal' evil-normal-state-map
  (kbd "SPC f t") (lambda () (interactive)
                    (treemacs)
                    (treemacs-display-current-project-exclusively)
                     ))

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

(evil-define-key nil evil-normal-state-map
  (kbd "SPC g") 'cider-find-dwim)

;; TODO: remap this to something else
;;(evil-define-key nil evil-normal-state-map
;;  (kbd "SPC f") 'cider-format-buffer)
;; ughhh why the fuck is this here. It was automatically added.
(put 'erase-buffer 'disabled nil)

;; --------- Functions --------- ;;

;; does add-to-list modify the list or create a new list?

;; TODO: if projdctile-known-projects isn't there then this will fail.
;; TODO: this is a terrible solution. I've already spent quite a bit of time on this already, but
;; TODO: if a project doesn't have its node_modules dir in it's front dir then LSP won't work.
;; TODO: I don't think this works the way I expect, which is for it to pick the directory which
;; it is in, but instead it just picks the first on it finds from the projects so this is really
;; just wasting time
(defun add_node_modules_to_exec_path ()
  "if I'm in a projectile project then search for a node_modules directory"

  (dolist
      (proj (mapcar (lambda (path)
                      (concat (expand-file-name path) "front/node_modules/.bin")) projectile-known-projects))
    ;; adding t at the end will make it append rather than push to front
    (add-to-list 'exec-path proj t))
  )

;; (add_node_modules_to_exec_path)
