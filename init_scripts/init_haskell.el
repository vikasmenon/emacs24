;; Haskell customizations. Move to a separate init_haskell.el
;; Inspiration: https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md
;; Cabal requirements: 
;; cabal install happy hasktags stylish-haskell present ghc-mod hlint hoogle structured-haskell-mode
;; Dynamically install emacs packages if unavailable
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(company-ghc haskell-mode shm))

(let ((my-cabal-path "C:/Users/Mona/AppData/Roaming/cabal/bin"))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(push "~/.emacs.d/init_scripts/haskell" load-path)
(load "~/.emacs.d/init_scripts/haskell/pretty_haskell.el")
(add-hook 'haskell-mode-hook 'haskell-unicode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(require 'haskell-mode)

(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

; Structured haskell mode
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'haskell-mode-hook (cua-selection-mode nil))

(autoload 'ghc-init' "ghc" nil t)
(autoload 'ghc-debug' "ghc" nil t )
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))


(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 ;'(haskell-ghci-program-args (quote ("repl")))
 ;'(haskell-ghci-program-name "cabal")
 ;'(haskell-process-auto-import-loaded-modules t)
 ;'(haskell-process-log t)
 ;'(haskell-process-suggest-remove-import-lines t)
 ;'(haskell-process-type (quote cabal-repl))
 ;'(haskell-program-args (quote ("repl")))
 ;'(haskell-program-name "cabal")
 ;'(haskell-tags-on-save t)
 '(safe-local-variable-values (quote ((haskell-process-use-ghci . t) (haskell-indent-spaces . 4))))
 '(tool-bar-mode nil))

(custom-set-variables
  '(haskell-process-type 'ghci)
  '(haskell-program-name "cabal")
  '(haskell-program-args '("repl"))
  '(haskell-ghci-program-name "cabal")
  '(haskell-ghci-program-args '("repl"))
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t)
  '(haskell-tags-on-save t)
)
