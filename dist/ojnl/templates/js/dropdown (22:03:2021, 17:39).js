//listbox = document.getElementsByClassName('dropdown');
var listbox = document.querySelectorAll('.dropdown ul li')
for(var i = 0; i < listbox.length; i++) {
    var uull = listbox[i].getElementsByTagName('ul');
    listbox[i].addEventListener("mouseover", dropDown);
}

valItems = document.querySelectorAll('.dropdown ul ul');;
for(var i = 0; i < valItems.length; i++) {
    valItems[i].addEventListener("mouseout", dropDownHide);
}






function dropDown() {
  console.log('1');  var elem = this.querySelector('ul ul');
  elem.style.display = 'flex';
  elem.style.flexDirection = 'column';
  elem.style.width = '270px';
}

function dropDownHide() {

  this.style.display = 'none';
}
