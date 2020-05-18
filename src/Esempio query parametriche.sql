/*
*	Creazione della relazione/tabella test.
*	Formata da:
*		- id: 	varchar
*		- nome:	varchar
*/
CREATE TABLE test(
	id VARCHAR(10) PRIMARY KEY,
	nome VARCHAR(20)
);

/*
*	Inserimento di un valore di esempio
*/
INSERT INTO test VALUES('wow','nome');

/*
*	Creazione di una vista parametrica (si adotta la parola PREPARE)
*/
/*PREPARE + <nome_vista> + (<parametri>) + as (<query>)*/
PREPARE VediNumPartecipanti (varchar) as (
	/*selezioni tutti i partecipanti*/
  	SELECT *
	FROM test
	/*che hanno come id il primo parametro che ho segnato
	$1 = 1°parametro (il varchar) */
	WHERE id = $1
);

/*
*	Mando in esecuzione la query mediante EXECUTE.
*	passo come parametro un varchar che abbia senso all'intero nella query.
*/
EXECUTE VediNumPartecipanti('wow');
