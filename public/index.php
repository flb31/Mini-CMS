<?php require_once(dirname(__FILE__) . '/../setting/core.php' ); ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title><?= site_info('titulo') .' - '. page_info('titulo') ?></title>
</head>
<body>
 
 <h1><?= site_info('titulo') ?></h1>

 <?= page_info('contenido') ?>

 <small><?= site_info('titulo') ?> todos los derechos reservados. Dirección: <?= site_info('direccion') ?></small>  
</body>
</html>