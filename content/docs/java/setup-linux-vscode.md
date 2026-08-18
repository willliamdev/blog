---
title: "Setup VSCode + Linux"
date: 2026-08-17T02:45:35-03:00
draft: false
weight: 1
description: "um guia de config pra que eu não sofra com isso de novo"
author: "willliam dev"
location: "Uberlândia - MG"
tags: 
  - java
  - POO
categories:
  - Setup
  - Graduation
---

# Setup de Java no Linux + mise e VS Code

Neste guia, documento como instalar e gerenciar versões do Java com o **mise**, sem poluir o sistema operacional, e como configurar o **VS Code** pra executar exercícios de POO.

A ideia é manter o Java isolado na pasta do projeto, facilitando a troca de versões e evitando configurações globais desnecessárias.

## Instalando o JDK via _mise_

O `mise` permite instalar e gerenciar ferramentas de desenvolvimento de forma isolada por projeto.

### 1. Instalando o JDK

No terminal, dentro da pasta raiz dos exercícios, execute:

```bash
mise use java@25
```

Esse comando instala o Java 25 e registra a versão utilizada pelo projeto no arquivo `.mise.toml`.

Assim, sempre que você estiver dentro desse projeto, o `mise` saberá qual versão do Java deve ser utilizada, mesmo que outra versão esteja instalada no sistema operacional.

> **Por que fazer isso?**
> Dessa forma, a versão do Java fica definida por projeto, evitando depender da versão global instalada no sistema.

### 2. Validando a instalação

Depois, confira se o Java está sendo encontrado corretamente:

```bash
java -version
javac -version
mise current
```

Os comandos devem indicar o Java 25 e a versão gerenciada pelo `mise`.

## Configurando o VS Code

### Instalando as extensões essenciais

No meu caso evitei o pack recomendado pelo marketplace e instalei apenas as extensões necessárias para trabalhar com Java nesse meu caso.

Para manter o ambiente enxuto, neste guia vamos utilizar apenas o [LSP](https://github.com/redhat-developer/vscode-java) e o [Debugger](https://github.com/Microsoft/vscode-java-debug)

Você pode instalá-las diretamente pelo terminal integrado do vscode:

```bash
code --install-extension redhat.java
```

```bash
code --install-extension vscjava.vscode-java-debug
```

A primeira fornece suporte à linguagem, IntelliSense e recursos do Java no VS Code e a segunda adiciona o suporte a debugging.

## Configurando o Java utilizado pelo VS Code

Para garantir que o VS Code utilize o JDK instalado pelo `mise`, primeiro descubra onde o Java está instalado.

No terminal, dentro da pasta do projeto:

```bash
mise which java
```

O comando retornará algo semelhante a:

```text
/home/usuario/.local/share/mise/installs/java/25.0.3/bin/java
```

Remova o `/bin/java` do final. Nesse exemplo, o caminho que precisamos é:

```text
/home/usuario/.local/share/mise/installs/java/25.0.3
```

Agora, dentro do projeto, crie ou edite:

```text
.vscode/settings.json
```

E adicione:

```json
{
  "java.jdt.ls.java.home": "/CAMINHO/DO/SEU/JAVA/NO/MISE",
  "java.configuration.runtimes": [
    {
      "name": "JavaSE-25",
      "path": "/CAMINHO/DO/SEU/JAVA/NO/MISE",
      "default": true
    }
  ],
  "java.project.sourcePaths": [
    "."
  ],
  "files.exclude": {
    "**/*.class": true
  }
}
```

Substitua `/CAMINHO/DO/SEU/JAVA/NO/MISE` pelo caminho encontrado anteriormente.


Depois de alterar essas configurações, reinicie o VS Code para garantir que tudo seja carregado corretamente.

---

## Isolando extensões por projeto (opcional)

Se você utiliza o VS Code para várias linguagens, pode desabilitar extensões que não são necessárias neste projeto.

Isso evita que extensões de Docker, Python, Node.js etc. sejam carregadas enquanto você trabalha apenas com Java.

1. Pressione `Ctrl + Shift + X` para abrir a aba de extensões.
2. Pesquise por `@installed`.
3. Nas extensões que não serão utilizadas neste projeto, clique no ícone de engrenagem ⚙️.
4. Selecione **Disable (Workspace)** / **Desabilitar (Workspace)**.

Dessa forma, a extensão continua instalada no VS Code, mas fica desabilitada apenas neste projeto.

---

## Estrutura de pastas

Uma estrutura simples para organizar os exercícios pode ser:

```text
poo-exercises/
├── .mise.toml
├── .vscode/
│   ├── extensions.json
│   └── settings.json
└── exercicios/
    └── ex001/
        └── Main.java
```

Dentro de `Main.java`, coloque:

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Java + mise + VS Code configurados com sucesso!");
    }
}
```

Se tudo estiver configurado corretamente, basta pressionar **F5** e o programa será executado utilizando o JDK gerenciado pelo `mise`.

Um setup simples e suficiente para começar os estudos de **Programação Orientada a Objetos com Java**.
