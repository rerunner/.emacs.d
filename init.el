(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try :ensure t)
(use-package which-key :ensure t :config (which-key-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages
   (quote
    (flycheck modern-cpp-font-lock which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; The yasnippet package is a snippet extension for Emacs
;; and hence provides function templates for multiple languages,
;; including C++.
(require 'yasnippet)
(yas-global-mode 1)

;; The auto-complete mode is an auto-complete extension.
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; flycheck helps in syntax checking by reporting errors and warnings.
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; The modern c++ font package provides syntax highlight of the latest
;; C++ language.
(use-package modern-cpp-font-lock
  :ensure t)

;; Git integration using Magit, a git interface tool
;; A key bind using the keys Ctrl + x followed by g, allows us to see
;; the status of our files (untracked, staged, commits).
;; To see the commands of Magit, hit the question mark (?) key.
(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status)))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; tabs stops width 4
;;(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(customize-variable (quote tab-stop-list))
(global-set-key (kbd "TAB") 'tab-to-tab-stop)

;; show white space
(require 'whitespace)
(setq whitespace-style '(face tabs trailing tab-mark))
(add-hook 'prog-mode-hook 'whitespace-mode)


(c-add-style "stcm_style"
			 '("user"
			   (c-basic-offset . 4)		; Guessed value
			   (c-offsets-alist
				(arglist-cont . 0)		; Guessed value
				(arglist-intro . +)		; Guessed value
				(block-close . 0)			; Guessed value
				(case-label . 0)		; Guessed value
				(defun-block-intro . 0)	; Guessed value
				(defun-close . 0)		; Guessed value
				(defun-open . +)		; Guessed value
				(else-clause . 0)		; Guessed value
				(member-init-intro . +)	; Guessed value
				(statement . 0)			; Guessed value
				(statement-block-intro . 0) ; Guessed value
				(statement-case-intro . +) ; Guessed value
				(substatement . +)		   ; Guessed value
				(substatement-open . +)	   ; Guessed value
				(topmost-intro . 0)			   ; Guessed value
				(access-label . -)
				(annotation-top-cont . 0)
				(annotation-var-cont . +)
				(arglist-close . c-lineup-close-paren)
				(arglist-cont-nonempty . c-lineup-arglist)
				(block-open . 0)
				(brace-entry-open . 0)
				(brace-list-close . 0)
				(brace-list-entry . c-lineup-under-anchor)
				(brace-list-intro . +)
				(brace-list-open . 0)
				(c . c-lineup-C-comments)
				(catch-clause . 0)
				(class-close . 0)
				(class-open . 0)
				(comment-intro . c-lineup-comment)
				(composition-close . 0)
				(composition-open . 0)
				(cpp-define-intro c-lineup-cpp-define +)
				(cpp-macro . -1000)
				(cpp-macro-cont . +)
				(do-while-closure . 0)
				(extern-lang-close . 0)
				(extern-lang-open . 0)
				(friend . 0)
				(func-decl-cont . +)
				(inclass . +)
				(incomposition . +)
				(inexpr-class . +)
				(inexpr-statement . +)
				(inextern-lang . +)
				(inher-cont . c-lineup-multi-inher)
				(inher-intro . +)
				(inlambda . c-lineup-inexpr-block)
				(inline-close . 0)
				(inline-open . +)
				(inmodule . +)
				(innamespace . +)
				(knr-argdecl . 0)
				(knr-argdecl-intro . +)
				(label . 2)
				(lambda-intro-cont . +)
				(member-init-cont . c-lineup-multi-inher)
				(module-close . 0)
				(module-open . 0)
				(namespace-close . 0)
				(namespace-open . 0)
				(objc-method-args-cont . c-lineup-ObjC-method-args)
				(objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
				(objc-method-intro .
								   [0])
				(statement-case-open . 0)
				(statement-cont . +)
				(stream-op . c-lineup-streamop)
				(string . -1000)
				(substatement-label . 2)
				(template-args-cont c-lineup-template-args +)
				(topmost-intro-cont . c-lineup-topmost-intro-cont))))
