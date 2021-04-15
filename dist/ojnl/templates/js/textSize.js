const elems = ['sizeH1', 'sizeContentNormal', 'sizeH2', 'sizeContent']


function decreaseTextSize() {
  for (var i = 0; i < elems.length; i++) {
    txtResize(elems[i], -4);
  }
}




function increaseTextSize() {
  for (var i = 0; i < elems.length; i++) {
    txtResize(elems[i], 4);
  }
}


function txtResize(classVar, size) {

  const element = document.querySelector('.'+classVar);
  const style = getComputedStyle(element);
  const fontSize = Number(style.fontSize.replace ('px', ''));

  if ( (fontSize >= 16) && (fontSize <= 40) ) {
    var allEmen = document.querySelectorAll('.'+classVar);
    for (i = 0; i < allEmen.length; i++) {
      console.log(classVar, (fontSize + size));
      allEmen[i].style.fontSize = (fontSize + size)+'px';
      allEmen[i].style.lineHeight = '150%';
    }
  }


}
