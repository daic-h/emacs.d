(defadvice vc-revert-buffer-internal (around no-revert-in-Git activate)
  "gitはワークファイルの内容を書き換えないのでrevert不要"
  (if (eq (vc-backend buffer-file-name) 'Git) 'not-do-it ad-do-it))

(provide 'init-git)
