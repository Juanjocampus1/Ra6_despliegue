<?php
/**
 * Archivo principal de la aplicación
 *
 * Muestra información de un usuario utilizando clases y funciones auxiliares.
 *
 * @author Juan José Acebedo Lara (jjal)
 * @version 1.0
 */

require_once 'src/Usuario.php';
require_once 'src/utilidades.php';

$usuario = new Usuario("Ana", "García", 23);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proyecto PHP - JJAL</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            padding: 40px;
            max-width: 500px;
            width: 100%;
            animation: fadeIn 0.5s ease-in;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        h1 {
            color: #667eea;
            margin-bottom: 30px;
            text-align: center;
            font-size: 2em;
            font-weight: 600;
        }
        
        .user-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            color: white;
        }
        
        .user-info {
            margin-bottom: 15px;
            font-size: 1.1em;
        }
        
        .user-info:last-child {
            margin-bottom: 0;
        }
        
        .label {
            font-weight: 600;
            opacity: 0.9;
            display: inline-block;
            min-width: 150px;
        }
        
        .value {
            font-weight: 400;
        }
        
        .welcome-message {
            background: #f7f7f7;
            border-left: 4px solid #667eea;
            padding: 20px;
            border-radius: 8px;
            color: #333;
            font-size: 1.05em;
            line-height: 1.6;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            color: #999;
            font-size: 0.9em;
        }
        
        .icon {
            display: inline-block;
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>👤 Información del Usuario</h1>
        
        <div class="user-card">
            <div class="user-info">
                <span class="icon">📝</span>
                <span class="label">Nombre completo:</span>
                <span class="value"><?php echo $usuario->getNombreCompleto(); ?></span>
            </div>
            <div class="user-info">
                <span class="icon">🎂</span>
                <span class="label">Edad:</span>
                <span class="value"><?php echo $usuario->getEdad(); ?> años</span>
            </div>
        </div>
        
        <div class="welcome-message">
            <strong>✨ <?php echo saludo(); ?></strong>
        </div>
        
        <div class="footer">
            <p>Proyecto PHP - RA6 Despliegue | JJAL © 2026</p>
        </div>
    </div>
</body>
</html>