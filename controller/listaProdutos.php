<?php

require_once __DIR__ . "/../core/database.php";

$list = $pdo->query("
SELECT 
    p.id_produto,
    p.produto,
    p.id_marca,
    p.descricao,
    p.preco,
    p.img,
    m.id_marca,
    m.marca
FROM produtos AS p
INNER JOIN 
    marcas AS m on m.id_marca = p.id_marca");

$list->execute();

$fetch = $list->fetchAll();

$json = json_encode($fetch);

echo $json;
