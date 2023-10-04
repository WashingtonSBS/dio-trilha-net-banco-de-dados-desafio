/*Objetivo 01 - Buscar o nome e ano dos filmes*/
SELECT TOP (50)
	FL.[Nome]
	, FL.[Ano]
FROM [Filmes].[dbo].[Filmes] AS FL;

/*Objetivo 02 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano*/
SELECT TOP (50)
	FL.[Nome]
	, FL.[Ano]
	, FL.[Duracao]
FROM [Filmes].[dbo].[Filmes] AS FL
ORDER BY FL.ANO;

/*Objetivo 03 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração*/
SELECT TOP (50)
	FL.[Nome]
	, FL.[Ano]
	, FL.[Duracao]
FROM [Filmes].[dbo].[Filmes] AS FL
WHERE
	FL.Nome = 'De Volta para o Futuro';

/*Objetivo 04 - Buscar os filmes lançados em 1997*/
SELECT TOP (50)
	FL.[Nome]
	, FL.[Ano]
	, FL.[Duracao]
FROM [Filmes].[dbo].[Filmes] AS FL
WHERE
	FL.Ano = 1997;

/*Objetivo 05 - Buscar os filmes lançados APÓS o ano 2000*/
SELECT TOP (50)
	FL.[Nome]
	, FL.[Ano]
	, FL.[Duracao]
FROM [Filmes].[dbo].[Filmes] AS FL
WHERE
	FL.Ano > 2000;

/*Objetivo 06 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente*/
SELECT TOP (50)
	FL.[Nome]
	, FL.[Ano]
	, FL.[Duracao]
FROM [Filmes].[dbo].[Filmes] AS FL
WHERE
	FL.Duracao > 100 AND FL.Duracao < 150
ORDER BY FL.Duracao;

/*Objetivo 07 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente*/
SELECT TOP (50)
	FL.[Ano]
	, COUNT(*) AS 'Quantidade'
FROM [Filmes].[dbo].[Filmes] AS FL
GROUP BY FL.ANO
ORDER BY SUM(FL.[Duracao]) DESC;

/*Objetivo 08 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome*/
SELECT TOP (50)
	AR.[Id]
	, AR.[PrimeiroNome]
	, AR.[UltimoNome]
	, AR.[Genero]
FROM [Filmes].[dbo].[Atores] AS AR
WHERE
	AR.Genero = 'M'
ORDER BY AR.[Id];

/*Objetivo 09 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome*/
SELECT TOP (50)
	AR.[Id]
	, AR.[PrimeiroNome]
	, AR.[UltimoNome]
	, AR.[Genero]
FROM [Filmes].[dbo].[Atores] AS AR
WHERE
	AR.Genero = 'F'
ORDER BY AR.[PrimeiroNome];

/*Objetivo 10 - Buscar o nome do filme e o gênero*/
SELECT TOP (50)
	FL.[Nome]
	, GR.[Genero]
FROM [Filmes].[dbo].[Filmes] AS FL
	INNER JOIN [Filmes].[dbo].[FilmesGenero] AS FLG ON (FLG.IdFilme = FL.Id)
	INNER JOIN [Filmes].[dbo].[Generos] AS GR ON (GR.Id = FLG.IdGenero)
ORDER BY GR.[Genero], FL.[Nome];

/*Objetivo 11 - Buscar o nome do filme e o gênero do tipo "Mistério"*/
SELECT TOP (50)
	FL.[Nome]
	, GR.[Genero]
FROM [Filmes].[dbo].[Filmes] AS FL
	INNER JOIN [Filmes].[dbo].[FilmesGenero] AS FLG ON (FLG.IdFilme = FL.Id)
	INNER JOIN [Filmes].[dbo].[Generos] AS GR ON (GR.Id = FLG.IdGenero)
WHERE
	GR.Genero = 'Mistério'
ORDER BY GR.[Genero], FL.[Nome];

/*Objetivo 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel*/
SELECT TOP (50)
	FL.[Nome]
	, AR.[PrimeiroNome]
	, AR.[UltimoNome]
	, EFL.[Papel]
FROM [Filmes].[dbo].[Filmes] AS FL
	INNER JOIN [Filmes].[dbo].[FilmesGenero] AS FLG ON (FLG.IdFilme = FL.Id)
	INNER JOIN [Filmes].[dbo].[Generos] AS GR ON (GR.Id = FLG.IdGenero)
	INNER JOIN [Filmes].[dbo].[ElencoFilme] AS EFL ON (EFL.IdFilme = FL.Id)
	INNER JOIN [Filmes].[dbo].[Atores] AS AR ON (AR.Id = EFL.IdAtor)
ORDER BY FL.[Nome];
