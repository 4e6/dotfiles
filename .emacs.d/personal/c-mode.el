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
  '(irony flycheck-irony))

(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
