(setq inhibit-startup-message t)
(add-to-list 'load-path "~/.emacs.d/init_scripts/")

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(rainbow-delimiters ))


;(require 'rainbow-delimiters)
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'ido)
(ido-mode t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(tool-bar-mode nil))

(global-set-key (kbd "C-x G") 'magit-status)

(autoload 'haskell-mode "init_haskell" nil t)

