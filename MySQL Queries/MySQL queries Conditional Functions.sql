# IF: just the common if everyone nows
SET @notaDesempenho = 8.9;
#SELECT IF(@notaDesempenho >= 7, 0.1, 0);

SELECT IF(@notaDesempenho >= 7, 0.1, IF(@notaDesempenho >= 5, 0.05, 0));

SELECT
	*,
    IF(Num_Funcionarios >= 20, "Recebe Reforma", "Nâo Recebe Reforma") AS "Status"
FROM lojas;

# IFNULL: if the first parameter is null, returns the second parameter, else, returns the first parameter
SELECT IFNULL(NULL, "Alternate value");

SELECT 
	*, 
    IFNULL(Telefone, "0800-999-9999 FROM lojas") AS 'Novo Telefone' 
FROM clientes;

# NULLIF: check if the first and second parameters are equal, if they are return null, if not return the first parameter
SELECT NULLIF('hello', 'hello');
SELECT NULLIF('hey', 'hello');

# CASE THEN AND/OR: used to check multiple conditions one by one. If a condition in the top matches, the checking stops.
SELECT
	*,
    CASE
		WHEN Renda_Anual >= 70000 THEN 'Rich'
        WHEN Renda_Anual >= 40000 THEN 'Normal'
        ELSE 'Poor'
    END AS 'Status'
FROM clientes;

SELECT
	*,
    CASE
		WHEN Renda_Anual >= 70000 AND Escolaridade IN ('Graduação', 'Pós-Graduado') THEN 'Class 1'
        WHEN Renda_Anual >= 40000 OR Escolaridade IN ('Ensino Médio') THEN 'Class 2'
        WHEN Renda_Anual < 70000 AND  Escolaridade IN ('Graduação', 'Pós-Graduado') THEN 'Class 3'
        ELSE 'Undefined'
    END AS 'Status'
FROM clientes;
