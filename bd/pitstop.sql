-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Out-2021 às 22:40
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pitstop`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizaEstoque` (IN `codigo` INT, IN `quantidade` INT)  BEGIN
declare contador int(11);
select count(*) into contador from estoque where Produto_codigo=codigo;

if contador > 0 then update estoque set saldoAnterior=saldoAtual,saldoAtual=saldoAtual+quantidade where Produto_codigo=codigo;
else insert into estoque set Produto_codigo=codigo,saldoAnterior=0,saldoAtual=quantidade; end if; 

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bico`
--

CREATE TABLE `bico` (
  `codigo` int(11) NOT NULL,
  `inicial` varchar(45) DEFAULT NULL,
  `fechamento` varchar(45) NOT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `Produto_codigo` int(11) NOT NULL,
  `Funcionario_codigo` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bico`
--

INSERT INTO `bico` (`codigo`, `inicial`, `fechamento`, `cor`, `createdAt`, `Produto_codigo`, `Funcionario_codigo`, `descricao`) VALUES
(1, '40', '40', 'vermelho', '2021-10-25', 1, 3, 'Bico 01'),
(2, '20', '40', 'azul', '2021-10-25', 2, 4, 'Bico 02');

--
-- Acionadores `bico`
--
DELIMITER $$
CREATE TRIGGER `insertHistorico` AFTER INSERT ON `bico` FOR EACH ROW begin
	insert into historicoBico set fechamento=new.fechamento,Bico_codigo=new.codigo,funcionario=new.Funcionario_codigo;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatetHistorico` AFTER UPDATE ON `bico` FOR EACH ROW begin
	insert into historicoBico set fechamento=new.fechamento-old.fechamento,Bico_codigo=new.codigo,funcionario=new.Funcionario_codigo;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `codigo` int(11) NOT NULL,
  `createAt` date DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `Funcionario_codigo` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `HistoricoBico_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `caixa`
--

