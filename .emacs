(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'magit 'evil 'helm 'magit 'powerline 'airline-themes 'auto-complete 'quickrun)

(setq custom-safe-themes t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(helm-mode t)
 '(package-selected-packages
   (quote
    (auto-complete helm powerline magit iedit evil-visual-mark-mode)))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-linum-mode t)

(require 'evil)
(evil-mode t)
(require 'powerline)
(require 'airline-themes)
(setq powerline-arrow-shape 'arrow)
(load-theme 'airline-cool)
(require 'helm-config)
(require 'quickrun)
(global-set-key (kbd "C-c r") 'quickrun)
(ac-config-default)
(global-set-key (kbd "C-x g") 'magit-status)
