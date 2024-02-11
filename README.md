## Concepts de base de PDO, FETCH et FETCH ALL

Ce qu'il faut retenir pour la connexion à la BDD :
1. On défini nos variables d'environnement
2. DSN de connexion (Data Server Name)
3. On tente de se connecter à la base de données

### DSN

**DSN (Data Source Name)** :  c'est une chaine de caractère qui contient les informations nécessaires pour se connecter à une base de données.

```php
$dsn = 'mysql:dbname=' . $config['dbname'] . ';host=' . $config['dbhost'] . ';port=' . $config['dbport'];
```

### PDO

PDO ou PHP Data Objects est une interface qui permet d'interagir avec la base de données à partir de PHP (elle permet de manipuler efficacement les données de manière sécurisé).

`new PDO` est utilisé pour créer une nouvelle instance de la classe PDO, dans notre cas une connexion à la base de donnée en passant les paramètres DSN username et password.

```php
// On instancie l'objet PDO :
$db = new PDO($dsn, $config['dbuser'], $config['dbpass']);

```

### $db->exec()

```php
// On envoi nos requêtes en UTF-8 :
$db->exec("SET NAMES utf8");
```

`$db->exec` est utilisé pour exécuter une instruction SQL sur la base de données `$db` est une instance de la classe PDO, et `exec` est une méthode de cette classe. L’opérateur -> est utilisé pour accéder aux méthodes et propriétés d’un objet en PHP. Donc, `$db->exec("SET NAMES utf8");` exécute l’instruction `SET NAMES utf8` sur la base de données.

#### SET NAMES utf8 : 
Cette instruction est utilisée pour définir le jeu de caractères utilisé pour envoyer des données depuis et vers le serveur de base de données `SET NAMES utf8` indique que le client (dans ce cas, votre script PHP) enverra des données au serveur en utilisant le jeu de caractères UTF-8, et que le serveur doit renvoyer les données en utilisant également l’UTF-8.

**Sources :**
- https://stackoverflow.com/questions/2159434/set-names-utf8-in-mysql
- https://stackoverflow.com/questions/16488970/simple-php-explanation-whats-the-difference-between-the-arrow-operators

### FETCH

**FETCH** et **FETCH ALL** sont 2 méthodes utilisées pour récupérer les données de la base de données. 

```php
// On définit le mode fetch par défaut 
// (si on ne fait pas le FETCH_ASSOC on reçoit les clés en double, donc on a 2 fois les mêmes informations) :
$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
```

**Par défaut la constante PDO Fetch est BOTH** :  
  
Imaginez une boîte pleine d’objets, chaque objet a 2 étiquettes : 
une avec un nom (comme "pomme") et une avec un numéro (comme "1"). Lorsque on cherche un objet, on peut le faire soit par son nom, soit par son numéro. C’est ce que fait `PDO::FETCH_BOTH` : il retourne un tableau où chaque valeur peut être accédée à la fois par le nom de la colonne et par l’indice numérique de la colonne.

Dans ce cas le tableau est beaucoup **plus difficile à lire** et à comprendre car chaque valeur est dupliquée. En plus ça utilise beaucoup **plus de mémoire** car chaque **valeurs est stockée 2 fois**.

Pour **FETCH ASSOC** :  
  
Imaginez que vous avez une boîte pleine d’objets différents. Chaque objet a une étiquette unique qui indique ce qu’il est. 
Par exemple, un objet avec une étiquette "pomme" et un autre avec une étiquette "banane".

Maintenant, disons qu'on veut trouver la "pomme" dans la boîte. Au lieu de chercher à tâtons, on va simplement lire les étiquettes jusqu’à ce qu'on trouves celle qui est nommé "pomme". C’est **beaucoup plus rapide** à faire qu'avec FETCH BOTH


## Fonction GROUP_CONCAT (Concaténation)
  
Pour chaque film, on concatène tous les noms de langues associés.  
  
`GROUP_CONTACT` est une fonction d'aggrégation permet de regrouper plusieurs resultats pour language sont bien associé au résultat de film, ça va les regrouper.  
  
