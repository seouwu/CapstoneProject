document.getElementById('icon').addEventListener('click',function(){
    var SideMenu=document.getElementById('SideMenu');
    if (SideMenu.style.display==='none') {
        SideMenu.style.display='block';
    } else {
        SideMenu.style.display='none';
    }
})
document.getElementById('exit').addEventListener('click',function(){
    var SideMenu=document.getElementById('SideMenu');
    if (SideMenu.style.display==='block') {
        SideMenu.style.display='none';
    }
    else{
        SideMenu.style.display='none';
    }
})