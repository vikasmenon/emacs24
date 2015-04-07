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

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'ido)
(ido-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wombat)))
 '(haskell-ghci-program-args (quote ("repl")))
 '(haskell-ghci-program-name "cabal")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote ghci))
 '(haskell-program-args (quote ("repl")))
 '(haskell-program-name "cabal")
 '(haskell-tags-on-save t)
 '(safe-local-variable-values (quote ((haskell-process-use-ghci . t) (haskell-indent-spaces . 4))))
 '(tool-bar-mode nil))

(global-set-key (kbd "C-x G") 'magit-status)

(autoload 'haskell-mode "init_haskell" nil t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