```sql
-- Pour chaque film, on concatène tous les noms de langues associés en utilisant la fonction GROUP_CONCAT
-- les name(nom des langues) de la table language
-- SEPARATOR sert uniquement à modifier le séparateur dans notre cas on met une virgule suivi d'un espace
GROUP_CONCAT(l.name SEPARATOR ', ') AS languages

-- On joint la table movie_language (alias ml) à notre table movies.
-- On garde que les lignes où l’id du film dans la table movies correspond à l’id du film dans la table movie_language
INNER JOIN movie_language AS ml ON m.id = ml.movieID

-- On joint la table language (alias l) à notre table jointe précédente. 
-- On garde que les lignes où l’id de la langue dans la table movie_language correspond à l’id de la langue dans la table language
JOIN language AS l ON ml.languageID = l.id
```
  
**Source :**  
- https://sql.sh/fonctions/group_concat
  
### Opération de jointure
  
**Explication simplifié d'une jointure :**  
  
- **INNER JOIN** : Imaginez deux sacs de billes, un sac représente une table et chaque bille dans le sac est une ligne de cette table. Maintenant, disons que vous voulez trouver toutes les billes qui sont à la fois dans le premier sac et dans le deuxième sac. C’est ce que fait `INNER JOIN` - il ne garde que les billes (lignes) qui apparaissent dans les deux sacs (tables).
- **ON** : Maintenant, comment déterminez-vous si une bille est dans les deux sacs ? Vous avez besoin d’une règle pour cela. Par exemple, la règle pourrait être que la couleur de la bille doit être la même. Dans SQL, cette règle est spécifiée après le mot-clé `ON`. Donc, `ON` est utilisé pour définir la condition qui détermine quelles lignes sont conservées après la jointure.
  
#### Dans notre exemple film Utopia
  
1. **FROM movies AS m** : on indique que la table movies est la table principale pour cette requête. AS m signifie que nous allons référer à la table movies en utilisant l’alias m pour le reste de la requête.
2. **INNER JOIN movie_language AS ml ON m.id = ml.movieID** : on effectue une jointure interne entre la table movies et la table movie_language. La jointure interne renvoie les lignes lorsque la condition de jointure est vraie. Ici, la condition de jointure est que l’id de la table movies doit être égal au movieID de la table movie_language. AS ml signifie que nous allons référer à la table movie_language en utilisant l’alias ml.
3. **JOIN language AS l ON ml.languageID = l.id** : on effectue une autre jointure (par défaut, c’est une jointure interne) entre le résultat de la jointure précédente et la table language. La condition de jointure est que le languageID de la table movie_language doit être égal à l’id de la table language. AS l signifie que nous allons référer à la table language en utilisant l’alias l.
  
**Résumé :**  
  
Depuis `movies` 
On fait un `INNER JOIN` sur la table intermédiaire `movie_language` qu'on relie à la table `movies` en utilisant leur `id`, donc `movies`.`id` (PRIMARY KEY)  = `movie_language`.`movieID` (FOREIGN KEY). 
On fait un `JOIN` pour relier la table `language` à la table intermédiaire `movie_language` en utilisant leur `id`, donc `movie_language`.`languageID` (FOREIGN KEY) = `language`.`id` (PRIMARY KEY).
  
**On suit ce cheminement :**  
  
Depuis la table `movies`, champ `movies.id` => on va à la table intermédiaire `movies_languages`, du champ `movies_languages.movieID` on va au champ `movies_languages.languageID` => puis on va à la table `language` dans le champ `language.id`.

### Arborescence répertoire
  
- bdd : on stocke export sql
- config : on stocke les fichiers configurations ex: info de connexion 
- function : on stocke toutes les fonctions php
- utilities : on stocke tous les composants (header.php, footer.php)

### Fonction

Une fonction s'écrit comme ça : (paramètre entre parenthèse).
```php
function mafonction($parametres) {
    // Mon code
}
```

**Bonne pratique :**  

Ajouter .fn pour dire que c'est un fichier fonction
database.fn.php

On prefere array tableau pour stocker la config. 

Une fonction doit retourner quelque chose
On retourne $db

### Constantes magiques

On utilise les constantes magiques pour éviter les problématiques sur les chemins relatif sur d'autres serveurs. 

On va se servir des `__DIR__` et dirname pour se déplacer dans les répertoires (chemin relatif).

