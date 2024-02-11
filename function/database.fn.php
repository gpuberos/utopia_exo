<?php

// Fonction qui retourne la connexion à notre base de données
// On lui passe en paramètre $config (tableau qui contient les valeurs de connexion)
function getPDOlink($config)
{
    // 2 - DSN de connexion (Data Server Name) :
    $dsn = 'mysql:dbname=' . $config['dbname'] . ';host=' . $config['dbhost'] . ';port=' . $config['dbport'];

    // 3 - On tente de se connecter à la base de données :
    try {
        // On instancie l'objet PDO :
        $db = new PDO($dsn, $config['dbuser'], $config['dbpass']);

        // On envoi nos requêtes en UTF-8 :
        $db->exec("SET NAMES utf8");

        // On définit le mode fetch par défaut 
        // (si on ne fait pas le FETCH_ASSOC on reçoit les clés en double, donc on a 2 fois les mêmes informations) :
        $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

        // On retourne la valeur $db
        return $db;
    } catch (PDOException $e) {
        // On utilise l'objet PDOException 
        // On utilise une méthode getMessage() (une méthode est une fonction qui appartient à un objet)
        exit('BDD Erreur de connexion : ' . $e->getMessage());
    }
}
