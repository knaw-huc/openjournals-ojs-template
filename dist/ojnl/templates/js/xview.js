handleXview();

function handleXview() {
  var userOption  = 'http://localhost:8888/openjournals/index.php/jour2/article/view/4/2'

  if (userOption != '') {
    var xhr= new XMLHttpRequest();
    xhr.open('GET', userOption, true);
    xhr.onreadystatechange= function() {
        if (this.readyState!==4) return;
        if (this.status!==200) return; // or whatever error handling you want
        //console.log(this.responseText);

        //document.getElementById('citationFormat').innerHTML= this.responseText;
    };
    xhr.send();
  }
}
