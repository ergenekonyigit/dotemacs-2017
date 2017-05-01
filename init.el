(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-linum-mode t)
(global-hl-line-mode t)
(set-frame-font "Source Code Pro 14" nil t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)
(setq python-shell-completion-native-enable nil)

(when (memq window-system '(mac ns x)) 
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PYTHONPATH")

(unless (package-installed-p 'use-package) 
  (package-refresh-contents) 
  (package-install 'use-package))

(use-package 
  try 
  :ensure t)

(use-package 
  elisp-format 
  :ensure t)

(use-package 
  which-key 
  :ensure t 
  :config (which-key-mode))

(use-package 
  org-bullets 
  :ensure t 
  :config (add-hook 'org-mode-hook (lambda () 
				     (org-bullets-mode 1))))

(use-package 
  ace-window 
  :ensure t 
  :init (progn (global-set-key [remap other-window] 'ace-window) 
	       (custom-set-faces '(aw-leading-char-face ((t 
							  (:inherit ace-jump-face-foreground 
								    :height 3.0)))))))

(use-package
  counsel
  :bind (("M-y" . counsel-yank-pop)
  :map ivy-minibuffer-map
  ("M-y" . ivy-next-line)))

(use-package 
  ivy 
  :ensure t 
  :diminish (ivy-mode) 
  :bind (("C-x b" . ivy-switch-buffer)) 
  :config (ivy-mode 1) 
  (setq ivy-use-virtual-buffers t) 
  (setq ivy-display-style 'fancy))

(use-package 
  swiper 
  :ensure try 
  :bind (("C-s" . swiper) 
	 ("C-r" . swiper) 
	 ("C-c C-r" . ivy-resume) 
	 ("M-x" . counsel-M-x) 
	 ("C-x C-f" . counsel-find-file)) 
  :config (progn (ivy-mode 1) 
		 (setq ivy-use-virtual-buffers t) 
		 (setq ivy-display-style 'fancy) 
		 (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

(use-package 
  avy 
  :ensure t 
  :bind ("M-s" . avy-goto-char))

(use-package 
  auto-complete 
  :ensure t 
  :init (progn (ac-config-default) 
	       (global-auto-complete-mode t)))

(use-package 
  flycheck 
  :ensure t 
  :init (global-flycheck-mode t) 
  :config (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package 
  jedi 
  :ensure t 
  :init (add-hook 'python-mode-hook 'jedi:setup) 
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package 
  undo-tree 
  :ensure t 
  :init (global-undo-tree-mode))

(use-package 
  expand-region 
  :ensure t 
  :config (global-set-key (kbd "C-=") 'er/expand-region))

(use-package 
  solarized-theme 
  :ensure t 
  :config (load-theme 'solarized-light t))

(use-package 
  iedit 
  :ensure t)

(use-package
  web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("html" . (ac-source-words-in-buffer ac-source-abbrev))))	  
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode iedit iedit-mode expand-region undo-tree exec-path-from-shell jedi flycheck zenburn-theme which-key use-package try solarized-theme org-bullets org elisp-format counsel color-theme auto-complete ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))


(put 'narrow-to-region 'disabled nil)
