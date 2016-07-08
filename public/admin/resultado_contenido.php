<?php
$path = dirname(__FILE__);
require_once( $path . '/../../setting/config.php');
require_once( $path . '/../../setting/mysql.php');


$content = $_POST['content'];
$id = $_POST['id'];
$title = $_POST['title'];
$type = $_POST['type'];
$category = ($type == 'PAGE') ? '': $_POST['category'];
$date = date('Y-m-d H:i:s');
$alias = $_POST['alias'];

if($id > 0){
  $sql = <<<SQL
  UPDATE contenidos SET titulo = '$title', tipo= '$type', contenido = '$content', categoria = '$category', alias = '$alias' WHERE id='$id'
SQL;
}else{
  $sql = <<<SQL
  INSERT INTO contenidos (titulo, tipo, contenido, categoria, alias) VALUES ('$title', '$type', '$content', '$category', '$alias')
SQL;
}


$mysql = new Mysql();
$response = ( $mysql->execute($sql) ) ? 'Contenido guardado exitosamente!' : 'Error al guardar contenido.';
header("Location: " . Config::URL .  "admin/page-respuesta.php?response=$response");

?>