INSERT INTO `caixa` (`codigo`, `createAt`, `descricao`, `Funcionario_codigo`, `valor`, `HistoricoBico_codigo`) VALUES
(1, '2021-10-25', 'Gasolina Aditivada', 3, '132.00', 3),
(2, '2021-10-25', 'Gasolina Comun', 3, '260.00', 4),
(3, '2021-10-25', 'Gasolina Aditivada', 4, '132.00', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`codigo`, `nome`, `createdAt`) VALUES
(1, 'Gasolina', '2021-10-25'),
(2, 'Allcool', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrada`
--

CREATE TABLE `entrada` (
  `codigo` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor` decimal(7,2) DEFAULT NULL,
  `obs` varchar(100) DEFAULT NULL,
  `Produto_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `quantidadeInicial` int(11) NOT NULL,
  `quantidadeFinal` int(11) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `Produto_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codigo`, `nome`, `telefone`, `email`, `endereco`) VALUES
(3, 'Mauricio', '25656353', 'macedo@piststop', 'centro'),
(4, 'elias', '3656565', 'adm@pitstop', 'centreo');

--
-- Acionadores `funcionario`
--
DELIMITER $$
CREATE TRIGGER `insertUsuario` AFTER INSERT ON `funcionario` FOR EACH ROW begin
	insert into usuario set usuario=new.email,senha=123,painel="administrador",funcionario_codigo=new.codigo;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateUsuario` AFTER UPDATE ON `funcionario` FOR EACH ROW begin
	update usuario set usuario=new.email,senha=123,painel="administrador",funcionario_codigo=new.codigo;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicobico`
--

CREATE TABLE `historicobico` (
  `codigo` int(11) NOT NULL,
  `fechamento` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT current_timestamp(),
  `Bico_codigo` int(11) NOT NULL,
  `funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `historicobico`
--

INSERT INTO `historicobico` (`codigo`, `fechamento`, `createdAt`, `Bico_codigo`, `funcionario`) VALUES
(3, '20', '2021-10-25', 2, 4),
(4, '40', '2021-10-25', 1, 3),
(5, '20', '2021-10-25', 2, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `codigo` int(11) NOT NULL,
  `dataPagamento` date DEFAULT NULL,
  `valor` decimal(7,2) DEFAULT NULL,
  `TipoPagamento_codigo` int(11) NOT NULL,
  `Caixa_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`codigo`, `dataPagamento`, `valor`, `TipoPagamento_codigo`, `Caixa_codigo`) VALUES
(1, '2021-10-25', '100.00', 3, 1),
(2, '2021-10-25', '32.00', 1, 1),
(3, '2021-10-25', '260.00', 1, 2),
(4, '2021-10-25', '132.00', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `precoVenda` decimal(7,2) DEFAULT NULL,
  `PrecoCompra` decimal(7,2) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updateAt` date DEFAULT NULL,
  `Categoria_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codigo`, `descricao`, `precoVenda`, `PrecoCompra`, `quantidade`, `createdAt`, `updateAt`, `Categoria_codigo`) VALUES
(1, 'Gasolina Comun', '6.50', '4.50', 20, '2021-10-25', '2021-10-25', 1),
(2, 'Gasolina Aditivada', '6.60', '4.50', 20, '2021-10-25', '2021-10-25', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipopagamento`
--

CREATE TABLE `tipopagamento` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipopagamento`
--

INSERT INTO `tipopagamento` (`codigo`, `descricao`) VALUES
(1, 'Dinheiro'),
(2, 'Pix'),
(3, 'Cartão de credito'),
(4, 'Cartão de débito'),
(5, 'Transferencia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL,
  `painel` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `Funcionario_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`codigo`, `painel`, `usuario`, `senha`, `status`, `Funcionario_codigo`) VALUES
(1, 'administrador', 'macedo@piststop', '123', NULL, 3),
(2, 'administrador', 'adm@pitstop', '123', NULL, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bico`
--
ALTER TABLE `bico`
  ADD PRIMARY KEY (`codigo`,`Produto_codigo`),
  ADD KEY `fk_Bico_Produto1_idx` (`Produto_codigo`),
  ADD KEY `fk_Bico_Funcionario1_idx` (`Funcionario_codigo`);

--
-- Índices para tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`codigo`,`Funcionario_codigo`,`HistoricoBico_codigo`),
  ADD KEY `fk_Caixa_Funcionario1_idx` (`Funcionario_codigo`),
  ADD KEY `fk_Caixa_HistoricoBico1_idx` (`HistoricoBico_codigo`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`codigo`,`Produto_codigo`),
  ADD KEY `fk_Entrada_Produto1_idx` (`Produto_codigo`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`Produto_codigo`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `historicobico`
--
ALTER TABLE `historicobico`
  ADD PRIMARY KEY (`codigo`,`Bico_codigo`),
  ADD KEY `fk_HistoricoBico_Bico_idx` (`Bico_codigo`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`codigo`,`TipoPagamento_codigo`,`Caixa_codigo`),
  ADD KEY `fk_Pagamento_TipoPagamento1_idx` (`TipoPagamento_codigo`),
  ADD KEY `fk_Pagamento_Caixa1_idx` (`Caixa_codigo`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`,`Categoria_codigo`),
  ADD KEY `fk_Produto_Categoria1_idx` (`Categoria_codigo`);

--
-- Índices para tabela `tipopagamento`
--
ALTER TABLE `tipopagamento`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`,`Funcionario_codigo`),
  ADD KEY `fk_usuario_Funcionario1_idx` (`Funcionario_codigo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bico`
--
ALTER TABLE `bico`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `historicobico`
--
ALTER TABLE `historicobico`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipopagamento`
--
ALTER TABLE `tipopagamento`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `bico`
--
ALTER TABLE `bico`
  ADD CONSTRAINT `fk_Bico_Funcionario1` FOREIGN KEY (`Funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Bico_Produto1` FOREIGN KEY (`Produto_codigo`) REFERENCES `produto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `fk_Caixa_Funcionario1` FOREIGN KEY (`Funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Caixa_HistoricoBico1` FOREIGN KEY (`HistoricoBico_codigo`) REFERENCES `historicobico` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_Entrada_Produto1` FOREIGN KEY (`Produto_codigo`) REFERENCES `produto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_Estoque_Produto1` FOREIGN KEY (`Produto_codigo`) REFERENCES `produto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `historicobico`
--
ALTER TABLE `historicobico`
  ADD CONSTRAINT `fk_HistoricoBico_Bico` FOREIGN KEY (`Bico_codigo`) REFERENCES `bico` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_Pagamento_Caixa1` FOREIGN KEY (`Caixa_codigo`) REFERENCES `caixa` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pagamento_TipoPagamento1` FOREIGN KEY (`TipoPagamento_codigo`) REFERENCES `tipopagamento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_Produto_Categoria1` FOREIGN KEY (`Categoria_codigo`) REFERENCES `categoria` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_Funcionario1` FOREIGN KEY (`Funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
