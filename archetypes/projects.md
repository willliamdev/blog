---
title: "{{ replace .File.ContentBaseName "-" " " | title }}"
date: {{ .Date }}
description: ""
tags:
  - 
repo: ""
demo: ""
draft: true
---

<!--
  Lembre de adicionar um card apontando pra esta página em
  content/projects/_index.md, algo como:

  {{</* card link="/projects/{{ .File.ContentBaseName }}/" title="{{ replace .File.ContentBaseName "-" " " | title }}" subtitle="uma frase curta" icon="code" */>}}

  Apague este comentário antes de publicar.
-->
