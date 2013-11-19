(require 'erlang-start)
(add-hook-fn 'erlang-mode-hook
 (setq erlang-root-dir "/usr/local/bin")
 (setq exec-path (cons "/usr/local/Cellar/erlang/R15B01/" exec-path)))
