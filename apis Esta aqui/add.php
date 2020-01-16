<?php

include_once 'conexao/conexao.php';


if(conexao() != null):
  // pegando a conexao do banco de dados;
   $autor =$_POST['autor'];
   $message =$_POST['message'];
   $data = $_POST['data'];

   $add = conexao()->prepare('Insert into Chatbox(message,autor,data) 
   VALUES(:message, :autor , :data)');

   $add->execute(array(
        ':message'=>$message , 
        ':autor'=>$autor,
        ':data'=>$data
   ));
  // fim do codigo
endif;
?>