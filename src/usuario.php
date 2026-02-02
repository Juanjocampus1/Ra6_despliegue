<?php
/**
 * Clase Usuario
 *
 * Representa a un usuario de la aplicación.
 *
 * @package App
 * @author Juan José Acebedo López (jjal)
 * @version 1.0
 */
class Usuario
{
    /**
     * Nombre del usuario
     * @var string
     */
    private string $nombre;

    /**
     * Apellidos del usuario
     * @var string
     */
    private string $apellidos;

    /**
     * Edad del usuario
     * @var int
     */
    private int $edad;

    /**
     * Constructor de la clase Usuario
     *
     * @param string $nombre
     * @param string $apellidos
     * @param int $edad
     */
    public function __construct(string $nombre, string $apellidos, int $edad)
    {
        $this->nombre = $nombre;
        $this->apellidos = $apellidos;
        $this->edad = $edad;
    }

    /**
     * Devuelve el nombre completo del usuario
     *
     * @return string
     */
    public function getNombreCompleto(): string
    {
        return $this->nombre . " " . $this->apellidos;
    }

    /**
     * Devuelve la edad del usuario
     *
     * @return int
     */
    public function getEdad(): int
    {
        return $this->edad;
    }
}
