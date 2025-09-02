/*Buscador*/
(function() {
    var cx = '008572255874373046644:chip1p1uf-4';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//www.google.com/cse/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
  
  function checkBck(){
    if(jQuery('.gsc-search-button input').attr('src')){
        jQuery('.gsc-search-button input').attr('src','https://medellin.unal.edu.co/templates/unal/plugins/ke_search/search.png');
        jQuery('.gsc-input input').attr('placeholder','Buscar en la Universidad');
          }else{
        window.setTimeout(function(){checkBck();},100);
          }
  }
 checkBck();
 
function inputTamano(){
    var indice = document.getElementById("miSelect").selectedIndex;
    if(indice == '1'){
        document.getElementById("uniprot").style.display = "block";
    }else{
        document.getElementById("uniprot").style.display = "none";
    }
    if(indice == '2'){
        document.getElementById("tamanos").style.display = "block";
    }else{
        document.getElementById("tamanos").style.display = "none";
    }
}

jQuery(document).ready(function($) {
    $('body').addClass('row-offcanvas row-offcanvas-right');
    $('#services').css({'right':parseInt($('#services').width())*-1});
    $('.indicator','#services').click(function() {
	$(this).toggleClass('active');
    $b=$('body');
    $s=$('#services');
    $s.height($(window).height()).toggleClass('active');
    $('ul',$s).height($(window).height());
    $('.row-offcanvas').toggleClass('active');
    if($b.hasClass('active')){
      $b.css({'right':$('#services').width(),'overflow':'hidden'});
      $s.css({'right':0});
    }else{
      $b.css({'right':0,'overflow':''});
      $s.css({'right':parseInt($('#services').width())*-1});
    }
  });
});

jQuery(document).ready(function(){
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){ 
        
        var code = e.keyCode || e.which;
        if (code == '9') return;
        
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
       
        $table.find('tbody .no-result').remove();
        
        $rows.show();
        $filteredRows.hide();
        
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});


