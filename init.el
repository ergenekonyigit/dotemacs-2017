(setq inhibit-startup-message t)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-linum-mode t)
(set-frame-font "Source Code Pro 14" nil t)
(fset 'yes-or-no-p 'y-or-n-p)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

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
  :ensure t)

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
  solarized-theme 
  :ensure t 
  :config (load-theme 'solarized-dark t))
