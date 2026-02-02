<?php
/**
 * Archivo principal de la aplicación
 *
 * Muestra información de un usuario utilizando clases y funciones auxiliares.
 *
 * @author Juan José Acebedo López (jjal)
 * @version 1.0
 */

require_once 'src/Usuario.php';
require_once 'src/utilidades.php';

$usuario = new Usuario("Ana", "García", 23);

echo "<h1>Aplicación PHP de ejemplo</h1>";
echo "<p>" . $usuario->getNombreCompleto() . "</p>";
echo "<p>Edad: " . $usuario->getEdad() . "</p>";
echo "<p>Mensaje: " . saludo() . "</p>";
