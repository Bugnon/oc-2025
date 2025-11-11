var message = 'bienvenue sur ma page web';

console.log(message);

function afficherMessage() {
    console.log('Vous avez cliqué sur le bouton !');
    console.log(message);
}

afficherMessage()

for (var i = 0; i < 5; i++) {
    console.log('Itération numéro : ' + i);
}

// DOM = document object model
/*  document
head            body
            h1          ul
            text        li      li (attribut class)
                        text    text

*/

console.log(document.getElementById('bienvenue').textContent);
document.getElementById('bienvenue').textContent = 'Bienvenue sur ma super page web !';

function ajouter_perso() {
    var nom = 'Jean Dupont';
    var liste = document.getElementById('liste_de_perso');
    var nouvel_element = document.createElement('li');
    nouvel_element.textContent = nom
    liste.appendChild(nouvel_element);
}