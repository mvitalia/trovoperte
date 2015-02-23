

/* dimensione testo */

$(document).on('vclick', '.small', function(e){
    $(".txtwrapper").css('font-size', '15px');
});

$(document).on('vclick', '.med', function(e){
    $(".txtwrapper").css('font-size', '20px');
});

$(document).on('vclick', '.large', function(e){
    $(".txtwrapper").css('font-size', '25px');
});






/** GET PARAMETER **/
function getParameterByName(name)
{
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regexS = "[\\?&]" + name + "=([^&#]*)";
  var regex = new RegExp(regexS);
  var results = regex.exec(window.location.href);
  if(results == null)
    return "";
  else
    return results[1];
}