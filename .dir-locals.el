(
 (nix-mode . (
	      (eval . (defun devos-find-matching-file (file-name)
			"Toggle the test segment in a flake-relative path"
			(setq file
			      (cond
			       ((string-match-p (regexp-quote "tests") file-name) (replace-regexp-in-string "tests\/"     ""             file-name nil 'literal))
			       ((string-match-p (regexp-quote "home" ) file-name) (replace-regexp-in-string "\\(home\\)"  "tests\/home"  file-name nil 'literal))
			       ((string-match-p (regexp-quote "host" ) file-name) (replace-regexp-in-string "\\(host\\)"  "tests\/host"  file-name nil 'literal))
			       ((string-match-p (regexp-quote "nixos") file-name) (replace-regexp-in-string "\\(nixos\\)" "tests\/nixos" file-name nil 'literal)) ;;;; capture-groups do not work
			       ))))


	      (eval . (defun devos-filename-relative-to-flake-root (file-name)
			"Convert an absolute path to a flake.nix-relative path"
			(replace-regexp-in-string (projectile-project-root) "" file-name nil 'literal)))


	      (eval . (defun devos-filename-absolute (file-name)
			"Convert a flake.nix-relative path to an absolute path"
			(projectile-expand-root file-name)))


	      (eval . (defun devos-file-existsp (file-name)
			(if (file-exists-p file-name)
			    file-name
			  (error "Alternate file does not exist."))))


	      (eval . (defun devos-return-alternate-filename (file-name)
			"Return the alternate file path if the file exists"
			(devos-filename-absolute
			 (devos-find-matching-file
			  (devos-filename-relative-to-flake-root file-name)))))


	      (eval . (defun fb*devos-toggle-between-test-and-implementation ()
			"Toggle between default.nix: testFile and implementation"
			(if-let (file-name (or buffer-file-name (bound-and-true-p list-buffers-directory)))
			    (switch-to-buffer (find-file-noselect
					       (devos-file-existsp
						(devos-return-alternate-filename file-name))
					       ))
			  (error "Couldn't switch to alternate file"))))


	      (eval . (defun fb/devos-toggle-between-test-and-implementation ()
			"Toggle between an implementation file and its test file."
			(interactive)
			(fb*devos-toggle-between-test-and-implementation)))


	      (eval . (general-define-key
		       :keymaps '(normal insert emacs)
		       :prefix "SPC"
		       :non-normal-prefix "M-SPC"
		       "kt" '(fb/devos-toggle-between-test-and-implementation :which-key "toggle test-impl")))
	      )))

;; * TODO TODOS
;; - generalize
;; - write Tests
;; - write Package
;; - as flake
;; * TODO remove
;; - projectile-project-root
;; - projectile-expand-root
