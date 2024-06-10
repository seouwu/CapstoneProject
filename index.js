// 메뉴바
// document.getElementById("menubar").addEventListener("click",function() {
//     document.getElementById("nav").style.visibility="visible"; 
//     document.getElementsByClassName("nav__list").style.visibility="visible";  
// })
// document.getElementById("exit").addEventListener("click",function() {
//         document.getElementById("nav").style.visibility="hidden";    
  
// })

// 이미지 객체들
var images=[
    {
        name:"img1",
        url:"url(https://jeiu.ac.kr/img/main/main_slide_01.png)"
    },
    {
        name:"img2",
        url:"url(https://jeiu.ac.kr/img/main/main_slide_02.png)"
    },
    {
        name:"img3",
        url:"url(https://jeiu.ac.kr/img/main/main_slide_03.png)"
    }
];
var banner=document.getElementById("imgContainer").style;
var currentIndex=0;
function CurrentBanner(currentIndex) {
    currentIndex=this.currentIndex;
    banner.backgroundImage=images[currentIndex].url; 
}
CurrentBanner(currentIndex);

// 이미지 슬라이더
// 배너 컨트롤러
//왼쪽으로 가는 버튼
document.getElementById("left").addEventListener("click",function(){
    if (currentIndex==0) {
        currentIndex=(images.length)-1;
    } else {
        currentIndex--;
    }
    CurrentBanner(currentIndex);
})
document.getElementById("right").addEventListener("click",function(){
    if (currentIndex==(images.length)-1) {
        currentIndex=0
    } else {
        currentIndex++;
    }
    CurrentBanner(currentIndex);
})
// 배너 컨트롤러 점 버튼
var imagesBtn=[
    document.getElementById("img1").style,
    document.getElementById("img2").style,
    document.getElementById("img3").style
]
// css 변경
var content1=document.getElementById("boardContents1");
var content2=document.getElementById("boardContents2")
var board1btn1=document.getElementById("board1btn1");
var board1btn2=document.getElementById("board1btn2");

board1btn2.addEventListener("click",function(){
    board1btn2.style.background="var(--white)";
    board1btn2.style.color="var(--main-color)";
    board1btn1.style.background="var(--main-color)";
    board1btn1.style.color="var(--white)";
    content1.style.display="none";
    content2.style.display="block";
})
board1btn1.addEventListener("click",function(){
    board1btn2.style.background="var(--main-color)";
    board1btn2.style.color="var(--white)";
    board1btn1.style.background="var(--white)";
    board1btn1.style.color="var(--main-color)";
    content1.style.display="block";
    content2.style.display="none";
})
