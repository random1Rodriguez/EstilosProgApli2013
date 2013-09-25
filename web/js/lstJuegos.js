$(document).ready(function(){
  var lst;
  function cargarCat(lstCat){
     var direccion = "lstCat"; 
     $.ajax({
         url:direccion,
         type:"GET",
         success: function(data){
           $("#cat").keyup(function(){
              $.each(lst, function (ind, elem) { 
                   out.println("<li>");
                   out.println(elem);
                   out.println("</li>");
                 }); 
              });   
        }
     });
  } 
  

});
