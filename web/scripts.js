
/*
 * Parse file name from path and return it
 * 
 */
function extractFilename(path) { 
    var x;
    x = path.lastIndexOf('\\');
    if (x >= 0) // Windows-based path
        return path.substr(x+1);
    x = path.lastIndexOf('/');
    if (x >= 0) // Unix-based path
        return path.substr(x+1);
    return path; // just the filename
}

/*
 * Update file name in element with id named filename_error
 * 
 */
function updateFilename(path) {
   var name = extractFilename(path);
   document.getElementById('filename_error').textContent = name;
   //document.getElementById('filename_error').Value = name;
   
   var file_ext = name.slice(name.lastIndexOf('.'),name.length).trim();
   var file_ext_patt = /.csv$/i;
   //alert("'" + file_ext + "' " + file_ext_patt.test(file_ext));
   //use test method on pattern with string as param to check if string contains the regex pattern
    if (name != "" && file_ext_patt.test(file_ext)) {
       document.getElementById('filename_error').textContent = "";
   } else {
       document.getElementById('filename_error').textContent = "Only CSV files allowed.";
   }
   
 }
