-- creating the tables

-- actor table
create table ator(
    cod_ator int,
    nome_ator varchar(50) not null,
    cidade_ator varchar(50) not null,
    pais_ator varchar(10) not null,
    genero_ator varchar(1) not null,
    primary key(cod_ator)
);

-- director table
create table diretor(
    cod_diretor int,
    nome_diretor varchar(50),
    cidade_diretor varchar(50),
    pais_diretor varchar(50),
    primary key(cod_diretor)
);

-- movie table
create table filme(
    cod_filme int,
    titulo varchar(50) not null,
    cod_diretor int not null,
    primary key(cod_filme),
    foreign key(cod_diretor) references diretor(cod_diretor)
);

-- award table
create table premio(
    cod_premio int,
    descricao_premio varchar(50) not null,
    primary key(cod_premio)
);

-- participation table
create table participacao(
    a_cod_ator int,
    f_cod_filme int,
    primary key(a_cod_ator, f_cod_filme),
    foreign key(a_cod_ator) references ator(cod_ator),
    foreign key(f_cod_filme) references filme(cod_filme)
);
    
-- nominations table
create table premiacao(
    f_cod_filme int,
    p_cod_premio int,
    ano int not null,
    primary key(f_cod_filme, p_cod_premio),
    foreign key(f_cod_filme) references filme(cod_filme),
    foreign key(p_cod_premio) references premio(cod_premio)
);

-- Inserting data

