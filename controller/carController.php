<?php

require_once __DIR__ . '/../core/database.php';

$id = $_GET['id'];

$listaImagem =  $pdo->query("SELECT * FROM imagens WHERE id_produto = {$id}");

$listaImagem->execute();

$fetchImagem = $listaImagem->fetchAll();

$listaProduto = $pdo->query("SELECT 
p.id_produto, 
p.produto, 
p.id_marca, 
p.descricao, 
p.preco, 
p.img, 
m.id_marca, 
m.marca 
FROM produtos AS p
INNER JOIN marcas AS m ON p.id_marca = m.id_marca
WHERE p.id_produto = {$id}");

$listaProduto->execute();

$fetchProdutos = $listaProduto->fetch();

require_once __DIR__ . '/../views/car.php';
