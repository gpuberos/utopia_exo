<?php

// Domaine par défaut :
$domain = '/';

// Configuration des pages :
$index_page = $domain;
$movies_page = $domain . 'movies.php';
$movie_page = $domain . 'movie.php';
$contact_page = $domain . 'contact.php';

// Correspond au nom du fichier script, tout ce qui a après le nom de domaine c'est le script name
$current_url = $_SERVER['SCRIPT_NAME'];

// Titres des pages :
$index_name = 'Les films de la semaine';
$movies_name = 'Tous les films à l\'affiche';
$contact_name = 'Contactez-nous';
