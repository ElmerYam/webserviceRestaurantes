<?php
require '../vistas/VistaApi.php';
require '../vistas/VistaXML.php';
require '../datos/ConexionBD.php';

class alimentos
{
    const NOMBRE_TABLA = "alimentos";
    const ID_ALIM = "id_alim";
    const ID_ESTAB = "id_estab";
    const NOMBRE_ALIM = "nombre_alim";
    const DESCRIPCION_ALIM = "descripcion_alim";
    const U_MEDIDA = "u_medida";
    const TIEMPO_PREP = "tiempo_prep";
    const PRECIO_UNIT = "precio_unit";
    const ID_TIPO_COCINA = "id_tipo_cocina";
    const TIEMPO_MENU = "tiempo_menu";
    const FOTO_ALIM = "foto_alim";
    const EXISTENCIA = "existencia";

    const CODIGO_EXITO = 1;
    const ESTADO_EXITO = 1;
    const ESTADO_ERROR = 2;
    const ESTADO_ERROR_BD = 3;
    const ESTADO_ERROR_PARAMETROS = 4;
    const ESTADO_NO_ENCONTRADO = 5;

    public static function get($peticion)
    {        
        $arreglo = self::obtenerPedidos($peticion);                
        return $arreglo;      
    }

    public static function post($cuerpo) //------------------post
    { 
        $arreglo = alimentos::crear($cuerpo);        
        return $arreglo;      
    }

    public static function put($cuerpo)  //------------------put
    {        
        $arreglo = self::actualizar($cuerpo);
        return $arreglo;  
    }

    public static function delete($peticion) //------------------delete
    {

        if (!empty($peticion)) {            
            $resultado = self::eliminar($peticion);
            $respuesta = array(
                "estado" => self::CODIGO_EXITO,
                "mensaje" => "Registro eliminado correctamente"
            );                
            return $respuesta;
            /*} else {
                throw new ExcepcionApi(self::ESTADO_NO_ENCONTRADO,
                    "El contacto al que intentas acceder no existe", 404);
            }*/
        } else {
            throw new ExcepcionApi(self::ESTADO_ERROR_PARAMETROS, "Falta id", 422);
        }

    }

    /**
     * Obtiene la colección de contactos o un solo contacto indicado por el identificador
     * @param int $idUsuario identificador del usuario
     * @param null $idContacto identificador del contacto (Opcional)
     * @return array registros de la tabla contacto
     * @throws Exception
     */
    private function obtenerPedidos($idalimento = NULL)
    {             
        try {         
            if (!$idalimento) {
                $comando = "SELECT * FROM " . self::NOMBRE_TABLA ;
                $sentencia = ConexionBD::obtenerInstancia()->obtenerBD()->prepare($comando);
                $sentencia->execute();
                $datos = $sentencia->fetchAll(PDO::FETCH_ASSOC);
                $contenido = (array)$datos;
                return $contenido;

            } else {                
                $comando = "SELECT * FROM " . self::NOMBRE_TABLA .
                " WHERE " . self::ID_ALIM . "=" . "'" . $idalimento . "'";                
                $sentencia = ConexionBD::obtenerInstancia()->obtenerBD()->prepare($comando);
                $sentencia->execute();
                $datos = $sentencia->fetchAll(PDO::FETCH_ASSOC);
                $contenido = (array)$datos;
                return $contenido;
            }
            
        } catch (PDOException $e) {
            throw new ExcepcionApi(self::ESTADO_ERROR_BD, $e->getMessage());
        }
    }

    /**
     * Añade un nuevo contacto asociado a un usuario
     * @param int $idUsuario identificador del usuario
     * @param mixed $contacto datos del contacto
     * @return string identificador del contacto
     * @throws ExcepcionApi
     */

