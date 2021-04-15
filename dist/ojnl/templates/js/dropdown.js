//listbox = document.getElementsByClassName('dropdown');
var listbox = document.querySelectorAll('.dropdown ul li');
for(var i = 0; i < listbox.length; i++) {
    var uull = listbox[i].getElementsByTagName('ul');
    listbox[i].addEventListener("mouseover", dropDown);
}

valItems = document.querySelectorAll('.dropdown ul ul');
for(var i = 0; i < valItems.length; i++) {
    valItems[i].addEventListener("mouseout", dropDownHide);
}






function dropDown() {
  dropHideAll();
  var elem = this.querySelector('ul ul');

  if(typeof elem !== "null") {
      elem.style.display = 'flex';
      elem.style.flexDirection = 'column';
      elem.style.width = '270px';
    }

}

function dropDownHide() {
  this.style.display = 'none';
}

function dropHideAll() {
  //console.log(listbox);
  for(var i = 0; i < listbox.length; i++) {
    //console.log(listbox[i]);
      var uull = listbox[i].getElementsByTagName('ul');
      for(var j = 0; j < uull.length; j++) {
        uull[j].style.display = 'none';
      }
  }
}
