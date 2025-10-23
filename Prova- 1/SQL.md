# SQL

## Operadores 

   * **Lógicos** and or not = <> != < <= > >=

   * **Númericos, inteiros e reais:** + - * / % ^ between

##  Funções Numéricas

   * min(x), max(x), abs(x), div(x, y), mod(x, y), ceil(x), floor(x), round(x), trunc(x), exp(x), ln(x), log(x), power(x, y), sqrt(x), random(), sin(x), cos(x), tan(x), asin(x), acos(x), atan(x), degrees(x), radians(x) e etc.

## Funções para Strings

   * length(x), lower(x), upper(x), trim(x), strpos(x, y), substr(x, y), substr(x, y, z), replace(x, y, z), repeat(x, y), translate(x, y, z) md5(x), to_char(x, y) e etc.

## Principais Tipos de Dados - PostgreSQL

* _**boolean:**_ booleano lógico
* _**character varying(n):**_ cadeia de caracteres de comprimento variável
* _**character(n):**_ cadeia de caracteres de comprimento fixo
* _**date:**_ data
* _**double precision:**_ número de ponto flutuante de precisão dupla
* _**integer:**_ número inteiro de 4 bytes com sinal
* _**money:**_ quantia monetária
* _**numeric(p,s):**_ númerico com precisão selecionável
* _**real:**_ número de ponto flutuante de precisão simples
* _**serial:**_ número inteiro de 4 bytes auto-incrementado

## [JSON](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-json/)
  * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-json/
  * https://www.enterprisedb.com/blog/processing-postgresql-json-jsonb-data-java
  * https://www.baeldung.com/gson-exclude-fields-serialization


## Type

```sql
CREATE TYPE tamanho AS ENUM ('pequena', 'media', 'grande');

CREATE TABLE residencias (
    id SERIAL PRIMARY KEY,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    complemento VARCHAR(50),
    numero VARCHAR(10) NOT NULL,
    tamanho tamanho NOT NULL
);
```

## **Conversão de Tipos (cast)**

```sql
select cast('true' as boolean);
select cast('12' as integer);
select cast('12.34' as real);
select cast('2000-12-31' as date);
select cast('12:00:00' as time);
select cast('2000-12-31 12:00:00' as timestamp);
select cast('3 months 10 days' as interval);
select cast(false as integer);
select cast(12.34 as integer);
```

## **CREATE DATABASE**

```sql
CREATE DATABASE banco;
```

## **CREATE TABLE**
 ```sql
create table tabela2 (
	campo1 serial primary key,
	campo2 real default 0,
	campo3 varchar(100),
	campo4 date default current_date
);
```
## CHECK

```sql
CREATE TABLE products (
  product_no integer,
  name text DEFAULT 'Igor',
  -- valores da coluna "price" não podem ser nulos (NOT NULL) e devem ser maior que zero (CHECK (price > 0))
  price numeric NOT NULL CHECK (price > 0)
);
```

## GENERATED ALWAYS

https://www.postgresql.org/docs/current/ddl-generated-columns.html

https://www.tutorialsteacher.com/postgresql/generated-always

https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-generated-columns/

***
* _**text:**_ cadeia de caracteres de comprimento variável
* _**timestamp:**_ data e hora
* _**time:**_ hora
