<?php

  require_once( 'config.php');
  require_once( 'mysql.php');
  require_once( '../public/lib/snippets.php');


  function info_web(){
    $mysql = new Mysql();
    $sql = <<<SQL
    SELECT * FROM configuracion LIMIT 1
SQL;
    $res = $mysql->search($sql);
    
    while( is_array($res[0]) &&  list($key,$value) = each($res[0]) ){
      $name_var = Config::PREFIX.$key;
      $GLOBALS[$name_var] = $value;
    }
  }

  function posts($category = ''){
    
    $where = (strlen($category) > 0 ) ? "AND categoria = '$category' " : "";
    $mysql = new Mysql();
    $sql = <<<SQL
    SELECT * FROM contenidos WHERE tipo = 'POST' $where
SQL;
    
    $res = $mysql->search($sql);
    return $res;
  }

  function page(){
    
    $uri = substr($_SERVER['REQUEST_URI'], 1);
    $uri = str_replace(Config::PATH_ROOT, "", $uri);
    
    $mysql = new Mysql();
    $sql = <<<SQL
    SELECT * FROM contenidos WHERE alias = '$uri' LIMIT 1
SQL;
    $res = $mysql->search($sql);

    while( is_array($res[0]) &&  list($key,$value) = each($res[0]) ){
      $name_var = Config::PREFIX_PAGE.$key;
      if($key == 'contenido'){
        $value = analizadorContenido( urldecode($value) );
      }
      $GLOBALS[$name_var] = $value;
    }
    
  }


  function analizadorContenido($contenido){

    $pattern = '/\[[a-z_]+[a-z0-9_]*((:{1}[a-z0-9_\-\s]+)+(,{1}[a-z0-9_\-\s]+)*)*\]/i';
    preg_match_all($pattern, $contenido, $coincidencias, PREG_OFFSET_CAPTURE);
    foreach($coincidencias[0] as $arr ){
      
      $function = $arr[0];
      $lenght_function = strlen($function);
      $pos_string = strpos($contenido, $function);
      $result_function = ejecutarFuncion($function);
      
      $contenido = substr_replace($contenido, $result_function, $pos_string, $lenght_function ); //Pegar resultado de la funcion en el HTML
    }
    
    return $contenido;
  }


  function ejecutarFuncion($function_string){
    $function =  extraerCadena($function_string, "[", "]");
      
    $arr_ftn = explode(":", $function);
    $function_name = $arr_ftn[0];
    $params = explode(",", $arr_ftn[1]);
    
    $result_function = (function_exists($function_name)) ? call_user_func_array($function_name, $params) : $function_string;
    
    return $result_function;
  }

  function  extraerCadena($str, $findBegin, $findEnd){
    $posbegin = strpos($str, $findBegin) + 1;
    $posend = strpos($str, $findEnd);
    return substr($str, $posbegin, $posend-$posbegin);
  }

  function site_info($var){
    return info(Config::PREFIX, $var);
  }
  function page_info($var){
    return info(Config::PREFIX_PAGE, $var);
  }
  function info($prefix, $var){
    $varsite = $prefix.$var; 
    return $GLOBALS[$varsite];
  }


  info_web();
  page( $_GET['page'] );

?>