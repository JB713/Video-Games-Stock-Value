
-- The name of the new database should be: videogames

-- First let's make sure we start from scratch:
-- Tables need to be dropped in this order

DROP TABLE IF EXISTS games_sales;
DROP TABLE IF EXISTS game_platform;
DROP TABLE IF EXISTS video_game;
DROP TABLE IF EXISTS platform_catalog;

DROP TABLE IF EXISTS stock_history;
DROP TABLE IF EXISTS stock;

-- The following are the tables that need to be created in the database:
-- Tables need to be created in this order

CREATE TABLE video_game (
    id int PRIMARY KEY NOT NULL,
    game_name varchar(255) NOT NULL,
    publisher varchar(255) NOT NULL
);

CREATE TABLE games_sales (
    id int PRIMARY KEY NOT NULL,
    id_game int NOT NULL,
    na_sales numeric NOT NULL,
    year int NOT NULL,
    FOREIGN KEY (id_game) REFERENCES video_game(id)
);

CREATE TABLE platform_catalog (
    id int PRIMARY KEY NOT NULL,
    platform_name varchar(255)   NOT NULL,
    company_name varchar(255)   NOT NULL
);

CREATE TABLE game_platform (
    id_game int NOT NULL,
    id_platform int NOT NULL,
    released_date date NOT NULL,
    metascore numeric NOT NULL,
    userscore numeric NOT NULL,
    FOREIGN KEY (id_game) REFERENCES video_game(id),
    FOREIGN KEY (id_platform) REFERENCES platform_catalog(id),
    PRIMARY KEY (id_game, id_platform)
);

CREATE TABLE stock (
    ticker varchar(10) PRIMARY KEY NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    market varchar(255) NOT NULL
);

CREATE TABLE stock_history (
    id int PRIMARY KEY NOT NULL,
    ticker varchar(10) NOT NULL,
    open_price numeric NOT NULL,
    close_price numeric NOT NULL,
    volume numeric NOT NULL,
    date date NOT NULL,
    FOREIGN KEY (ticker) REFERENCES stock(ticker)
);

