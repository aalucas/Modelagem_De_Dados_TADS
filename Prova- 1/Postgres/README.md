# 🐘 PostgreSQL no Linux — Guia Completo com pgAdmin e VS Code

Este repositório documenta o processo completo de instalação, configuração e uso do **PostgreSQL** e **pgAdmin** no Linux, incluindo a integração direta com o **Visual Studio Code (VS Code)** para execução de queries SQL.  
O conteúdo foi construído a partir de estudos práticos realizados no sistema **Pop!_OS (Ubuntu-based)**, mas é aplicável a qualquer distribuição Linux.

---

# 📑 Sumário
- [Introdução](#-postgresql-no-linux--guia-completo-com-pgadmin-e-vs-code)
- [Requisitos de Sistema](#-requisitos-de-sistema)
- [Instalação](#-1-instalação-do-postgresql-e-pgadmin)
- [Gerenciamento de Usuários e Acesso](#-2-gerenciamento-de-usuários-e-acesso)
- [pgAdmin](#-3-configuração-e-uso-do-pgadmin)
- [VS Code](#-4-programando-em-postgresql-pelo-vs-code)
- [Comandos SQL Básicos](#-comandos-sql-básicos)
- [Troubleshooting](#-troubleshooting)
- [Boas Práticas](#-5-boas-práticas)
- [Como Contribuir](#-como-contribuir)
- [Licença](#-licença)
- [Referências](#-referências)

## 📋 Requisitos de Sistema
- Distribuição Linux (Ubuntu 20.04+ recomendado)
- 2 GB RAM (mínimo), 4 GB recomendado
- ~1 GB de espaço livre para instalação básica
- Acesso à internet para download de pacotes

---

## 📦 1. Instalação do PostgreSQL e pgAdmin

### 🔹 Instalar PostgreSQL
No terminal, execute:
``` 
sudo apt update
sudo apt install postgresql postgresql-contrib

🔹 Verificar o serviço

Para confirmar se o PostgreSQL está em execução:

sudo systemctl status postgresql

Caso o serviço não esteja ativo, inicie-o com:

sudo systemctl start postgresql

🔹 Entrar no modo PostgreSQL

sudo -i -u postgres
psql
```
👤 2. Gerenciamento de Usuários e Acesso

Dentro do terminal psql, é possível configurar usuários e permissões.
🔸 Criar um novo usuário

CREATE USER nome_usuario WITH PASSWORD 'senha';

🔸 Conceder permissões de superusuário

ALTER USER nome_usuario WITH SUPERUSER;

🔸 Criar um banco de dados associado

CREATE DATABASE nome_banco OWNER nome_usuario;

🔸 Conceder privilégios

GRANT ALL PRIVILEGES ON DATABASE nome_banco TO nome_usuario;

🔸 Sair do psql

\q

🧭 3. Configuração e Uso do pgAdmin

O pgAdmin é a interface gráfica oficial do PostgreSQL, utilizada para gerenciar bancos de dados, usuários e executar consultas SQL.
🔹 Instalar pgAdmin

sudo apt install pgadmin4

Após a instalação:

    Busque por pgAdmin 4 no menu do sistema.

    Na primeira execução, defina um e-mail e senha mestre.

    Adicione o servidor PostgreSQL manualmente:

        Host name/address: localhost

        Port: 5432

        Maintenance database: postgres

        Username: postgres (ou outro usuário criado)

        Password: senha configurada anteriormente

🔹 Funcionalidades principais:

    Criar e gerenciar bancos de dados;

    Executar queries SQL via Query Tool;

    Controlar usuários, roles e permissões;

    Monitorar conexões e desempenho do servidor.

💻 4. Programando em PostgreSQL pelo VS Code

Além do pgAdmin, é possível programar e executar comandos SQL diretamente no VS Code.
🔸 Extensão necessária

Instale a extensão:

PostgreSQL (por Chris Kolkman)

🔸 Criar uma conexão com o banco

    Abra o ícone do elefante (🐘) no painel lateral.

    Clique em Add Connection.

    Preencha com suas credenciais:

    Host: localhost
    Port: 5432
    Database: nome_do_banco
    User: nome_usuario
    Password: senha

    Clique em Connect.

🔸 Executar comandos SQL

Após conectado:

    Crie um novo arquivo .sql;

    Escreva consultas, por exemplo:

    SELECT * FROM usuarios;

    Execute com Ctrl + Enter.

🔸 Alternativamente:

Você também pode escrever scripts SQL diretamente em arquivos .sql e executá-los no pgAdmin Query Tool ou via terminal com:

psql -U nome_usuario -d nome_banco -f script.sql

⚙️ 5. Boas Práticas

    Sempre defina usuários específicos para cada aplicação.

    Evite usar o superusuário postgres em produção.

    Realize backups regulares com:

    pg_dump nome_banco > backup.sql

    Use comentários e scripts versionados (.sql) para manter histórico de alterações no GitHub.

🧩 6. Ferramentas Envolvidas
Ferramenta	Função	Plataforma
PostgreSQL	Sistema de gerenciamento de banco de dados relacional (SGBD)	Linux
pgAdmin 4	Interface gráfica de administração do PostgreSQL	Linux / Web
VS Code	Editor de código integrado para SQL, Python, JS e outras linguagens	Multiplataforma
Extensão PostgreSQL	Conexão direta ao banco dentro do VS Code	Marketplace

📘 7. Exemplo de Estrutura de Banco

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nome, email)
VALUES ('Lucas Oliveira', 'lucas@email.com');

SELECT * FROM usuarios;

⚙️ 8. Boas Práticas
- Use roles/usuários específicos por aplicação.
- Versione scripts SQL no Git.
- Use transações para operações críticas (BEGIN / COMMIT / ROLLBACK).
- Defina índices conforme necessidade de consulta.
- Documente mudanças de esquema com comentários e CHANGELOG.

🧠 Conclusão

Com essa configuração, o ambiente Linux se torna completamente integrado ao PostgreSQL, permitindo gerenciar bancos de dados via pgAdmin e desenvolver queries SQL diretamente no VS Code, combinando praticidade, controle e eficiência.
Esse fluxo é ideal para estudantes, analistas e desenvolvedores que desejam dominar a administração e manipulação de dados em ambientes PostgreSQL.

    Autor: Lucas Oliveira
    Curso: Análise de Desenvolvimento de Sistemas
    Tecnologias utilizadas: PostgreSQL · pgAdmin · VS Code · Linux
