<?php
require 'nusoap.php';
require 'alimentos.php';
//require 'tiposRestaurantes.php';



$server = new nusoap_server(); // Create a instance for nusoap server

$server->configureWSDL("WS Restaurantes","urn:soapdemo"); // Configure WSDL file

$server->register(
	"tiposrestaurantes.get_price", 
	array("name"=>"xsd:string"),  
	array("return"=>"xsd:integer")
);

$server->register(
	"tiposrestaurantes.get", // name of function
	array("id_tipo_pedido"=>"xsd:integer"),  // inputs
	array("return"=>"xsd:Array")   // outputs
);

$server->register(
	"alimentos.get", // name of function
	array("id_alim"=>"xsd:string"),  // inputs
	array("return"=>"xsd:Array")   // outputs
);

$server->register(
	"alimentos.post", // name of function
	array("cuerpo"=>"xsd:Array"),  // inputs
	array("return"=>"xsd:Array")   // outputs
);

$server->register(
	"alimentos.put", // name of function
	array("cuerpo"=>"xsd:Array"),  // inputs
	array("return"=>"xsd:Array")   // outputs
);

$server->register(
	"alimentos.delete", // name of function
	array("id_alim"=>"xsd:string"),  // inputs
	array("return"=>"xsd:Array")   // outputs
);

$server->service(file_get_contents("php://input"));

/*
consumir:
require 'nusoap.php';

$client = new nusoap_client("http://localhost/soapWS/controladores/server.php?wsdl");

$response = $client->call('alimentos.delete',array('id_alim'=>$name));
*/