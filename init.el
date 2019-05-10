;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Main configuration file   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

;; melpa
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
         '("melpa"        . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)

;; needed in emacs versions < 27 
(if (version< emacs-version "27.0")
    (package-initialize nil))

;; if use-package is not installed, install it
(unless (package-installed-p 'use-package)
  (message "EMACS: installing use-package.el")
  (package-refresh-contents)
  (package-install 'use-package))

;; automatically install required packages
(require 'use-package)
(setq use-package-always-ensure t)

;; automatically update packages every 7 days
(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 7)
   (auto-package-update-maybe))

;; where to find user init files
(defconst user-init-dir
  (expand-file-name "elisp" user-emacs-directory))

;; function for loading user init files
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; load user init files
(load-user-file "common.el")
;;(load-user-file "theme.el")
(load-user-file "keys.el")
;;(load-user-file "org.el")
;;(load-user-file "magit.el")
;;(load-user-file "helm.el")
;;(load-user-file "clojure.el")
;;(load-user-file "prog.el")
;;(load-user-file "web.el")
;;(load-user-file "neotree.el")
;;(load-user-file "projectile.el")
;;(load-user-file "log.el")
;;(load-user-file "markdown.el")
;;(load-user-file "python.el")

;; custom configuration location
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;(setq mac-command-modifier 'control)