-- actor table
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (1, 'Alan Arkin', 'Nova York', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (2, 'Alec Baldwin', 'Nova York', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (3, 'Ben Affleck', 'California', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (4, 'Bérénice Bejo', 'Buenos Aires', ' ARG', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (5, 'Bradley Cooper', 'Pensilvania', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (6, 'Brian May', 'Hampton', ' GBR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (7, 'Brie Larson', 'California', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (8, 'Casey Affleck', 'Massachusetts', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (9, 'Cate Blanchett', 'Ivanhoe', ' AUS', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (10, 'Chiwetel Ejiofor', 'Londres', ' GBR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (11, 'Colin Firth', 'Grayshott', ' GBR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (12, 'Daniel Day-Lewis', 'Londres', ' GBR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (13, 'Doug Jones', 'Indiana', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (14, 'Eddie Redmayne', 'Londres', ' GBR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (15, 'Edward Norton', 'Massachusetts', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (16, 'Emma Stone', 'Arizona', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (17, 'Felicity Jones', 'Birmingham', ' GBR', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (18, 'Finn Wittrock', 'Massachusetts', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (19, 'Frances McDormand ', 'Illinois', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (20, 'Gary Oldman', 'Londres', ' GBR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (21, 'Geoffrey Rush', 'Toowoomba', ' AUS', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (22, 'George Clooney', 'Kentucky', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (23, 'Irrfan Khan', 'Tonk', ' IND', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (24, 'Jacob Tremblay', 'Vancouver', ' CAN', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (25, 'Jean Dujardin', 'Rueil-Malmaison', ' FRA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (26, 'Jennifer Garner', 'Texas', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (27, 'Jennifer Lawrence', 'Kentucky', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (28, 'Jim Broadbent', 'Holton cum Beckering', ' GBR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (29, 'Joaquin Phoenix', 'Rio Piedras', ' PUR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (30, 'Julianne Moore', 'Carolina do Norte', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (31, 'Kristen Stewart', 'California', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (32, 'Leonardo DiCaprio', 'California', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (33, 'Lily James', 'Esher', ' GBR', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (34, 'Lucas Hedges', 'Nova York', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (35, 'Mahershala Ali', 'California', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (36, 'Marcus Ornellas', 'Rio Grande do Sul', ' BRA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (37, 'Marina de Tavira', 'Cidade do México', ' MEX', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (38, 'Mark Ruffalo', 'Wisconsin', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (39, 'Matthew McConaughey', 'Texas', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (40, 'Meryl Streep', 'Nova Jersey', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (41, 'Michael Fassbender', 'Heidelberg', ' GER', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (42, 'Michael Keaton', 'Pensilvania', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (43, 'Mila Kunis', 'Chernivtsi', ' UKR', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (44, 'Natalie Portman', 'Jerusalem', ' ISR', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (45, 'Olivia Colman', 'Norwich', ' GBR', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (46, 'Park Seo-joon', 'Seul', ' KOR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (47, 'Rachel Weisz', 'Londres', ' GBR', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (48, 'Rami Malek', 'California', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (49, 'Renée Zellweger', 'Texas', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (50, 'Robert De Niro', 'Nova York', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (51, 'Ryan Gosling', 'London', ' CAN', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (52, 'Sally Field', 'California', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (53, 'Sally Hawkins', 'Londres', ' GBR', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (54, 'Sandra Bullock', 'Virginia', ' USA', 'F');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (55, 'Song Kang-ho', 'Gimhae', ' KOR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (56, 'Suraj Sharma', 'Nova Delhi', ' IND', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (57, 'Tom Hardy', 'Londres', ' GBR', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (58, 'Trevante Rhodes', 'Luisiana', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (59, 'Viggo Mortensen', 'Nova York', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (60, 'Woody Harrelson', 'Texas', ' USA', 'M');
INSERT INTO Ator(Cod_Ator, Nome_Ator, Cidade_Ator, Pais_Ator, Genero_Ator) VALUES (61, 'Yalitza Aparicio', 'Tlaxiaco', ' MEX', 'F');


-- director table
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (1, 'Alejandro González', 'Cidade do Mexico', 'MEX');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (2, 'Alfonso Cuarón', 'Cidade do Mexico', 'MEX');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (3, 'Ang Lee', 'Pingtung', 'CHN');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (4, 'Barry Jenkins', 'Florida', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (5, 'Ben Affleck', 'California', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (6, 'Bong Joon-ho', 'Daegu', 'KOR');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (7, 'Bryan Singer', 'Nova York', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (8, 'Damien Chazelle', 'Rhode Island', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (9, 'Darren Aronofsky', 'Nova York', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (10, 'David O. Russell', 'Nova York', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (11, 'Guillermo del Toro', 'Guadalajara', 'MEX');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (12, 'James Marsh', 'Truro', 'GBR');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (13, 'Jean-Marc Vallée', 'Montreal', 'CAN');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (14, 'Joe Wright', 'Londres', 'GBR');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (15, 'Kenneth Lonergan', 'Nova York', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (16, 'Lenny Abrahamson', 'Dublin', 'IRL');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (17, 'Martin McDonagh', 'Londres', 'GBR');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (18, 'Michel Hazanavicius', 'Paris', 'FRA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (19, 'Peter Farrelly', 'Pensilvania', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (20, 'Phyllida Lloyd', 'Bristol', 'GBR');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (21, 'Rupert Goold', 'Londres', 'GBR');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (22, 'Steve McQueen', 'Londres', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (23, 'Steven Spielberg', 'Ohio', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (24, 'Todd Phillips', 'Nova York', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (25, 'Tom Hopper', 'Coalville', 'GBR');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (26, 'Tom McCarthy', 'Nova Jersey', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (27, 'Wash Westmoreland', 'Leeds', 'GBR');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (28, 'Woody Allen', 'Bronx', 'USA');
INSERT INTO Diretor(Cod_Diretor, Nome_Diretor, Cidade_Diretor, Pais_Diretor) VALUES (29, 'Yorgos Lanthimos', 'Atenas', 'GRE');


-- movie table
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (1, 'O Discurso do Rei', 25);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (2, 'Cisne Negro', 9);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (3, 'O Artista', 18);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (4, 'A Dama de Ferro', 20);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (5, 'Argo', 5);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (6, 'As Aventuras de Pi', 3);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (7, 'Lincoln', 23);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (8, 'O Lado Bom da Vida', 10);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (9, '12 Anos de Escravidão', 22);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (10, 'Gravidade', 2);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (11, 'Clube de Compras Dallas', 13);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (12, 'Blue Jasmine', 28);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (13, 'Birdman', 1);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (14, 'A Teoria de Tudo', 12);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (15, 'Para Sempre Alice', 27);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (16, 'Spotlight: Segredos Revelados', 26);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (17, 'O Regresso', 1);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (18, 'O Quarto de Jack', 16);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (19, 'Moonlight: Sob a Luz do Luar', 4);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (20, 'La La Land', 8);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (21, 'Manchester à Beira-Mar', 15);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (22, 'A Forma da Água', 11);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (23, 'O Destino de Uma Nação', 14);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (24, 'Três Anúncios Para Um Crime', 17);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (25, 'Green Book: O Guia', 19);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (26, 'Roma', 2);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (27, 'Bohemian Rhapsody', 7);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (28, 'A Favorita', 29);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (29, 'Parasita', 6);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (30, 'Coringa', 24);
INSERT INTO Filme(Cod_Filme, Titulo, Cod_Diretor) VALUES (31, 'Judy: Muito Além do Arco-Íris', 21);


-- award table
INSERT INTO Premio(Cod_Premio, Descricao_Premio) VALUES (1, 'Melhor Filme');
INSERT INTO Premio(Cod_Premio, Descricao_Premio) VALUES (2, 'Melhor Diretor');
INSERT INTO Premio(Cod_Premio, Descricao_Premio) VALUES (3, 'Melhor Ator');
INSERT INTO Premio(Cod_Premio, Descricao_Premio) VALUES (4, 'Melhor Atriz');


-- participation table
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (7, 18);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (11, 1);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (40, 4);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (9, 12);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (45, 28);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (44, 2);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (39, 11);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (48, 27);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (12, 7);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (16, 20);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (27, 8);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (49, 31);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (14, 14);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (29, 30);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (19, 24);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (30, 15);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (20, 23);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (25, 3);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (8, 21);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (32, 17);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (21, 1);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (43, 2);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (4, 3);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (28, 4);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (3, 5);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (1, 5);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (56, 6);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (23, 6);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (52, 7);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (5, 8);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (10, 9);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (41, 9);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (54, 10);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (22, 10);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (26, 11);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (2, 12);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (42, 13);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (15, 13);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (17, 14);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (31, 15);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (38, 16);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (57, 17);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (24, 18);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (35, 19);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (58, 19);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (51, 20);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (34, 21);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (53, 22);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (13, 22);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (33, 23);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (60, 24);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (59, 25);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (35, 25);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (61, 26);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (37, 26);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (6, 27);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (47, 28);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (55, 29);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (46, 29);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (50, 30);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (18, 31);
INSERT INTO Participacao(A_Cod_Ator, F_Cod_Filme) VALUES (42, 16);


-- nomination table
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (1, 1, 2011);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (1, 2, 2011);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (1, 3, 2011);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (2, 4, 2011);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (3, 1, 2012);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (3, 2, 2012);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (3, 3, 2012);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (4, 4, 2012);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (5, 1, 2013);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (6, 2, 2013);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (7, 3, 2013);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (8, 4, 2013);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (9, 1, 2014);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (10, 2, 2014);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (11, 3, 2014);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (12, 4, 2014);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (13, 1, 2015);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (13, 2, 2015);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (14, 3, 2015);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (15, 4, 2015);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (16, 1, 2016);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (17, 2, 2016);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (17, 3, 2016);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (18, 4, 2016);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (19, 1, 2017);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (20, 2, 2017);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (21, 3, 2017);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (20, 4, 2017);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (22, 1, 2018);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (22, 2, 2018);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (23, 3, 2018);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (24, 4, 2018);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (25, 1, 2019);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (26, 2, 2019);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (27, 3, 2019);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (28, 4, 2019);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (29, 1, 2020);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (29, 2, 2020);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (30, 3, 2020);
INSERT INTO Premiacao(F_Cod_Filme, P_Cod_Premio, Ano) VALUES (31, 4, 2020);


/*
drop table ator cascade constraints purge;
drop table diretor cascade constraints purge;
drop table filme cascade constraints purge;
drop table participacao cascade constraints purge;
drop table premiacao cascade constraints purge;
drop table premio cascade constraints purge;
*/


-- final tests

-- referential integrity
select * from participacao;

insert into participacao values (100, 1); -- actor PK 100 does not exists

insert into premiacao values(6, 8, 2022); -- premiation PK 8 does not exists

-- domain restriction
insert into premio values ('cod123', 'Melhor Roteiro'); -- award PK should be integer, not string

-- not null restriction
insert into ator values (101, 'Lázaro Ramos', 'Salvador', NULL, 'M'); -- null values are not accepted for country

-- key restriction
insert into premio values (1, 'Melhor Ator Coadjuvante'); -- PK 1 already exists, can't add another award with PK 1

insert into premiacao values (1, 1, 2022); -- same thing PK already exists (in this case PK is the tuple (movie code, award code) = (1, 1))

/*
to make it possible to follow the business rule: a movie can't receive the same award in the same year,
it wold be necessary to make the year attribute part of the PK too. 
in this case, the PK would be (movie code, award code, year of premiation)
*/

-- entity integrity restriction in the actor table
insert into ator values (null, 'Fabio Porchart', 'Rio de Janeiro', 'BRA', 'M'); -- PK does not allow null values


/*
More tests can be done to identify possible issues with the database.

For example: 

    - allow only a set of options for the country and city columns of each table
    - allow only a set of options for the
*/


