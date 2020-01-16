<?php
     include_once  'conexao/conexao.php';
     function ChatAll(){
       
       if(conexao() != null):
             $queries =  conexao()->prepare('Select * from Chatbox');
             $queries->execute();

             while($linha =$queries->fetch()):
                  $chats[] =$linha;  
             endwhile;

             return  $chats;
       endif; 
     }

     
    echo json_encode(ChatAll());

?>