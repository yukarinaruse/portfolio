/*  スライダー  */
window.onload = () => {
    const slide = document.getElementById("slide_img");
    const img_src = ["images/camp-001.jpg", "images/camp-002.jpg", "images/camp-006.jpg", "images/camp-004.jpg"];
    let num = 0;

    function slide_time() {
        num = ++num % img_src.length;
        slide.src = img_src[num];
    }

    setInterval(slide_time, 2500);
}; 

  
  