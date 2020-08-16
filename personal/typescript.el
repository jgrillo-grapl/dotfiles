(require 'company-quickhelp)
(require 'flycheck)
(require 'lsp-mode)
(require 'lsp-ui)
(require 'lsp-clients)
(require 'typescript-mode)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(with-eval-after-load 'typescript-mode
  (defun jgrillo-ts-mode-defaults ()
    (interactive)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (company-quickhelp-mode +1))

  (setq
   jgrillo-ts-mode-hook 'jgrillo-ts-mode-defaults
   company-quickhelp-delay 0.1)

  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  (add-hook 'typescript-mode-hook 'lsp)
  (add-hook 'typescript-mode-hook (lambda () (run-hooks 'jgrillo-ts-mode-hook))))
