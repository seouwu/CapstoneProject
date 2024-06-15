// var Dimg=[
//     url('./img/Dormitory.png'),
//     url('./img/D1.png'),
//     url('./img/D2.png'),
//     url('./img/D3.png'),
//     url('./img/D4.png'),
//     url('./img/D5.png'),
//     url('./img/D6.png'),
//     url('./img/D7.png')
// ];
// // 이미지 배경
// var BackImg=document.getElementById("dormitoryPhoto");

// // 슬라이더 컨트롤
// var RightBtn=document.getElementById("right");
// var LeftBtn=document.getElementById("left");
// // 
// var currentIndex=0;
// RightBtn.addEventListener("click",function(){
//     // currentIndex++;
//     BackImg.style.backgroundImage=Dimg[1];
// })
// LeftBtn.addEventListener("click",function(){
//     currentIndex--;
//     BackImg.style.backgroundImage=Dimg[currentIndex];
// })
var Dimg = [
    'url("./img/Dormitory.png")',
    'url("./img/D1.png")',
    'url("./img/D2.png")',
    'url("./img/D3.png")',
    'url("./img/D4.png")',
    'url("./img/D5.png")',
    'url("./img/D6.png")',
    'url("./img/D7.png")'
];

// 이미지 배경
var BackImg = document.getElementById("dormitoryPhoto");

// 슬라이더 컨트롤
var RightBtn = document.getElementById("right");
var LeftBtn = document.getElementById("left");

var currentIndex = 0;

function updateBackgroundImage() {
    BackImg.style.backgroundImage = Dimg[currentIndex];
}

function nextImage() {
    currentIndex++;
    if (currentIndex >= Dimg.length) {
        currentIndex = 0; // Go back to the first image
    }
    updateBackgroundImage();
}

function prevImage() {
    currentIndex--;
    if (currentIndex < 0) {
        currentIndex = Dimg.length - 1; // Go to the last image
    }
    updateBackgroundImage();
}

RightBtn.addEventListener("click", nextImage);
LeftBtn.addEventListener("click", prevImage);

// Initialize the first background image
updateBackgroundImage();