`dirname(__DIR__)` permet de revenir en arrière
Il va rechercher le chemin
On met le dirname uniquement quand le fichier est dans un répertoire à la racine du site on mettra uniquement `__DIR__`

Pour échapper un caractère il met 2 `\\`. 

**Source :**  
- https://www.php.net/manual/fr/language.constants.magic.php

  
**Variables Globales sont globalement déjà incluse dans PHP :**

```php
$_SERVER['DOCUMENT_ROOT'];
```
  
`'DOCUMENT_ROOT'` :  
La racine sous laquelle le script courant est exécuté, comme défini dans la configuration du serveur.

`PATH_INFO` :  
Contient les informations sur le nom du chemin fourni par le client concernant le nom du fichier exécutant le script courant, sans la chaîne relative à la requête si elle existe. Actuellement, si le script courant est exécuté via l'URI http://www.example.com/php/path_info.php/some/stuff?foo=bar, alors la variable `$_SERVER['PATH_INFO']` contiendra `/some/stuff`.

`ORIG_PATH_INFO` :  
Version originale de 'PATH_INFO' avant d'être analysée par PHP.

- https://www.php.net/manual/fr/reserved.variables.server.php
- https://stackoverflow.com/questions/14823495/wamp-showing-absolute-path-when-echoing-dirname-file


## require et require_once

**require** et **require_once** sont deux fonctions en PHP qui sont utilisées pour inclure un fichier dans un autre.
 
- `require` : Cette fonction est utilisée pour inclure un fichier PHP dans un autre, indépendamment du fait que le fichier ait déjà été inclus ou non. Si le fichier spécifié n’est pas trouvé, require génère une **erreur fatale et le script s’arrête**.
- `require_once` : Cette fonction est identique à require, mais elle vérifie d’abord si le fichier a déjà été inclus et, si c’est le cas, elle ne l’inclut pas à nouveau. Cela signifie que require_once n’inclura le fichier qu’une seule fois, même s’il est inclus plusieurs fois dans le même script.

Utilisez `require` lorsque vous voulez **inclure un fichier plusieurs fois**, et `require_once` lorsque vous voulez vous assurer qu’un **fichier est inclus une seule fois** dans votre script.

**Source :**  
- https://www.geeksforgeeks.org/difference-between-require-and-require_once-in-php/

## Différence entre include et require

On utilise `include` lorsqu'on souhaite que l’exécution du code continue même si le fichier inclus est manquant, et on utilise `require` lorsqu'on souhaite que le script s’arrête si le fichier inclus est manquant.

## HEADER

Faire une redirection vers l'accueil

```php
// Si je n'ai pas d'id dans l'URL OU que $movie['id'] = NULL (vide)
if (!isset($_GET['id']) || empty($movie['id'])) {
    // On fait une redirection
    // https://www.php.net/manual/fr/function.header
    header("location : /");
} else {
    // Stocke moi le nom du film
    $title = $movie['title'];
}
```
**Explication** :  
  
- `if (!isset($_GET['id']) || empty($movie['id']))`: 
  **Cette ligne vérifie deux conditions :**
  - `!isset($_GET['id'])` : Vérifie si l’identifiant du film (id) n’est pas défini dans l’URL. `$_GET['id']` récupère la valeur de **id** dans l’URL (ex: dans www.example.com/?id=1234, `$_GET['id']` serait 1234).
  - `empty($movie['id'])` : Vérifie si l’identifiant du film (id) dans le tableau `$movie` est vide.
    - `header("location : /")`: Si l’une des conditions ci-dessus est vraie (c’est-à-dire, si l’identifiant du film n’est pas défini ou est vide), alors cette ligne redirige l’utilisateur vers la page d’accueil (/).
    - `else`: Si aucune des conditions ci-dessus n’est vraie (c’est-à-dire, si l’identifiant du film est défini et n’est pas vide), alors le code dans ce bloc else est exécuté.
    - `$title = 'Détails du film : ' . $movie['title']`: Cette ligne stocke le titre du film dans la variable `$title`. `$movie['title']` récupère le titre du film à partir du tableau $movie.

**En résumé :**  

**SI** l'id n'existe pas (isset) **OU** s'il est vide (empty) **ALORS** tu me rediriges vers la page d'accueil **SINON** tu m'affiches le titre du film.
  
