<?php

// Inclut le contenu du fichier header.php (notre connexion bdd et en-tête HTML)
require_once __DIR__ . ('/utilities/header.php');

// Fonctions pour afficher la totalité des films ou un film par id
require_once __DIR__ . ('/function/movies.fn.php');

?>

<div class="py-5">
    <div class="text-center my-2">
        <h1>Détails du film</h1>
    </div>

    <!-- Affiche les informations du film. -->
    <?php require_once __DIR__ . ('/utilities/cardMovie.php'); ?>

</div>

<?php require_once __DIR__ . ('/utilities/footer.php'); ?>

</body>

</html>