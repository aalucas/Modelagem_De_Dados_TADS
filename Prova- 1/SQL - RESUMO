# GUIA COMPLETO QUE INCLUI INSERÇÃO E CONSULTA DE DADOS 

```sql
-- Inserir dados na superclasse
INSERT INTO Veiculo (placa, ano) VALUES ('ABC1234', 2020);

-- Inserir dados nas subclasses
INSERT INTO Carro (placa, ano, numero_portas) VALUES ('DEF5678', 2021, 4);
INSERT INTO Moto (placa, ano, cilindradas) VALUES ('GHI9012', 2022, 150);

-- Consultar dados da superclasse (inclui dados das subclasses)
SELECT * FROM Veiculo;

-- Consultar dados apenas da superclasse
SELECT * FROM ONLY Veiculo;
```

Como no SELECT, os comando UPDATE e DELETE também suportam o uso do "ONLY".

Essa abordagem permite modelar de forma eficiente hierarquias de entidades no PostgreSQL, mantendo a flexibilidade e a integridade dos dados.

**Links:**

(1) Herança no PostgreSQL - DevMedia. https://www.devmedia.com.br/heranca-no-postgresql/10847.

(2) Banco de dados: Generalização e especialização na Modelagem Conceitual. https://blog.grancursosonline.com.br/banco-de-dados-generalizacao-e-especializacao-na-modelagem-conceitual/.

(3) Banco de Dados II: Generalização e Especialização (aula 3). https://pt.slideshare.net/slideshow/banco-de-dados-ii-generalizao-e-especializao-aula-3/57053731.

(4) BANCO DE DADOS - docente.ifrn.edu.br. https://docente.ifrn.edu.br/elieziosoares/disciplinas/programacao-com-acesso-a-banco-de-dados/4-especializacao-entidade_associativa.


***
# Stored Procedure

Procedimento armazenado ou Stored Procedure é uma coleção de comandos em SQL, que podem ser executadas em um Banco de dados de uma só vez, como em uma função

```sql
CREATE FUNCTION soma(text, text) RETURNS char AS
$$
DECLARE
 resultado text;
BEGIN
 resultado := $1 || $2;
 return resultado;
END;
$$ LANGUAGE 'plpgsql';
```

```sql
CREATE OR REPLACE FUNCTION clientesComMaisPedidos() RETURNS TABLE (cliente_id int) AS
$$
BEGIN
       RETURN QUERY SELECT cliente.id FROM cliente inner join pedido on (cliente.id = pedido.cliente_id) group by cliente.id having count(*) = (SELECT count(*) FROM cliente inner join pedido on (cliente.id = pedido.cliente_id) group by cliente.id ORDER BY COUNT(*) DESC LIMIT 1);
END;
$$ LANGUAGE 'plpgsql';
```

***

## TEMP TABLE 

```sql
CREATE OR REPLACE PROCEDURE listar_amigos_secretos(evento_id_param INTEGER)
LANGUAGE plpgsql
AS $$
DECLARE
    participante_record RECORD;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM eventos WHERE id = evento_id_param) THEN
        RAISE EXCEPTION 'Evento com ID % não encontrado.', evento_id_param;
    END IF;

    CREATE TEMPORARY TABLE IF NOT EXISTS temp_amigos_secretos (
        participante VARCHAR(255),
        amigo_secreto VARCHAR(255)
    ) ON COMMIT DROP;

    TRUNCATE temp_amigos_secretos;

    INSERT INTO temp_amigos_secretos (participante, amigo_secreto)
    SELECT 
        p.nome AS participante,
        a.nome AS amigo_secreto
    FROM 
        participantes p
    LEFT JOIN 
        participantes a ON p.amigo_id = a.id
    WHERE 
        p.evento_id = evento_id_param
    ORDER BY 
        p.nome;

    FOR participante_record IN (SELECT * FROM temp_amigos_secretos)
    LOOP
        RAISE NOTICE 'Participante: %, Amigo Secreto: %', 
                     participante_record.participante, 
                     COALESCE(participante_record.amigo_secreto, 'Não atribuído');
    END LOOP;

    IF NOT FOUND THEN
        RAISE NOTICE 'Nenhum participante encontrado para o evento %', evento_id_param;
    END IF;
END;
$$;
```


***

# Trigger

```sql
-- criando uma função/stored procedure que retorna uma trigger
CREATE OR REPLACE FUNCTION processa_empregados_audit() RETURNS TRIGGER AS
$$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO empregados_audit (operacao, usuario, data, nome)
            VALUES ('E', USER, NOW(), OLD.nome);
        RETURN OLD;    
    ELSIF (TG_OP = 'UPDATE') THEN
         INSERT INTO empregados_audit (operacao, usuario, data, nome)
            VALUES ('A', USER, NOW(), NEW.nome);
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO empregados_audit (operacao, usuario, data, nome)
            VALUES ('I', USER, NOW(), NEW.nome);
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE 'plpgsql'; 

-- definindo comportamento de gatilho
CREATE TRIGGER empregados_audit AFTER INSERT OR UPDATE OR DELETE ON empregados FOR EACH ROW EXECUTE PROCEDURE processa_empregados_audit();
```

*** 

# DCL

## Criar um Usuário

```sql
1) CREATE ROLE name;
CREATE ROLE name [ [ WITH ] option [ ... ] ]
      SUPERUSER | NOSUPERUSER
    | CREATEDB | NOCREATEDB
    | CREATEROLE | NOCREATEROLE
    | INHERIT | NOINHERIT
    | LOGIN | NOLOGIN
    | REPLICATION | NOREPLICATION
    | BYPASSRLS | NOBYPASSRLS
    | CONNECTION LIMIT connlimit
    | [ ENCRYPTED ] PASSWORD 'password' | PASSWORD NULL
    | VALID UNTIL 'timestamp'
    | IN ROLE role_name [, ...]
    | IN GROUP role_name [, ...]
    | ROLE role_name [, ...]
    | ADMIN role_name [, ...]
    | USER role_name [, ...]
    | SYSID uid
2) CREATE USER name [ [ WITH ] option [ ... ] ]
      SUPERUSER | NOSUPERUSER
    | CREATEDB | NOCREATEDB
    | CREATEROLE | NOCREATEROLE
    | INHERIT | NOINHERIT
    | LOGIN | NOLOGIN
    | REPLICATION | NOREPLICATION
    | BYPASSRLS | NOBYPASSRLS
    | CONNECTION LIMIT connlimit
    | [ ENCRYPTED ] PASSWORD 'password' | PASSWORD NULL
    | VALID UNTIL 'timestamp'
    | IN ROLE role_name [, ...]
    | IN GROUP role_name [, ...]
    | ROLE role_name [, ...]
    | ADMIN role_name [, ...]
    | USER role_name [, ...]
    | SYSID uid
```

## Remover um Usuário
```sql
1) DROP ROLE name;
2) DROP USER name;
```

## Renomear um Usuário

```sql
ALTER USER <nome_antigo_usuario>
  RENAME TO <nome_novo_usuario>;
```

## Listar Usuários
```sql
SELECT rolname FROM pg_roles;
```

## Usuário com Login

```sql
1) CREATE ROLE name LOGIN;
2) CREATE USER name;
```

## Usuário Superuser

```sql
1) CREATE ROLE name SUPERUSER
2) CREATE USER name SUPERUSER
```

## Usuário com Capacidade de Criar BD's

```sql
CREATE ROLE name CREATEDB
```

## Usuário que Pode Criar/Alterar outros Usuários/papéis 

```sql
CREATE ROLE name CREATEROLE
```

## Usuário com Senha
