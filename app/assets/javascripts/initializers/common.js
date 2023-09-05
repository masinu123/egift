function getStringDate(date) {
  if (typeof date.getDate !== 'function') {
    return '';
  }

  var d = date.getDate();
  var m = date.getMonth() + 1;
  var y = date.getFullYear();

  return '' + y + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);
}

function getTypeAttachment(url){
  if ( url.indexOf("faq" )  > -1){
    return "faq";
  }else if ( url.indexOf("blog" )  > -1){
    return "blog";
  }
  return "";
}
