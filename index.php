<?php

// Inclut le contenu du fichier header.php (notre connexion bdd et en-tête HTML) :
require_once __DIR__ . ('/utilities/header.php');

// Fonctions pour afficher la totalité des films ou un film par id
require_once __DIR__ . ('/function/movies.fn.php');

?>

<div class="py-5">
    <div class="text-center mb-5">
        <h1>Les films Utopia</h1>
    </div>

    <!-- Affiche les 3 meilleurs films. -->
    <?php require_once __DIR__ . ('/utilities/cardBestmovie.php'); ?>

</div>

<?php require_once __DIR__ . ('/utilities/footer.php'); ?>

</body>

</html>