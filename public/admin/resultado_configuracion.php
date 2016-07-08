<?php
$path = dirname(__FILE__);
require_once( $path . '/../../setting/config.php');
require_once( $path . '/../../setting/mysql.php');

$mysql = new Mysql();
$sql = <<<SQL
  SELECT * FROM configuracion LIMIT 1
SQL;
$res = $mysql->search($sql);


//Vars
$title = $_POST['title'];
$address = $_POST['address'];
$geolocation = $_POST['geolocation'];

if( count($res) > 0 ){
  $sql = <<<SQL
  UPDATE configuracion SET titulo = '$title' , direccion = '$address', geolocalizacion = '$geolocation'
SQL;
}else{
  $sql = <<<SQL
  INSERT INTO configuracion (titulo, direccion, geolocalizacion) VALUES ('$title' ,'$address', '$geolocation')
SQL;
}

$response = ( $mysql->execute($sql) ) ? 'Guardado exitoso!' : 'Error al guardar configuración.';

header("Location: " . Config::URL .  "admin/page-respuesta.php?response=$response");

?>