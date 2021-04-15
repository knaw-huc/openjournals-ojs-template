//ojPlayVideo

function modalLoad() {
  document.getElementById('modvid').style.display = 'flex';
}

function closeModal() {
  document.getElementById('modvid').style.display = 'none';
  var elem = document.getElementById('player1');
  if (elem) {
    stopVideo( elem );
  }
}


var stopVideo = function ( element ) {
    var iframe = element.querySelector( 'iframe');
    var video = element.querySelector( 'video' );
    if ( iframe !== null ) {
        var iframeSrc = iframe.src;
        iframe.src = iframeSrc;
    }
    if ( video !== null ) {
        video.pause();
    }
};
