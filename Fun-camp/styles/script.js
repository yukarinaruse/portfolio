window.onload=() =>{
const wrap = document.getElementById('wrap');
const start = document.getElementById('start');


const img_src = ["images/camp-001.jpg", "images/camp-002.jpg", "images/camp-006.jpg","images/camp-004.jpg",];
    let num = -1;
 
function slide_time() {
    if (num === 3) {
        num = 0;
        } else {
        num++;
        }
    document.getElementById("slide_img").src = img_src[num];
    }
 
setInterval(slide_time, 2500)};
