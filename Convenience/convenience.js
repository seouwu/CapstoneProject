var cafe = document.getElementById("Cafe");
var Cimg = [
    'url("./img/cafe1.jpg")',
    'url("./img/cafe2.jpg")',
    'url("./img/cafe3.jpg")',
    'url("./img/cafe4.jpg")'
];
var cafeIndex = 0;
function updateBackgroundImageCafe() {
    cafe.style.backgroundImage = Cimg[cafeIndex];
}
document.getElementById("Cright").addEventListener("click", function() {
    cafeIndex++;
    if (cafeIndex >= Cimg.length) {
        cafeIndex = 0;
    }
    updateBackgroundImageCafe();
});
document.getElementById("Cleft").addEventListener("click", function() {
    cafeIndex--;
    if (cafeIndex < 0) {
        cafeIndex = Cimg.length - 1;
    }
    updateBackgroundImageCafe();
});

var store = document.getElementById("Con");
var Simg = [
    'url("./img/store1.jpg")',
    'url("./img/store2.jpg")',
    'url("./img/store3.jpg")',
    'url("./img/store4.jpg")'
];
var storeIndex = 0;
function updateBackgroundImageStore() {
    store.style.backgroundImage = Simg[storeIndex];
}
document.getElementById("Sright").addEventListener("click", function() {
    storeIndex++;
    if (storeIndex >= Simg.length) {
        storeIndex = 0;
    }
    updateBackgroundImageStore();
});
document.getElementById("Sleft").addEventListener("click", function() {
    storeIndex--;
    if (storeIndex < 0) {
        storeIndex = Simg.length - 1;
    }
    updateBackgroundImageStore();
});

var parking = document.getElementById("Park");
var Pimg = [
    'url("./img/parking1.jpg")',
    'url("./img/parking2.jpg")',
    'url("./img/parking3.jpg")',
    'url("./img/parking4.jpg")'
];
var parkingIndex = 0;
function updateBackgroundImageParking() {
    parking.style.backgroundImage = Pimg[parkingIndex];
}
document.getElementById("Pright").addEventListener("click", function() {
    parkingIndex++;
    if (parkingIndex >= Pimg.length) {
        parkingIndex = 0;
    }
    updateBackgroundImageParking();
});
document.getElementById("Pleft").addEventListener("click", function() {
    parkingIndex--;
    if (parkingIndex < 0) {
        parkingIndex = Pimg.length - 1;
    }
    updateBackgroundImageParking();
});
