CREATE TABLE FUNCIONARIO(
COD SERIAL NOT NULL PRIMARY KEY,
NOME VARCHAR(50) NOT NULL,
CPF INT NOT NULL);

CREATE TABLE CLIENTE(
COD SERIAL NOT NULL PRIMARY KEY,
NOME VARCHAR(50) NOT NULL,
CPF INT NOT NULL);

CREATE TABLE CONCESSIONARIA(
COD SERIAL NOT NULL PRIMARY KEY,
CNPJ INT NOT NULL,
NOME_FANTASIA VARCHAR(50) NOT NULL,
RAZAO_SOCIAL VARCHAR(200),
ENDERECO VARCHAR(500)); 

CREATE TABLE MODELO(
COD SERIAL NOT NULL PRIMARY KEY,
DESCR VARCHAR(50) NOT NULL,
ANO VARCHAR(4),
MARCA VARCHAR(50),
COR VARCHAR(20),
PRECO FLOAT,
ESTOQUE INT NOT NULL);
			
CREATE TABLE FUNCIONARIO_CONCESSIONARIA(
COD SERIAL NOT NULL PRIMARY KEY,
COD_FUNC SERIAL NOT NULL REFERENCES FUNCIONARIO(COD),
COD_CONC SERIAL NOT NULL REFERENCES CONCESSIONARIA(COD));
														 
CREATE TABLE CARRO(
COD SERIAL NOT NULL PRIMARY KEY,
CHASSI INT NOT NULL,
MODELO SERIAL NOT NULL REFERENCES MODELO(COD),
CONCESSIONARIA SERIAL NOT NULL REFERENCES CONCESSIONARIA(COD));
															  
CREATE TABLE ATENDIMENTO(
COD SERIAL NOT NULL PRIMARY KEY,
DATA DATE NOT NULL,
MODELO SERIAL NOT NULL REFERENCES MODELO(COD),
CLIENTE SERIAL NOT NULL REFERENCES CLIENTE(COD),
FUNC_CONC SERIAL NOT NULL REFERENCES FUNCIONARIO_CONCESSIONARIA(COD));
															  
CREATE TABLE RESERVA_TEST_DRIVE(
HORA_COMECO TIME NOT NULL,
HORA_FIM TIME NOT NULL,
DIA_RESERVA DATE NOT NULL,
ATENDIMENTO SERIAL NOT NULL REFERENCES ATENDIMENTO(COD),
PRIMARY KEY(ATENDIMENTO))
			
CREATE TABLE TEST_DRIVE(
HORA_COMECO TIME NOT NULL,
HORA_FIM TIME NOT NULL,
CARRO SERIAL NOT NULL REFERENCES CARRO(COD),
ATENDIMENTO SERIAL NOT NULL REFERENCES ATENDIMENTO(COD),
PRIMARY KEY(ATENDIMENTO))
			
CREATE TABLE VENDA(
CARRO SERIAL NOT NULL REFERENCES CARRO(COD),
ATENDIMENTO SERIAL NOT NULL REFERENCES ATENDIMENTO(COD),
PRIMARY KEY(ATENDIMENTO))
			
			
drop table venda,test_drive;
drop table reserva_test_drive,atendimento,
		DROP TABLE funcionario_concessionaria,carro,
		modelo,concessionaria,cliente,funcionario
			

			
			
			
			
			
			