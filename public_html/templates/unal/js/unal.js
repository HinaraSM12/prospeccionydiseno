/*Buscador*/
(function() {
    var cx = '008572255874373046644:chip1p1uf-4';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
  
  function checkBck(){
       jQuery(".gsc-input input").attr("placeholder", "Buscar en la Universidad");
    if (!jQuery(".gsc-search-button input").attr("src")) {
        window.setTimeout(function() {
            checkBck()
        }, 100)
    }
}
 checkBck()

jQuery(document).ready(function($) {
    $('body').addClass('row-offcanvas row-offcanvas-right');
    $('#services').css({'right':parseInt($('#services').width())*-1})
  $('.indicator','#services').click(function() {
	$(this).toggleClass('active');
    $b=$('body');
    $s=$('#services');
    $s.height($(window).height()).toggleClass('active');
    $('ul',$s).height($(window).height());
    $('.row-offcanvas').toggleClass('active');
    if($b.hasClass('active')){
      $b.css({'right':$('#services').width(),'overflow':'hidden'})
      $s.css({'right':0})
    }else{
      $b.css({'right':0,'overflow':''})
      $s.css({'right':parseInt($('#services').width())*-1})
    }
  });
});


   var gcseDiv = document.getElementById('gsearch');
   gcseDiv.innerHTML = '<gcse:searchbox-only resultsurl="http://unal.edu.co/resultados-de-la-busqueda/"></gcse:searchbox-only>';

