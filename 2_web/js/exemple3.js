console.log("Exemple Canvas JS chargé");

const canvas2 = document.getElementById("canvas2");
console.log("canvas2", canvas2);

const ctx = canv.getContext("2d");


// Dessiner un rectangle rouge
ctx.fillStyle = "red";
ctx.fillRect(50, 50, 100, 100);

// Dessiner un cercle bleu
ctx.beginPath();
ctx.arc(200, 150, 50, 0, 2 * Math.PI);
ctx.fillStyle = "blue";
ctx.fill();

// Dessiner une ligne verte
ctx.beginPath();
ctx.moveTo(300, 50);