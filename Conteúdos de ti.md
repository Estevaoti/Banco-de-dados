
#  Conteúdo Educacional – DDL e DML

Este material explica de forma simples, direta e prática o que são os comandos **DDL** e **DML** no SQL.  
Os exemplos foram retirados do banco de dados criado para o projeto **Lan House TechZada**.

---

#  1. O que é DDL?

**DDL (Data Definition Language)** é o conjunto de comandos SQL usados para **definir e alterar a estrutura do banco de dados**.

Ou seja:  
✔ cria tabelas  
✔ cria bancos  
✔ adiciona/alterar colunas  
✔ define chaves primárias e estrangeiras  
✔ apaga tabelas  

---

##  Principais comandos DDL

| Comando | Função |
|--------|--------|
| `CREATE` | Criar bancos e tabelas |
| `ALTER` | Alterar estrutura existente |
| `DROP` | Apagar tabelas ou bancos |
| `USE` *(MySQL)* | Selecionar o banco para trabalhar |

---

### 🛠 Exemplos Reais (Projeto TechZada)

#### ✔ Criar o banco de dados

**Instrução:**
```sql
CREATE DATABASE IF NOT EXISTS techzada;
```
---

#### ✔ Selecionar o banco

**Instrução:**
```sql
USE techzada;
```
---

#### ✔ Criar tabela de clientes

**Instrução:**
```sql
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(120),
    telefone VARCHAR(20)
);
```
---

#### ✔ Criar tabela de serviços

**Instrução:**
```sql
CREATE TABLE servicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    preco DECIMAL(8,2) NOT NULL
);
```
---

#### ✔ Criar tabela de atendimentos com chaves estrangeiras

**Instrução:**
```sql
CREATE TABLE atendimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_atendimento DATETIME NOT NULL,
    tecnico_responsavel VARCHAR(80),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (servico_id) REFERENCES servicos(id)
);
```
### 🔧 2. O que é DML?

#### DML (Data Manipulation Language)

**DML** (**Data Manipulation Language**) é o conjunto de comandos usado para **manipular os dados** que estão dentro das tabelas.

Ou seja:

* **✔ Inserir dados**
* **✔ Consultar dados**
* **✔ Atualizar dados**
* **✔ Apagar dados**

---

### 📌 Principais Comandos DML

| Comando  | Função              |
| -------- | ------------------- |
| `INSERT` | Inserir registros   |
| `SELECT` | Consultar dados     |
| `UPDATE` | Atualizar registros |
| `DELETE` | Remover registros   |



## 🛠 Exemplos Reais (Projeto TechZada)
***

### ✔ INSERT — Inserindo Dados

#### Inserindo Clientes

**Instrução:**
```sql
INSERT INTO clientes (nome, email, telefone)VALUES
    ('Carlos Henrique', 'carlos@gmail.com', '81999990000'),
    ('Juliana Araújo', 'juliana@hotmail.com', '81988887777'),
    ('Pedro Tavares', 'pedro@gmail.com', '81991112222');
```
#### Inserindo Serviços

**Instrução:**
```sql
INSERT INTO servicos (nome, preco)VALUES
    ('Acesso ao computador (1h)', 6.00),
    ('Impressão P&B', 1.00),
    ('Impressão Colorida', 2.00);
```
### ✔ UPDATE — Atualizando Registros

#### Aumentando Preço da Hora de Computador

**Instrução:**
```sql
UPDATE servicosSET preco = 7.00WHERE nome = 'Acesso ao computador (1h)';
```
---

### ✔ DELETE — Excluindo Registros

#### Excluindo Serviço Usando LIKE

**Instrução:**
```sql
DELETE FROM servicosWHERE nome LIKE '%Xerox%';
```
---

### ✔ SELECT — Consultando Dados

#### Selecionar Todos os Clientes

**Instrução:**
```sql
SELECT * FROM clientes;
```
#### Buscar Serviços Acima de R$ 10

**Instrução:**
```sql
SELECT nome, precoFROM servicosWHERE preco > 10;
```
---

## 📚 Conclusão

Os comandos **DDL** (Data Definition Language) e **DML** (Data Manipulation Language) são **essenciais** para:

* Criar a estrutura de um banco de dados completo
* Inserir informações de clientes, serviços e atendimentos
* Atualizar preços e registros conforme necessidade
* Consultar informações importantes do negócio
* Manter o banco organizado e funcional

Com esses comandos, é possível administrar qualquer banco de dados de forma profissional.
