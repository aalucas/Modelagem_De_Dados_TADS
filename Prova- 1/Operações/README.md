# Operações em Banco de Dados Relacional com PostgreSQL

## Introdução

O PostgreSQL é um Sistema Gerenciador de Banco de Dados (SGBD) relacional que:
- Organiza dados em tabelas com linhas e colunas
- Suporta relacionamentos via chaves primárias e estrangeiras
- Implementa recursos objeto-relacionais como herança de tabelas
- Oferece garantia de integridade referencial

## Categorias de Operações

### 1. DDL (Data Definition Language)
- **CREATE**: Define estruturas como tabelas
- **ALTER**: Modifica estruturas existentes
- **DROP**: Remove estruturas

### 2. DML (Data Manipulation Language)
- **INSERT**: Adiciona dados
- **UPDATE**: Modifica dados
- **DELETE**: Remove dados
- **SELECT**: Consulta dados

### 3. DCL (Data Control Language)
- **GRANT**: Concede permissões
- **REVOKE**: Remove permissões

### 4. TCL (Transaction Control Language)
- **BEGIN**: Inicia transação
- **COMMIT**: Confirma transação
- **ROLLBACK**: Desfaz transação

## Principais Comandos e Exemplos

### CREATE
```sql
CREATE TABLE filmes (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100)
);
```

### ALTER
```sql
ALTER TABLE filmes ADD COLUMN ano INTEGER;
```

### INSERT
```sql
INSERT INTO filmes (titulo, ano) 
VALUES ('Exemplo', 2023);
```

### UPDATE
```sql
UPDATE filmes 
SET ano = 2024 
WHERE id = 1;
```

### SELECT
```sql
SELECT * FROM filmes WHERE ano > 2000;
```

## Termos Sintáticos Importantes

### FROM
- Especifica a fonte dos dados
- Exemplo: `FROM filmes`

### JOIN
- Combina dados de múltiplas tabelas
- Tipos:
  - INNER JOIN
  - LEFT JOIN
  - RIGHT JOIN
  - FULL JOIN
- Exemplo:
```sql
SELECT f.titulo, d.nome
FROM filmes f
INNER JOIN distribuidores d ON f.distribuidor_id = d.id;
```

## Boas Práticas
1. Use índices apropriadamente para melhor desempenho
2. Mantenha a integridade referencial
3. Planeje a estrutura do banco antes de implementar
4. Use transações para garantir consistência
5. Documente suas operações e estruturas

## Ferramentas Úteis
- pgAdmin: Interface gráfica para administração
- psql: Cliente command-line
- DBeaver: Cliente multiplataforma

## Referências
- Documentação oficial do PostgreSQL
- Tutoriais e guias práticos
- Exemplos de implementações reais