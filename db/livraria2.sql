-- phpMyAdmin SQL Dump
-- version 4.9.2deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 11-Fev-2020 às 15:19
-- Versão do servidor: 8.0.19-0ubuntu0.19.10.3
-- versão do PHP: 7.3.11-0ubuntu0.19.10.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `livraria2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `idautor` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`idautor`, `nome`, `email`) VALUES
(1, 'J.K.Rowling', 'jk@hp.com'),
(2, 'J.R.R.Tolkein', 'jrr@ceu.com'),
(3, 'Jorge Amado', 'ja@ceu.com'),
(4, 'Machado de Assis', 'ma@cemiterio.com'),
(5, 'Suzanne Collins', 'sc@legal.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nome`, `telefone`) VALUES
(1, 'Joao Silva ', '1111'),
(2, 'Maria Cunha', '2222'),
(3, 'Pedro Aguiar', '8888'),
(4, 'Elaine Luciana', '9374'),
(5, 'Antonio Pereira', '3764');

-- --------------------------------------------------------

--
-- Estrutura da tabela `escreve`
--

CREATE TABLE `escreve` (
  `idlivro` int NOT NULL,
  `idautor` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `escreve`
--

INSERT INTO `escreve` (`idlivro`, `idautor`) VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE `genero` (
  `idgenero` int NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`idgenero`, `descricao`) VALUES
(1, 'Aventura'),
(2, 'Ficção'),
(3, 'Suspense'),
(4, 'Romance'),
(5, 'Infantil'),
(6, 'Auto-Ajuda');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_da_venda`
--

CREATE TABLE `itens_da_venda` (
  `idvenda` int NOT NULL,
  `idlivro` int NOT NULL,
  `qtd` int DEFAULT NULL,
  `subtotal` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itens_da_venda`
--

INSERT INTO `itens_da_venda` (`idvenda`, `idlivro`, `qtd`, `subtotal`) VALUES
(1, 1, 1, NULL),
(2, 1, 1, NULL),
(3, 3, 1, NULL),
(3, 2, 1, NULL),
(4, 4, 1, NULL),
(5, 1, 1, NULL),
(6, 3, 1, NULL),
(7, 5, 1, NULL),
(8, 2, 1, NULL),
(8, 1, 1, NULL),
(9, 4, 1, NULL),
(10, 5, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `idlivro` int NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `preco` float DEFAULT NULL,
  `estoque` int DEFAULT '0',
  `idgenero` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`idlivro`, `titulo`, `preco`, `estoque`, `idgenero`) VALUES
(1, 'Jogos Vorazes', 25, 10, 1),
(2, 'A Esperença', 35, 5, 1),
(3, 'Em Chamas', 40, 8, 1),
(4, 'Harry Potter e a Pedra Filosofal', 20, 12, 5),
(5, 'Harry Potter e o Prisioneiro de Azkaban', 25, 3, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idvenda` int NOT NULL,
  `data` date DEFAULT NULL,
  `total` float DEFAULT '0',
  `idcliente` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`idvenda`, `data`, `total`, `idcliente`) VALUES
(1, '2012-08-14', 0, 1),
(2, '2012-07-10', 0, 2),
(3, '2012-08-02', 0, 0),
(4, '2012-05-30', 0, 4),
(5, '2011-09-10', 0, 5),
(6, '2011-08-15', 0, 5),
(7, '0000-00-00', 0, 0),
(8, NULL, 0, 0),
(9, NULL, 0, 0),
(10, NULL, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idautor`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Índices para tabela `escreve`
--
ALTER TABLE `escreve`
  ADD PRIMARY KEY (`idlivro`,`idautor`),
  ADD KEY `fk_livro_has_autor_autor1` (`idautor`);

--
-- Índices para tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idgenero`);

--
-- Índices para tabela `itens_da_venda`
--
ALTER TABLE `itens_da_venda`
  ADD PRIMARY KEY (`idvenda`,`idlivro`),
  ADD KEY `fk_venda_has_livro_livro1` (`idlivro`);

--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`idlivro`,`idgenero`),
  ADD KEY `fk_livro_Genero1` (`idgenero`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idvenda`,`idcliente`),
  ADD KEY `fk_venda_cliente1` (`idcliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `idautor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `idgenero` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `idlivro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idvenda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
