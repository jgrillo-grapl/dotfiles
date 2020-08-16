(require 'blacken)
(require 'company-capf)
(require 'company-quickhelp)
(require 'lsp-mode)
(require 'lsp-ui)
(require 'lsp-clients)
(require 'lsp-pyls)
(require 'yasnippet)

(prelude-require-packages
 '(blacken lsp-mode lsp-ui company-quickhelp yasnippet))

(setenv "IPY_TEST_SIMPLE_PROMPT" "1")

(setq
 lsp-pyls-plugins-autopep8-enabled nil
 lsp-pyls-plugins-flake8-enabled nil
 lsp-pyls-plugins-pylint-enabled nil
 lsp-pyls-plugins-rope-completion-enabled nil
 lsp-pyls-plugins-yapf-enabled nil
 lsp-pyls-plugins-flake8-max-line-length 88
 flycheck-flake8-maximum-line-length 88
 company-quickhelp-delay 0.1)

(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'python-mode-hook 'blacken-mode)
