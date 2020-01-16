<?php
  
    function conexao(){
    	 try{
          $con =  new PDO("mysql:host=localhost;dbname=chat","root","");

    	 }catch(PDOException $ex){
    	 	 echo $ex->getMessage();

    	 }
    	 return $con;
    }



 ?>