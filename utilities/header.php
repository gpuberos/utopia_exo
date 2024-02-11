<?php

// session_start(): démarre une session
// session_id(): retourne l'id de la session
// session_register($mavariable): enregistre une variable dans la session
// session_unregister($mavariable): efface une variable dans la session
// session_name(): retourne le nom de la session
// unset($_SESSION): vide la session de toute ses variables
// session_destroy(): detruit la session en cours

// Etape de connexion à une base de données
require_once dirname(__DIR__) . ('/config/config.php');

// Fonction qui retourne la connexion à notre base de données
require_once dirname(__DIR__) . ('/function/database.fn.php');

// On se connecte à la base de données
$db = getPDOlink($config);

// Réglages fuseau horaire Fr
date_default_timezone_set('EUROPE/Paris');
setlocale(LC_TIME, 'fr_FR.UTF8', 'fra');

// Session start si la session n'existe pas
if (empty(session_id())) {
    session_start();
}

require_once dirname(__DIR__) . ('/config/headerConfig.php');
require_once dirname(__DIR__) . ('/function/header.fn.php');

?>

<!DOCTYPE html>
<html lang="fr-FR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/icons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/icons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/icons/favicon-16x16.png">
    <!-- <link rel="manifest" href="/assets/icons/site.webmanifest"> -->

    <!-- Bootstrap Librairies -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- CSS Custom -->
    <!-- <link rel="stylesheet" href="/assets/css/styles.css"> -->

    <title>Utopia</title>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid px-4 px-lg-5">
            <a class="navbar-brand align-item-center" href="<?= $index_page; ?>"> <img src="/assets/img/utopia-logo.webp" alt="Logo" width="67" height="24" class="d-inline-block">Cinéma Utopia</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4 col-12 justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link 
                        <?= isActive($index_page, $current_url); ?>
                        <?= isActive('/index.php', $current_url); ?>" aria-current="page" href="<?= $index_page; ?>">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <?= isActive($movies_page, $current_url); ?>" href="<?= $movies_page; ?>">Les films</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Contact</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">Tous les cinémas</a></li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>
                            <li><a class="dropdown-item" href="#!">Formulaire de contact</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header class="bg-black overflow-hidden" style="height: 500px;">
        <div class="container-fluid position-relative h-100">
            <img class="position-absolute top-50 start-50 translate-middle h-100" src="/assets/img/cinema-ban.jpg" alt="Image de background">
            <div class="position-absolute top-50 start-50 translate-middle align-items-center px-5 py-3 bg-dark bg-opacity-50 text-center text-white rounded-3">
                <h1 class="display-4 fw-bolder"><?= isset($title) ? $title : 'Mon titre par défaut'; ?></h1>
                <p class="lead mb-0 fw-normal text-white-75">Un film de <strong>...</strong></p>
            </div>
        </div>
    </header>