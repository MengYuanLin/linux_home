;; -*- coding: utf-8; mode: emacs-lisp; -*-


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq package-archives
      `(("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; (setq inferior-lisp-program "/usr/bin/clisp")
(setq inferior-lisp-program "/usr/bin/sbcl")

;; -*-*- For "slime":
(add-to-list 'load-path "/usr/share/common-lisp/source/slime/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(require 'slime-autoloads)
;; -*-  Also setup the slime-fancy contrib_
(slime-setup '(slime-fancy slime-asdf))
(add-to-list 'slime-contribs 'slime-fancy)
(load-file "/home/mengyuan/.emacs.d/my:slime.el")

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(add-hook 'slime-load-hook
	  #'(lambda ()
	      (define-key slime-prefix-map (kbd "M-h")
		'slime-documentation-lookup)))
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(load-library "~/.emacs.d/elpa/linum-relative-0.4/linum-relative.elc")

;; -*-*-
;; -*- export FRAMEBUFFER=/dev/fb0 && fbterm -- env TERM=fbterm tmux
;; -*- for T in `l /usr/share/terminfo/*/`; do C=$(infocmp "${T##*/}"
;; -*-		2>/dev/null | egrep -i "colors#256"); if [ -n "$C" ]; then printf
;; -*-		"${T##*/}:\t$C\n">>/tmp/tmux-1000/term_256color; fi; done; echo
;; -*- alias emacs='TERM=rxvt-unicode-256color emacs'
;; -*- alias emacs='TERM=rxvt-256color emacs'
;; -*- alias emacs='TERM=screen-256color emacs'
;; -*- alias emacs='TERM=xterm-256color emacs'
;; -*- alias emacs='TERM=screen-256color-bce emacs'
;; -*- alias emacs='TERM=screen-256color-bce-s emacs'
(require 'color-theme)
(color-theme-initialize)

(if command-line-processed
    (progn
      ;; (load-theme 'ample-flat)
      ;; (load-theme 'misterioso)
      ;; (load-theme 'tango-dark)
      ;; (load-theme 'tango)
      ;; (load-theme 'tsdh-dark)
      ;; (load-theme 'wheatgrass)
      ;; (load-theme 'wombat)
      ;; (load-theme 'avk-darkblue-yellow)
      ;; (load-theme 'avk-darkblue-white)
      ;; (load-theme 'avk-daylight)
      ;; (load-theme 'atom-dark)
      ;; (load-theme 'badger)
      ;; (load-theme 'badwolf)
      ;; (load-theme 'distinguished)
      ;; (load-theme 'darkane)
      (load-theme 'darkburn)
      ;; (load-theme 'base16-google-dark)
      ;; (load-theme 'base16-tomorrow-night)
      ;; (color-theme-bharadwaj-slate)
      ;;(autoload 'color-theme-approximate-on "color-theme-approximate")
      ;; (color-theme-approximate-on)
      ;;(set-face-background 'mode-line "brightblack")
      ;;(set-face-background 'mode-line-inactive "brightcyan")
      ;;(set-face-background 'mode-line-buffer-id nil)
      ;;(set-face-foreground 'mode-line "brightcyan")
      ;;(set-face-foreground 'mode-line-inactive "brightblack")
      ;;(set-face-foreground 'mode-line-buffer-id "brightyellow")
      ;;(color-theme-emacs-21)
      ;;(color-theme-scintilla)
      ;;(color-theme-xemacs)
      ;;(color-theme-subtle-hacker)
      ;;(color-theme-ramangalahy)
      (setq global-hl-line-mode nil)
      ;; -*- mplayer
      (defun mplayer (FILE)
	"使用 mplayer 播放本地媒体文件。"
	(interactive "f^Media file: ")
	(async-shell-command (format "mplayer -ao alsa -vo fbdev2 -vfm ffmpeg -lavdopts \
	   lowres=0:fast:skiploopfilter=all -x 1280 -y 670 -zoom -fs \
	   -really-quiet %s" FILE))
	(switch-to-prev-buffer)
	(delete-other-windows)))

    (setq global-hl-line-mode t)
    ;; -*- mplayer
    (defun mplayer (FILE)
      "使用 mplayer 播放本地媒体文件。"
      (interactive "f^Media file: ")
      (async-shell-command (format "mplayer -ao alsa -vfm ffmpeg -lavdopts \
	   lowres=0:fast:skiploopfilter=all -zoom -fs \
	   -really-quiet %s" FILE))
      (switch-to-prev-buffer)
      (delete-other-windows))
    )
;; -*-*-
;; 透明背景
;; 另一种方法是：alias emacs='emacs -bg "unspecified-bg"'
;; (set-background-color "unspecified-bg")

;;(autoload 'color-theme-approximate-on "color-theme-approximate")
;;(color-theme-approximate-on)

(setq linum-relative-format "%2s| "
      linum-relative-current-symbol ""
      linum-relative-mode t
      transient-mark-mode t)
(linum-relative-on)

;;  (progn
;;    (add-to-list 'default-frame-alist
;;		 '(font . "DejaVu Sans Mono-18"))
;;    (add-to-list 'initial-frame-alist
;;		 '(font . "DejaVu Sans Mono-18"))
;;    (set-frame-font "DejaVu Sans Mono-18" nil t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffer-file-coding-system (quote utf-8) t)
 '(column-number-mode t)
 '(cursor-type (quote (bar . 5)))
 '(custom-safe-themes
   (quote
    ("ce557950466bf42096853c6dac6875b9ae9c782b8665f62478980cc5e3b6028d" "da25a25dfe8638669d76c7f468630973ab667d0ea02c6e1d3bec1b620822e581" default)))
 '(default-directory "~/documents/" t)
 '(default-input-method "eim-wubi")
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(emacs-goodies-el-defaults t)
 '(enable-recursive-minibuffers t)
 '(global-linum-mode t)
 '(hippie-expand-try-functions-list
   (quote
    (senator-try-expand-semantic try-expand-dabbrev-visible try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name try-complete-file-name-partially try-expand-list try-expand-list-all-buffers try-expand-line try-expand-line-all-buffers try-complete-lisp-symbol try-complete-lisp-symbol-partially try-expand-whole-kill)))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(kill-whole-line t)
 '(line-number-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(sendmail-coding-system (quote utf-8) t)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(startup-screen-inhibit-startup-screen t t)
 '(tool-bar-mode nil)
 '(tool-bar-position (quote right))
 '(track-eol t)
 '(user-full-name "MengYuan Lin")
 '(user-mail-address "it@mengyuan.ml")
 '(visible-bell t))
;; (progn tool-bar-mode -1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(split-window nil nil 'right)


;; -*-*- For "lisp-mode" and "emacs-lisp-mode":
;; -*-
(add-hook 'emacs-lisp-mode-hook
	  (lambda nil
	    (anzu-mode)
	    (set-fill-column 72)
	    (auto-fill-mode t)))
(add-hook 'lisp-mode-hook
	  (lambda nil
	    (anzu-mode)
	    (set-fill-column 72)
	    (auto-fill-mode t)))


;; -*-*- For "star dict"
(require 'sdcv-mode)
(global-set-key (kbd "C-c d") 'sdcv-search)

(require 'on-screen)
(on-screen-global-mode +1)
(add-hook 'Info-mode-hook
	  (lambda ()
	    (on-screen-mode)
	    (anzu-mode)))

;; -*-*- For w3m:
(require 'w3m-load)
(require 'w3m-search)
(require 'w3m)
(setq w3m-new-session-url "http://cn.bing.com"
      browse-url-browser-function 'w3m-browse-url
      browse-url-new-window-flag t
      w3m-use-cookies t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'browse-url-interactive-arg "browse-url")
;; -*- optional keyboard short-cut
;; -*- 用 "C-h v w3m-search-engine-alist" 查看搜索引擎列表
(add-hook 'w3m-mode-hook
	  (lambda ()
	    (auto-fill-mode)
	    (anzu-mode)
	    ;; (setq-local on-screen-highlight-method 'shadow)
	    (setq-local on-screen-highlight-method 'narrow-line)
	    (local-set-key "\C-cy"
			   (lambda (directory)
			     "w3m search by engine: \"packages.ubuntu.com\"."
			     (interactive "^DDownload to: ")
			     (let ((url (w3m-anchor)))
			       (string-match "http://v\.youku\.com/v_show/id_[^/=.]+"
					     url)
			       (if (stringp (match-string 0 url))
				   (async-shell-command
				    (format "cd %s && /opt/downloads/dl.sh -f -Fflvhd -n2 -l %s"
					    directory
					    (read-from-minibuffer "URL: "
								  url)))
				 nil))))))
(add-hook 'w3m-display-hook
	  (lambda (url)
	    (auto-fill-mode)
	    ;; (set-face-background 'w3m-tab-selected "brightblack")
	    ;; (set-face-background 'w3m-tab-selected-retrieving "brightred")
	    ;; (set-face-background 'w3m-tab-unselected "white")
	    ;; (set-face-background 'w3m-tab-unselected-retrieving "brightwhite")
	    (let ((buffer-read-only nil))
	      (delete-trailing-whitespace))))

;; alltheweb
(global-set-key (kbd "\C-csa")
		(lambda (word)
		  "w3m search by engine: \"www.alltheweb.com\"."
		  (interactive "sSearch ATW: ")
		  (w3m-search "alltheweb-cn" word)))
;; bing
(global-set-key (kbd "\C-csb")
	       (lambda (word)
		 "w3m search by engine: \"cn.bing.com\"."
		 (interactive "sSearch: ")
		 (w3m-search "bing" word)))
;; dogpile
(global-set-key "\C-csd"
	       (lambda (word)
		 "w3m search by engine: \"www.dogpile.com\"."
		 (interactive "sSearch dogpile: ")
		 (w3m-search "dogpile" word)))

;; google
(global-set-key "\C-csg"
	       (lambda (word)
		 "w3m search by engine: \"www.google.co.jp\"."
		 (interactive "sSearch googlejp: ")
		 (w3m-search "google.jp" word)))

;; soku
(global-set-key "\C-css"
	       (lambda (word)
		 "w3m search by engine: \"www.soku.com\"."
		 (interactive "sSearch soku: ")
		 (w3m-search "soku" word)))

;; emacswiki
(global-set-key "\C-cse"
	       (lambda (word)
		 "w3m search by engine: \"www.emacswiki.org\"."
		 (interactive "sSearch emacswiki: ")
		 (w3m-search "emacswiki" word)))

;; ubuntu-pkg: search in descript.
(global-set-key "\C-csA"
	       (lambda (word)
		 "w3m search by engine: \"packages.ubuntu.com\"."
		 (interactive "sSearch debpkg-descript: ")
		 (w3m-search "debpkg-descript" word)))

;; ubuntu-pkg: search in package name.
(global-set-key "\C-csp"
	       (lambda (word)
		 "w3m search by engine: \"packages.ubuntu.com\"."
		 (interactive "sSearch debpkg-names: ")
		 (w3m-search "debpkg-pname" word)))

;; ubuntu-pkg: search in contents (file name).
(global-set-key "\C-csf"
	       (lambda (word)
		 "w3m search by engine: \"packages.ubuntu.com\"."
		 (interactive "sSearch debpkg-contents: ")
		 (w3m-search "debpkg-fname" word)))

;; javadoc:
(global-set-key "\C-csj"
	       (lambda (word)
		 "w3m search by engine: \"docs.oracle.com\"."
		 (interactive "sSearch javadocs: ")
		 (w3m-search "javadoc" word)))

;; yahoo_cn:
(global-set-key "\C-csy"
	       (lambda (word)
		 "w3m search by engine: \"yahoo.com.cn\"."
		 (interactive "sSearch yahoo cn: ")
		 (w3m-search "yahoo_cn" word)))

;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)
(global-set-key "\C-xw" 'w3m-browse-url)
(setq w3m-search-engine-alist
      '(("bing" "http://cn.bing.com/search?q=%s&go=SUBMIT&qs=ds")
	("google.jp" "https://www.google.co.jp/search?hl=en&q=%s")
	("alltheweb-cn" "http://www.alltheweb.com/search?q=%s&web&_sb_lang=cn&ei=UTF-8&nojs=1#web")
	("javadoc"
	 "https://www.google.co.jp/search?hl=en&q=site:'docs.oracle.com'+inurl:'javase/8/docs/api'+%s#ires")
	("emacswiki" "https://search.yahoo.com/search?p=%s&vs=https://www.emacswiki.org/&ei=UTF-8&nojs=1#web")
	("soku" "http://www.soku.com/search_video/q_%s")
	("yahoo_cn"
	 "http://www.yahoo.com.cn/search?p=%s&ei=UTF-8&nojs=1#web")
	("debpkg-descript" "http://packages.ubuntu.com/search?keywords=%s&searchon=all&suite=all&section=all&exact=1&lang=zh-cn#psearchnoresult")
	("debpkg-pname" "http://packages.ubuntu.com/search?keywords=%s&searchon=names&suite=all&section=all&exact=1&lang=zh-cn#psearchnoresult")
	("debpkg-fname" "http://packages.ubuntu.com/search?keywords=%s&searchon=contents&suite=xenial&arch=any&lang=zh-cn#pcontentsres")
	;; http://www.dogpile.com/search/web?fcoid=417&fcop=topnav&fpid=27&q=%s&ql=chinese#horizontalNavigation
	("dogpile" "http://www.dogpile.com/search/web?q=%s&fcoid=1498&fcop=results-main&fpid=2&qlnk=True#webResults")
	))
(setq w3m-search-default-engine "alltheweb-cn")

(require 'starttls)
(setq tls-program '("gnutls-cli --priority NORMAL:%COMPAT -p %p %h"))
(setq starttls-gnutls-program "gnutls-cli --priority NORMAL:%COMPAT")
(setq starttls-use-gnutls t)
(setq starttls-extra-arguments '("--priority NORMAL:%COMPAT"))

;; -*-*- 有关 smtpmail 发送邮件配置
;; -*- web url: http://cvs.savannah.gnu.org/viewvc/emacs/emacs/lisp/mail/smtpmail.el?view=log
;; -*- download: http://cvs.savannah.gnu.org/viewvc/*checkout*/emacs/emacs/lisp/mail/smtpmail.el
(require 'smtpmail)

(setq smtpmail-stream-type 'starttls)

(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)

;; -*- Don’t bother to set this unless you have get an error like:
;; -*-		Sending failed; SMTP protocol error
;; -*- Do not set this variable unless your server complains.
;; (setq smtpmail-local-domain nil)
;; (setq smtpmail-sendto-domain nil)

(setq smtpmail-default-smtp-server "smtp-mail.outlook.com")
(setq smtpmail-smtp-server "smtp-mail.outlook.com")
(setq smtpmail-smtp-service 587)
;; (setq smtpmail-debug-info t)
;; -*- It is usually only useful together with smtpmail-debug-info.
;; -*- Note that this may cause mail delivery to take
;; -*- considerable time if the final destination cannot accept mail.
;; (setq smtpmail-debug-verb t)

;; -*-*_ ~/.authinfo 文件格式，用户名/密码包含特殊符号时必须用双括号起来
;; -*- machine smtp-mail.outlook.com login "pop4567@msn.com" password "密码填这里" port 587
(require 'auth-source)
(setq auth-sources '("~/.authinfo"))
;; -*- 以上 ~/.authinfo 文件格式 或者 下面文本格式 二选一
;; (setq smtpmail-auth-credentials ; or use ~/.authinfo
;;       '(("smtp-mail.outlook.com" 587 "LOGIN_USER" "LOGIN_PASSWORD")))
;; (setq smtpmail-starttls-credentials
;;       '(("smtp-mail.outlook.com" 587 "~/.my_smtp_tls.key" "~/.my_smtp_tls.cert")))

;; (setq tls-program '("gnutls-cli --priority NORMAL:%COMPAT -p %p %h"))
;; (setq starttls-gnutls-program "gnutls-cli --priority NORMAL:%COMPAT")
;; (setq starttls-use-gnutls t)
;; (setq starttls-extra-arguments '("--priority NORMAL:%COMPAT"))

;; -*-*- 下文是五笔输入法相关配置
;; -*- 设置: '(default-input-method "eim-wubi") 按 C-\ 就可以使用了
;; -*- 相关的网址:
;; -*- 源码: https://github.com/wenbinye/emacs-eim#user-content-eim--emacs-input-method
;; -*- 下载: https://github.com/wenbinye/emacs-eim/archive/master.zip
;; -*- 安装目录: ~/.emacs.d/site-lisp/elm
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(autoload 'eim-use-package "eim" "Another emacs input method")
;; Tooltip 暂时还不好用
(setq eim-use-tooltip nil)

(register-input-method
 "eim-wubi" "euc-cn" 'eim-use-package
 "五笔" "汉字五笔输入法" "wb.txt")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" "py.txt")

;; 用 ; 暂时输入英文
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)

;; -*-*- 另外一种五笔输入法
;; -*- 设置: '(default-input-method "chinese-wubi") 按 C-\ 就可以使用了
;; -*- 相关的网址:
;; -*- 源码: http://daiyuwen.freeshell.org/gb/wubi/wubi.html
;; -*- 下载: http://daiyuwen.freeshell.org/gb/wubi/wubi.tar.gz
;; -*- 安装目录: ~/.emacs.d/site-lisp/wubi
(require 'wubi)
(wubi-load-local-phrases) ; add user's Wubi phrases

(register-input-method
 "chinese-wubi" "Chinese-GB" 'quail-use-package
 "WuBi" "WuBi"
 "wubi")

;; (setq default-input-method "eim-wubi")


(require 'chinese-pyim)
;; (require 'chinese-pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
;; (chinese-pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设
;; 置
(chinese-pyim-wbdict-gb2312-enable)
(chinese-pyim-wbdict-gbk-enable)
(setq pyim-default-scheme 'wubi
      pyim-page-length 9
      ;; 1. 使用 popup 包来绘制选词框 （emacs overlay 机制）
      pyim-page-tooltip 'popup
      ;; 2. 使用 pos-tip 包来绘制选词框（emacs tooltip 机制）
      pyim-page-tooltip 'pos-tip
      pyim-page-style 'one-line)
(add-hook 'emacs-startup-hook
	  #'(lambda () (pyim-restart-1 t)))

;; (require 'chinese-pyim-greatdict)
;; (chinese-pyim-greatdict-enable)

;; (setq default-input-method "eim-wubi")
(setq default-input-method "chinese-pyim")


;; -*-*- 用于自制粘贴 soku 视频链接
(fset 'cpurl
      "ku")
(fset 'psurl
      "\C-y\C-[y\C-m")


(add-hook 'java-mode-hook
	  (defun jcompile (RUN)
	    (setq-local cmd (format "javac %s" buffer-file-name))
	    (if RUN
		(async-shell-command
		 (format
		  "%s && class='%s' && java ${class##*\/}"
		  cmd (substring buffer-file-name 0 -5)))
		(async-shell-command cmd)) ))


(setq Buffer-menu-mode-hook nil)
(add-hook 'Buffer-menu-mode-hook
	  (lambda ()
	    (local-set-key (kbd "RET")
			   (lambda ()
			     (interactive)
			     (Buffer-menu-other-window)
			     (delete-other-windows-vertically)
			     (kill-buffer "*Buffer List*")))
	    (local-set-key (kbd "o")
			   (lambda ()
			     (interactive)
			     (Buffer-menu-view-other-window)
			     (delete-other-windows-vertically)
			     (kill-buffer "*Buffer List*")))
	    (local-set-key (kbd "q")
			   (lambda ()
			     (interactive)
			     (kill-buffer-and-window)))))


(defun get-bing-bgimg ()
  (interactive)
  (let ((URL nil))
    (setq URL (shell-command-to-string "w3m -dump_source cn.bing.com | zcat - | grep \
'g_img=' | sed -E 's/.+g_img=\\{url[^\"]+\"/http:\\/\\/www.bing.com/g' | sed \
-E 's/jpg.+/jpg/g'"))
    (async-shell-command (format "axel -a -n2 -o ~/pictures/bing/ %s"
				 URL))))


(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
		c-mode c++-mode objc-mode js-mode
		latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
		 (just-one-space 0)
		 (backward-char 1)))))

;; -*- Smart copy, if no region active, it simply copy the current whole line
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
		   (message "Copied line")
		   (list (line-beginning-position)
			 ;; beginning position of next line
			 (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
       (list (line-beginning-position)
	     (line-beginning-position 2)))))

;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "M-k") 'qiang-copy-line)

(global-set-key ""
		(lambda (N)
		  (interactive "p")
		  (if (eq (char-before) 10)
		      (progn
			(previous-line)))
		  (move-beginning-of-line N)))
(global-set-key ""
		(lambda (N)
		  (interactive "p")
		  (if (eq (char-after) 10)
		      (progn
			(next-line)))
		  (move-end-of-line N)))
(global-set-key (kbd "M-B") 'backward-kill-sexp)
(global-set-key (kbd "M-F")
		(lambda (&optional N)
		  (interactive "p")
		  (backward-kill-sexp (- N))))

(global-set-key (kbd "C-x C-b")
		(lambda (&optional ARGS)
		  (interactive "p")
		  (if (equal ARGS 1)
		      (list-buffers)
		    (list-buffers ARGS))
		  (switch-to-buffer-other-window "*Buffer List*")
		  ))

(global-set-key (kbd "C-x F")
		(lambda (&optional COUNT)
		  (interactive "p^Switch to next buffer N times: ")
		  (if (zerop COUNT)
		      (progn
			(message "Zero")
			(switch-to-next-buffer))
		    nil)
		  (while (not (zerop COUNT))
		    (if (< COUNT 0)
			(progn
			  (switch-to-prev-buffer)
			  (setq COUNT (+ COUNT 1)))
		      (switch-to-next-buffer)
		      (setq COUNT (- COUNT 1))	))))
(global-set-key (kbd "C-x B")
		(lambda (&optional COUNT)
		  (interactive "p^Switch to next buffer N times: ")
		  (while (not (zerop COUNT))
		    (if (< COUNT 0)
			(progn
			  (switch-to-next-buffer)
			  (setq COUNT (+ COUNT 1)))
		      (switch-to-prev-buffer)
		      (setq COUNT (- COUNT 1))	))))

(defun mplayer (MEDIA_FILE)
  "调用 mplayer 播放媒体文件。"
  (interactive "fMedia Files: ")
  (async-shell-command
   (format "mplayer -ao alsa -vo fbdev2 -vfm ffmpeg -lavdopts \
lowres=0:fast:skiploopfilter=all -x 1366 -y 702 -zoom -fs -really-quiet \
%s" MEDIA_FILE)))


;; (if (< emacs-major-version 21)
;;     (setup-chinese-gb-environment)
;;   (set-language-environment 'UTF-8))

;; for c/c++
;; (setq gdb-many-windows t)
;; (load-library "multi-gud.el")

;; load script.
;; (load "base.el")


;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:
