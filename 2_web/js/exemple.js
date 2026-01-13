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

console.log('HALLO');


var jean = {
    nom: 'Jean Dupont',
    classe: 'mage',
    niveau: 5,
};

var paul = {
    nom: 'Paul Martin',
    classe: 'guerrier',
    niveau: 3,
    passer_niveau: function() {
        this.niveau += 1;
    }   
};


function creer_personnage(nom, classe, niveau) {
    var perso = {
        nom: nom,
        classe: classe,
        niveau: niveau,
        passer_niveau: function() {
            this.niveau += 1;
        }
    };
    return perso;
}

var louis = creer_personnage('Louis Bernard', 'archer', 4);
var claire = creer_personnage('Claire Dubois', 'soigneur', 2);
var emma = creer_personnage('Emma Leroy', 'mage', 6);

var personnages = [jean, paul, louis, claire, emma];

for (var i = 0; i < personnages.length; i++) {
    var perso = personnages[i];

    var li_perso = document.createElement('li');
    var texte_perso = document.createTextNode(perso.nom);
    li_perso.appendChild(li_perso);
}   




var list_personnages = document.getElementById('liste_de_perso');
list_personnages.appendChild(li_personnages);

function ajouter_perso(nom, classe, niveau) {
    var nouveau_perso = creer_personnage(nom, classe, niveau);
    personnages.push(nouveau_perso);

    var li_nouveau_perso = document.createElement('li');
    var texte_nouveau_perso = document.createTextNode(nom + ' est un ' + classe + ' de niveau ' + niveau);
    li_nouveau_perso.appendChild(texte_nouveau_perso); 
}