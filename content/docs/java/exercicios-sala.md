---
title: "Execícios: Sala de Aula"
date: 2026-08-17T02:45:35-03:00
draft: false
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

## Execício 1

```java
import java.awt.Container;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.text.MaskFormatter;

public class form extends JFrame {

    private JLabel lName;
    private JTextField tName;
    private JLabel lCPF;
    private JFormattedTextField formattedCPF;
    private JLabel lRole;
    private JTextField tRole;
    private JComboBox cmbRole;
    private final String[] usersRole = { "Admin", "User" };
    private JButton btnLogin;
    private Container container;

    public form() {
        setSize(800, 400);
        setTitle("Tela de Login");

        container = getContentPane();
        container.setLayout(null);

        lName = new JLabel("Nome");
        tName = new JTextField();

        lCPF = new JLabel("CPF");
        try {
            formattedCPF = new JFormattedTextField(new MaskFormatter("###.###.###-##"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        lRole = new JLabel("Cargo");
        tRole = new JTextField();
        cmbRole = new JComboBox(usersRole);

        btnLogin = new JButton("Login");

        lName.setBounds(10, 10, 100, 25);
        tName.setBounds(50, 10, 200, 25);
        lCPF.setBounds(10, 50, 100, 25);
        formattedCPF.setBounds(50, 50, 200, 25);
        lRole.setBounds(10, 90, 100, 25);
        cmbRole.setBounds(50, 90, 200, 25);
        btnLogin.setBounds(10, 130, 240, 30);

        container.add(lName);
        container.add(tName);
        container.add(lCPF);
        container.add(formattedCPF);
        container.add(lRole);
        container.add(cmbRole);
        container.add(btnLogin);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);

    }

    public static void main(String[] args) {
        form login = new form();

    }
}
```


## Execício 2
```java
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class StudentForm extends JFrame {
    private JLabel lName;
    private JTextField tName;

    private JLabel lAdress;
    private JTextField tAdress;

    private JLabel lPhone;
    private JTextField tPhone;

    private JLabel lCPF;
    private JTextField tCPF;

    private JLabel lBloodType;
    private JComboBox cmbBloodType;
    private final String[] bloodTypes = { "A", "B", "AB", "O", };
    private JLabel lRhFactor;
    private JComboBox cmbRhFactor;
    private final String[] rhFactors = { "+", "-" };

    private JLabel lCurso;
    private JComboBox cmbCurso;
    private final String[] cursos = { "Ciência da Computação", "Engenharia de Software", "Sistemas de Informação" };

    private JLabel lEmercencyContact;
    private JTextField tEmercencyContact;

    private JLabel lEmercencyPhone;
    private JTextField tEmercencyPhone;

    private JButton btnInsert;
    private JButton btnAbort;

    private Container container;

    public StudentForm() {

        setSize(300, 400);
        setTitle("Tela de Cadastro");

        setVisible(true);
        container = getContentPane();

        container.setLayout(null);

        lName = new JLabel("Nome");
        tName = new JTextField();

        lAdress = new JLabel("Endereço");
        tAdress = new JTextField();

        lPhone = new JLabel("Telefone");
        tPhone = new JTextField();

        lCPF = new JLabel("CPF");
        tCPF = new JTextField();

        lBloodType = new JLabel("Tipo Sanguíneo");
        cmbBloodType = new JComboBox(bloodTypes);

        lRhFactor = new JLabel("Fator Rh");
        cmbRhFactor = new JComboBox(rhFactors);

        lCurso = new JLabel("Curso");
        cmbCurso = new JComboBox(cursos);

        lEmercencyContact = new JLabel("Contato de Emergência");
        tEmercencyContact = new JTextField();

        lEmercencyPhone = new JLabel("Telefone do Contato de Emergência");
        tEmercencyPhone = new JTextField();

        btnInsert = new JButton("Inserir");
        btnAbort = new JButton("Cancelar");

        lName.setBounds(10, 10, 100, 25);
        tName.setBounds(100, 10, 200, 25);
        lAdress.setBounds(10, 50, 100, 25);
        tAdress.setBounds(100, 50, 200, 25);
        lPhone.setBounds(10, 90, 100, 25);
        tPhone.setBounds(100, 90, 200, 25);
        lCPF.setBounds(10, 130, 100, 25);
        tCPF.setBounds(100, 130, 200, 25);
        lBloodType.setBounds(10, 170, 110, 25);
        cmbBloodType.setBounds(110, 170, 50, 25);
        lRhFactor.setBounds(170, 170, 60, 25);
        cmbRhFactor.setBounds(250, 170, 50, 25);
        lCurso.setBounds(10, 250, 100, 25);
        cmbCurso.setBounds(100, 250, 200, 25);
        lEmercencyContact.setBounds(10, 290, 200, 25);
        tEmercencyContact.setBounds(220, 290, 200, 25);
        lEmercencyPhone.setBounds(10, 330, 200, 25);
        tEmercencyPhone.setBounds(220, 330, 200, 25);
        btnInsert.setBounds(10, 370, 100, 25);
        btnAbort.setBounds(120, 370, 100, 25);

        container.add(lName);
        container.add(tName);
        container.add(lAdress);
        container.add(tAdress);
        container.add(lPhone);
        container.add(tPhone);
        container.add(lCPF);
        container.add(tCPF);
        container.add(lBloodType);
        container.add(cmbBloodType);
        container.add(lRhFactor);
        container.add(cmbRhFactor);
        container.add(lCurso);
        container.add(cmbCurso);
        container.add(lEmercencyContact);
        container.add(tEmercencyContact);
        container.add(lEmercencyPhone);
        container.add(tEmercencyPhone);
        container.add(btnInsert);
        container.add(btnAbort);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);

    }

    public static void main(String[] args) {
        StudentForm StudentFormWindow = new StudentForm();
    }
}
```
<!--
## Execício 1
```java
```
-->
