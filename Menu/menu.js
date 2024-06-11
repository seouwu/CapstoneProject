//메뉴바
var menuIcon=document.getElementById("menubar");
var menuExit=document.getElementById("exit");
var mainMenu=document.getElementById("menu");

menuIcon.addEventListener("click",function(){
    mainMenu.style.right="0";
    menuExit.style.right="2rem";
})

// 공통 함수 정의
function addMenuEventHandlers(menuId, subMenuClass) {
    var menu = document.getElementById(menuId);
    var subMenus = document.getElementsByClassName(subMenuClass);

    menu.addEventListener("mouseover", function() {
        for (var i = 0; i < subMenus.length; i++) {
            subMenus[i].style.display = "block";
        }
    });

    menu.addEventListener("mouseout", function() {
        for (var i = 0; i < subMenus.length; i++) {
            subMenus[i].style.display = "none";
        }
    });
}

// 각 메뉴에 대해 공통 함수 호출
addMenuEventHandlers("ul1", "subMenu1");
addMenuEventHandlers("ul2", "subMenu2");
addMenuEventHandlers("ul3", "subMenu3");
addMenuEventHandlers("ul4", "subMenu4");
addMenuEventHandlers("ul5", "subMenu5");