**Source :** 
- https://www.php.net/manual/fr/function.header
- https://www.php.net/manual/fr/function.isset
- https://www.php.net/manual/fr/function.empty
  
  
## Ajout affiche film dans BDD

```sql
CREATE TABLE `dbmovie_utopia`.`picture` (
`id` INT NOT NULL AUTO_INCREMENT , 
`pathImg` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL , 
`movieId` INT NOT NULL , PRIMARY KEY (`id`)
) ENGINE = InnoDB;
```
  
Depuis PHPMyAdmin mettre Index sur le movieId de la table picture sinon on ne pourra pas faire la relation ONE to MANY entre l'id PRIMARY de table movies vers la FOREIGN KEY movieId de la table picture.

  
## Information annexe :
  
**Note à compléter**
  
Mettre le menu à droite dans bootstrap en ajoutant ceci à l'ul de la navbar.
```html
<ul class="col-12 justify-content-end">
```

**Explication** des niveaux dans les Briefs :
- Niveau 1 : immiter
- Niveau 2 : adapter
- Niveau 3 : transposer

  
## Mise en place des notes sous forme d'étoile :

### Réflexion de base :

Affichage de la note :

Convertir la note avec une 1 5 étoiles, la note est en virgule est l'arrondir
10 / 5  : 2

https://www.php.net/manual/fr/function.round.php

Afficher le nombre de div qui correspond à la note

https://www.php.net/manual/fr/function.explode.php

star (etoile vide), star-fill (etoile pleine), star-half (etoile à moitié)

```php
$starRating = round($movieRating/2);
for ($i=0; $i < $starRating ; $i++) { 
    echo '<div class="bi-star-fill"></div>';
}

// $starRating = round($movie['rating']/2);
```

### Version améliorée :

Cette fonction convertit une note sur une échelle de 1 à 10 en une représentation visuelle d’étoiles sur une échelle de 1 à 5. Chaque point entier de la note est représenté par une étoile pleine, une demi-étoile est affichée si la note contient une demi-étoile, et une étoile vide est affichée si la note est inférieure à 5. Cela permet d’avoir une représentation visuelle claire et concise de la note.

explode — Scinde une chaîne de caractères en segments

```php
// Définition de la fonction getStar qui prend une note en paramètre
function getStar($rating)
{
    // La note est divisée par 2 et arrondie à un chiffre après la virgule
    // Cela permet de convertir une note sur 10 à une note sur 5 avec des demi-étoiles
    $starRating = round($rating / 2, 1);
```
Cette ligne prend la note d’origine (qui est sur une échelle de 1 à 10) et la convertit en une échelle de 1 à 5. C’est fait en divisant la note par 2. Le résultat est arrondi à un chiffre après la virgule pour permettre des demi-étoiles.

```php
    // La note est séparée en deux parties : la partie entière et la partie décimale
    $ratingInt = explode(".", $starRating);
```
Cette ligne sépare la note en deux parties : la partie entière et la partie décimale. Par exemple, si la note est 4.5, alors `$ratingInt[0]` sera 4 et `$ratingInt[1]` sera 5.

```php
    // Pour chaque point entier de la note, une étoile pleine est affichée
    for ($i = 0; $i < $ratingInt[0]; $i++) {
        echo '<div class="bi-star-fill"></div>';
    }
```
Cette boucle affiche une étoile pleine pour chaque point entier de la note. Par exemple, si la note est 4.5, alors 4 étoiles pleines seront affichées.

```php
    // Si la note contient une demi-étoile, elle est affichée
    if ($ratingInt[1] != 0) {
        echo '<div class="bi-star-half"></div>';
    }
```
Cette condition vérifie si la note contient une demi-étoile. Si c’est le cas, une demi-étoile est affichée.

```php
    // Si la note est inférieure à 5, une étoile vide est affichée
    if (5 - $starRating >= 1) {
        echo '<div class="bi-star"></div>';
    }
}
```
Cette condition vérifie si la note est inférieure à 5. Si c’est le cas, une étoile vide est affichée pour compléter les 5 étoiles.


# @TODO LIST

A rechercher et documenter

## DISTINCT

## LIMIT & OFFSET

Pour créer une pagination.

Source :
- https://www.guru99.com/fr/limit.html
