;; irony is a mode to work with CMake projects
;; 0. On the very first run (after the installation),
;; irony-mode will ask you to build and install irony-server.
;; To do so, type M-x irony-install-server RET
;; 1. Then you need to create a compilation database
;; https://github.com/Sarcasm/irony-mode#compilation-database
;;
;;   mkdir build
;;   cd build
;;   cmake ./.. -DCMAKE_EXPORT_COMPILE_COMMANDS=1
;;
;;  2. Then point to generated `compile_commands.json` with
;;
;;  M-x irony-cdb-json-add-compile-commands-path RET
;;  <path-to-build-dir-created-on-previous-step> RET
;;  compile_commands.json RET
(prelude-require-packages
  '(irony flycheck-irony stickyfunc-enhance))

;; sticky headers http://tuhdo.github.io/c-ide.html#orgheadline41
(require 'stickyfunc-enhance)
(add-hook 'c-mode-common-hook
          (lambda ()
            (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
            (semantic-mode 1)
            (global-semantic-idle-summary-mode 1)))

(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; style
(autoload 'google-set-c-style "google-c-style")
(autoload 'google-make-newline-indent "google-c-style")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'java-mode-hook
          (lambda ()
            (require 'google-c-style)
            (google-set-c-style)
            (google-make-newline-indent)
            (setq whitespace-line-column 100)
            (setq fill-column 100)))
