;; set up MELPA Repo {{{
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t) 
;; Comment/uncomment this line to enable MELPA Stable if desired. See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(setq package-enable-at-startup nil)
(package-initialize)
;;}}}

;; SOME STUFF ADDED BY EMACS {{{
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(dracula-theme markdown-mode evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; }}}

;; Use-Package, auto install packages {{{
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t)
(use-package dracula-theme
  :ensure t)
}}

;; THEME
(load-theme 'dracula t)

;; EVIL MODE
(require 'evil)
(evil-mode 1)
