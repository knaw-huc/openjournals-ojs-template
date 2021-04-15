var sass = require('sass');


var result = sass.renderSync({file: './scss/style.scss'});

console.log(result.css.toString());









// sass.render({
//   file: './scss/style.scss',
//   outFile: './sss/style.css',
//   function(err, result) {
//     //
//   });


// fs.watchFile(f, function (curr, prev) {
//   console.log('the current mtime is: ' + curr.mtime);
//   console.log('the previous mtime was: ' + prev.mtime);
// });