    private function crear($alimento)
    {        
        if ($alimento) {
            try {
                $pdo = ConexionBD::obtenerInstancia()->obtenerBD();
                $comando = "INSERT INTO " . self::NOMBRE_TABLA . " ( " .
                    self::ID_ALIM . "," .
                    self::ID_ESTAB . "," .
                    self::NOMBRE_ALIM . "," .
                    self::DESCRIPCION_ALIM . "," .
                    self::U_MEDIDA . "," .
                    self::TIEMPO_PREP . "," .
                    self::PRECIO_UNIT . "," .
                    self::ID_TIPO_COCINA . "," .
                    self::TIEMPO_MENU . "," .
                    self::FOTO_ALIM . "," .
                    self::EXISTENCIA .")" .
                    " VALUES(?,?,?,?,?,?,?,?,?,?,?)";

                // Preparar la sentencia
                $sentencia = $pdo->prepare($comando);

                $sentencia->bindParam(1, $alimento['id_alim']);
                $sentencia->bindParam(2, $alimento['id_estab']);
                $sentencia->bindParam(3, $alimento['nombre_alim']);
                $sentencia->bindParam(4, $alimento['descripcion_alim']);
                $sentencia->bindParam(5, $alimento['u_medida']);
                $sentencia->bindParam(6, $alimento['tiempo_prep']);
                $sentencia->bindParam(7, $alimento['precio_unit']);
                $sentencia->bindParam(8, $alimento['id_tipo_cocina']);
                $sentencia->bindParam(9, $alimento['tiempo_menu']);
                $sentencia->bindParam(10, $alimento['foto_alim']);
                $sentencia->bindParam(11, $alimento['existencia']);  

                $sentencia->execute();                
                // Retornar en el último id insertado
                return (array)$pdo->lastInsertId();

            } catch (PDOException $e) {
                throw new ExcepcionApi(self::ESTADO_ERROR_BD, $e->getMessage());
            }
        } else {
            throw new ExcepcionApi(
                self::ESTADO_ERROR_PARAMETROS,
                utf8_encode("Error en existencia o sintaxis de parámetros"));
        }

    }

    /**
     * Actualiza el contacto especificado por idUsuario
     * @param int $idUsuario
     * @param object $contacto objeto con los valores nuevos del contacto
     * @param int $idContacto
     * @return PDOStatement
     * @throws Exception
     */
    private function actualizar($alimento)
    {
        try {
            
            // Creando consulta UPDATE
            $consulta = "UPDATE " . self::NOMBRE_TABLA .
                " SET " .
                //self::ID_ALIM . "=?," .
                self::NOMBRE_ALIM . "=?," .
                self::DESCRIPCION_ALIM. "=?, " .
                self::U_MEDIDA. "=?, " .
                self::TIEMPO_PREP . "=?," .
                self::PRECIO_UNIT . "=?," .
                self::ID_TIPO_COCINA. "=?, " .
                self::TIEMPO_MENU. "=?, " .
                self::FOTO_ALIM . "=?, " .
                self:: EXISTENCIA ."=? " .
                " WHERE " . self::ID_ALIM . "=?";


            // Preparar la sentencia
            $sentencia = ConexionBD::obtenerInstancia()->obtenerBD()->prepare($consulta);

            //$sentencia->bindParam(1, $idCliente);
            $sentencia->bindParam(1, $alimento['nombre_alim']);
            $sentencia->bindParam(2, $alimento['descripcion_alim']);
            $sentencia->bindParam(3, $alimento['u_medida']);
            $sentencia->bindParam(4, $alimento['tiempo_prep']);
            $sentencia->bindParam(5, $alimento['precio_unit']);
            $sentencia->bindParam(6, $alimento['id_tipo_cocina']);
            $sentencia->bindParam(7, $alimento['tiempo_menu']);
            $sentencia->bindParam(8, $alimento['foto_alim']);
            $sentencia->bindParam(9, $alimento['existencia']);
            $sentencia->bindParam(10, $alimento['id_alim']);
            
            $sentencia->execute();        

            return (array)$sentencia->rowCount();

        } catch (PDOException $e) {
            throw new ExcepcionApi(self::ESTADO_ERROR_BD, $e->getMessage());
        }
    }


    /**
     * Elimina un contacto asociado a un usuario
     * @param int $idUsuario identificador del usuario
     * @param int $idContacto identificador del contacto
     * @return bool true si la eliminación se pudo realizar, en caso contrario false
     * @throws Exception excepcion por errores en la base de datos
     */
    private function eliminar($idalimento)
    {                
        try {            
            $comando = "DELETE FROM " . self::NOMBRE_TABLA .
                " WHERE " . self::ID_ALIM . "=" . "'". $idalimento . "'";        
            $sentencia = ConexionBD::obtenerInstancia()->obtenerBD()->prepare($comando);            
            $sentencia->execute();
            return (array)$sentencia->rowCount();

        } catch (PDOException $e) {
            throw new ExcepcionApi(self::ESTADO_ERROR_BD, $e->getMessage());
        }
    }
}
