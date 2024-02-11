<?php

// Fonction qui retourne la class active dans liens actifs de la navbar
function isActive($page, $url)
{
    // La fonction strpos() cherche la présence de la chaîne $url dans la chaîne $page.
    // Si $url est trouvé dans $page, strpos() retourne la position du début de la première occurrence de $url.
    // Sinon, elle retourne FALSE.
    if (strpos($page, $url) !== FALSE) {
        // Si $url est trouvé dans $page, la fonction retourne 'active'.
        // Cela signifie que la classe 'active' est ajoutée à l'élément de navigation correspondant.
        return 'active';
    }
}

// strpos() est une fonction PHP qui trouve la position de la première occurrence d’une sous-chaîne dans une chaîne. 
// Si la sous-chaîne n’est pas trouvée, strpos() retourne FALSE
// Donc, Si l'URL actuelle contient soit $index_page soit $index_page . 'index.php'
if (strpos($index_page, $current_url) !== FALSE || strpos($index_page . 'index.php', $current_url) !== FALSE) :
    $title = $index_name;

// Sinon, si l'URL actuelle contient $movies_page
elseif (strpos($movies_page, $current_url) !== FALSE) :
    $title = $movies_name;

// Sinon, si l'URL actuelle contient $contact_page
elseif (strpos($contact_page, $current_url) !== FALSE) :
    $title = $contact_name;

endif;