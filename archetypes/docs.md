---
title: "{{ replace .File.ContentBaseName "-" " " | title }}"
weight: 10
description: ""
draft: true
---

<!--
  Esta página vive em content/docs/... (seção "Snippets" no menu).
  - `weight` controla a posição na sidebar (menor = mais acima).
  - Se esta pasta tiver subpáginas, crie um _index.md nela também.

  Shortcodes úteis pra dotfiles/configs:
  - {{</* filetree/folder name="~/.config" */>}}
      {{</* filetree/file name="hypr.conf" */>}}
    {{</* /filetree/folder */>}}
  - {{</* details */>}} bloco de código longo/opcional {{</* /details */>}} (use <details><summary> se preferir HTML puro)
  Apague este comentário antes de publicar.
-->
