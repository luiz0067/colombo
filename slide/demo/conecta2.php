<?php
	$host2		=	"mysql17.redehost.com.br";
	$login2		=	"oficialestandes";
	$password2	=	"&TR*r62o";
	$base_dados2	=	"oficialestandes";

if (!$link2 = mysql_connect($host2, $login2, $password2)) {
    echo 'Não foi possível conectar ao mysql';
    exit;
}

if (!mysql_select_db($base_dados2, $link2)) {
    echo 'Não foi possível selecionar o banco de dados';
    exit;
}


?>