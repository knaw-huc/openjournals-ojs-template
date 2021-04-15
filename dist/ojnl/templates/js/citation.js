
function handleCitation() {
  var userOption  = document.getElementById('citationSelect').value;

  if (userOption != '') {
    var xhr= new XMLHttpRequest();
    xhr.open('GET', userOption, true);
    xhr.onreadystatechange= function() {
        if (this.readyState!==4) return;
        if (this.status!==200) return; // or whatever error handling you want
        document.getElementById('citationFormat').innerHTML= this.responseText;
    };
    xhr.send();
  }
}
