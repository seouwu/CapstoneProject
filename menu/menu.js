document.getElementById('menuBar').addEventListener('click',function(){
    var menu=document.getElementById('menu');
    if (menu.style.display==='none') {
        menu.style.display='block';
    } else {
        menu.style.display='none';
    }
})
document.getElementById('exit').addEventListener('click',function(){
    var menu=document.getElementById('menu');
    if (menu.style.display==='block') {
        menu.style.display='none';
    }
    else{
        menu.style.display='block';
    }
})