<?php

// Vérifie si limitOption a été envoyé dans la requête POST
if (isset($_POST['limitOption'])) {
    // Si oui assigne la valeur de limitOption à $limit
    $limit = $_POST['limitOption'];
} else {
    $limit = 3;
}

// $limit = isset($_POST['limit']) ? $_POST['limit'] : 3;

$movies = findBestMovies($db, $limit);
?>

<div class="container">
    <div class="card h-100">
        <div class="card-header bg-black text-white">
            <div class="row align-items-center py-2">
                <div class="col-auto">
                    <h2 class="card-title mb-0"><i class="bi bi-trophy"></i> Nos <?= $limit ?> meilleurs films</h2>
                </div>

                <div class="col-auto ms-auto">
                    <form action="" method="post" class="row g-3">
                        <div class="col-auto">
                            <label for="limitOption" class="visually-hidden">Sélectionner le nombre de films</label>
                            <select class="form-select" id="limitOption" name="limitOption" aria-label="Default select example">
                                <option selected>Nombres de films</option>
                                <option value="3">Les 3 meilleurs films</option>
                                <option value="5">Les 5 meilleurs films</option>
                                <option value="10">Les 10 meilleurs films</option>
                            </select>
                        </div>
                        <div class="col-auto">
                            <input type="submit" value="Valider" class="btn btn-primary ms-2">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="card-body">
            <!-- Boucle qui parcourt chaque élément du tableau $movies et affiche un lien vers la page de détails pour chaque film. -->
            <ul class="list-group list-group-flush">
                <?php foreach ($movies as $movie) : ?>
                    <li class="list-group-item">
                        <a href="<?= $movie_page; ?>?id=<?= $movie['id']; ?>"><?= $movie['title']; ?></a>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</div>