---
title: "Análise de Requisitos: Fundamental ou chatice?"
date: 2026-09-22T22:53:59-03:00
description: "Um mergulho na resolução prática de estudos de caso acadêmicos focados em análise de requisitos, segurança (C.I.D.) e ciclo de vida de software."
tags:
  - graduation
  - engenharia-de-software
  - analise-de-sistemas
  - uml
  - aprendizado
draft: false
---

Estudar Engenharia de Software e Análise de Sistemas muitas vezes parece um exercício puramente teórico até que a gente se depara com estudos de caso reais. 
Na próxima semana vão ocorrer as provas do primeiro bimestre e como revisão recebi 49 questões pra revisão, sendo 40 de múltipla escolha e 9 questões abertas, que exigem um mínimo de esforço e no meu julgamento agregam muito valor na minha formação.

Em vez de recorrer a uma LLM para responder no automático, decidi sentar, puxar as referências das aulas dos meus professores do curso e estruturar cada resposta manualmente, e pra garantir o foco deixei o celular gravando um timelapse.

<br>

{{< youtube XZTPhQddKmY >}}

Segue abaixo a resolução de duas das questões da atividade e que algum dia vou usar esse post pra dizer "Tudo começou quando eu foquei nessa matéria, num dia chuvoso, com meu notebook positivo e um café meio gelado e amargo".

### Questão 41 — Análise do Problema e Requisitos (Estudo de Caso: Nexus Distribuição)

A empresa Nexus Distribuição utiliza planilhas para controlar estoque e vendas. Os vendedores não sabem imediatamente se um produto está disponível, o estoque é atualizado manualmente ao final do expediente e o gerente precisa reunir informações de várias planilhas para emitir relatórios. A direção solicitou um sistema que centralize as informações e facilite o acompanhamento das operações.

---
> a) Descreva o problema central que o sistema deverá solucionar.

Por usar planilhas diferentes para vendas e estoque, que não se conversam, no final do dia alguém precisa ir linha a linha ajustando o inventário conforme as vendas. Isso é ineficiente, e até mesmo um Excel bem estruturado resolveria parte do problema se a planilha de vendas consultasse e alterasse os dados da planilha de estoque de forma integrada.

> b) Identifique pelo menos cinco requisitos funcionais.

**Requisitos funcionais** dizem **o que** o sistema deve fazer. Portanto:

- Cadastrar e alterar itens no estoque;
- Gerar pedidos de acordo com o estoque disponível;
- Identificar quem realizou a venda e calcular a comissão;
- Gerar relatório de vendas por intervalo de tempo;
- Registrar trilha de auditoria;
- Respeitar os princípios de segurança C.I.D.:
  - Confidencialidade: um vendedor não deve ter acesso aos valores de comissão de outro vendedor;
  - Integridade: apenas o gerente pode remover ou alterar uma venda já registrada;
  - Disponibilidade: o banco de dados deve possuir backups diários e snapshots com intervalo de 1 hora.

---
> c) Proponha dois requisitos não funcionais ou restrições relevantes.

**Requisitos não funcionais** ditam **como** o sistema deve agir. Nesse caso:

- Uma consulta deve responder em até 200 ms;
- O sistema deve suportar até 20 usuários simultâneos.

---
> d) Cite uma técnica de levantamento de requisitos e explique como você a aplicaria.

Como o negócio ainda usa planilhas e não um ERP, acredito que seja uma empresa pequena. Para levantar os requisitos, bastariam duas etapas:

- Entrevista com os stakeholders;
- Job shadowing: observar como os usuários operam no ambiente atual para compreender o fluxo real de trabalho e as demandas do dia a dia.

___
> e) Explique por que os requisitos devem ser analisados antes da implementação.

O papel do analista é resolver o problema real; atender apenas ao que o cliente pediu nem sempre gera valor para o negócio. O desenvolvimento de uma solução deve seguir a sequência:

`Elicitar -> Analisar -> Especificar -> Validar`

---

### Questão 42 — Ciclo de Vida do Projeto (Estudo de Caso: Horizonte Educação)

A empresa Horizonte Educação deseja desenvolver um sistema de gestão acadêmica. A direção quer acompanhar matrículas, consultar informações de alunos e emitir relatórios. A equipe ainda não definiu o escopo

---
> a) Descreva o problema central que o sistema deverá solucionar.

Desenvolver uma plataforma centralizada de gestão acadêmica capaz de operacionalizar o fluxo de matrículas, fornecer consultas rápidas sobre o histórico dos alunos e automatizar a emissão de relatórios gerenciais. (ja tava no enunciado).

---
> b)  Explique o que deverá ser realizado na etapa de planejamento.

Nesta fase, envolvem-se todos os *stakeholders* (patrocinadores, corpo docente e equipe administrativa) para definir o escopo macro do projeto, mapear riscos, estimar prazos e custos e estabelecer os requisitos de alto nível que orientarão o desenvolvimento.

---
> c) Indique as atividades necessárias durante a análise.

É a fase de refinamento: transformar as necessidades brutas elicitadas no planejamento em informações organizadas. Nesse momento, priorizam-se funcionalidades, pensamos na viabilidade técnica e convertemos as ideias abstratas em requisitos funcionais e não funcionais estruturados e sem ambiguidades.

---
> d) Explique como a etapa de projeto poderá utilizar a UML.

A linguagem UML (*Unified Modeling Language*) entra como ferramenta essencial de arquitetura e design de software:

- **Diagramas de Casos de Uso:** para mapear atores e suas interações com o sistema;
- **Diagramas de Classes:** para estruturar o modelo de dados e o domínio acadêmico, como `Aluno`, `Matricula` e `Turma`;
- **Diagramas de Sequência:** para detalhar a troca de mensagens entre os objetos durante fluxos críticos, como o processo de efetivação de matrícula.

---
> e) Explique como as etapas se relacionam e por que não devem ser tratadas como atividades isoladas.

Porque são dependentes. A qualidade de uma etapa depende da anterior, requisitos que não foram analisados, revisados, tem grandes chances de terem erros na arquitura do sistema e exigir retrabalho na etapa de implementação.

---

### Referências e colas:

- **Aulas de Segurança da Informação (5º semestre):** conceitos da tríade C.I.D. e estratégias de infraestrutura, incluindo a diferença entre backup e snapshots.
- **Aulas de Análise e Projeto de Sistemas (5º semestre):** material didático sobre análise de requisitos e ciclo de vida de software.