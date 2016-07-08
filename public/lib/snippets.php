<?php
	
	function mis_peliculas(){
		$posts = posts();

	    while(is_array($posts) && list($k, $v) = each($posts) ){
	      $titulo = $v['titulo'];
	      $id = $v['id'];
	      $alias = $v['alias'];
	      $contenido = $v['contenido'];

	      $li .= <<<HTML
	        <li>
	          <a href="$alias">$titulo</a>
	        </li>
HTML;
   		}
    
    	return "<ul>$li</ul>";
	}

	function suma($nro1, $nro2){
	  return $nro1 + $nro2;
	}
?>