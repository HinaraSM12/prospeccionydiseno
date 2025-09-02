{include file= "../masterPage/template.tpl"}
{include file= "../layouts/inc/header.tpl"}

<style>
.filo{
display: none;
}
.accion{
display: none;
}
</style>
<script>

function inArray(needle, haystack) {
    var length = haystack.length;
    for(var i = 0; i < length; i++) {
        if(haystack[i] == needle) return true;
    }
    return false;
}


function mostrar_accion(elemento){
selected_accion = [];
$('input:checkbox.accion_c').each(function () {
       var sThisVal = (this.checked ? $(this).val() : "");
	   if(sThisVal != '')selected_accion.push(sThisVal);
  });




$(".accion").each(function(index, val){
	value_accion = $(val).html();

	if(inArray(value_accion, selected_accion)){
	$($(val).parent()).show();
	}else{
	$($(val).parent()).hide();
	}
});
}

function mostrar_filo(elemento){
selected_filos = [];
$('input:checkbox.filo_c').each(function () {
       var sThisVal = (this.checked ? $(this).val() : "");
	   if(sThisVal != '')selected_filos.push(sThisVal);
  });




$(".filo").each(function(index, val){
	value_filo = $(val).html();

	if(inArray(value_filo, selected_filos)){
	$($(val).parent()).show();
	}else{
	$($(val).parent()).hide();
	}
});
}
</script>
<main class="detalle">

    <div class="row">
        <div class="col-lg-12">
            <div class="csc-default">
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader">Listado de Péptidos</h1>
		</div>



            </div>
        </div>

        <div class="panel panel-success col-lg-3">
			<div class="panel-heading">
                <h3 class="panel-title">Búsqueda rápida</h3>
			</div>

			<br>
			<h3 align="center"><b>Actividad</b></h3>

			<div class="checkbox">
				<label><input type="checkbox" class='accion_c' onchange="mostrar_accion(this)" checked='checked' id="antibacteriano" value="Antibacteriano">Antibacteriano</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='accion_c' onchange="mostrar_accion(this)" checked='checked' id="antifungico" value="Antifungico">Antifúngico</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox"  class='accion_c' onchange="mostrar_accion(this)" checked='checked' id="antiviral" value="Antiviral">Antiviral</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='accion_c' onchange="mostrar_accion(this)" checked='checked' id="antiparasitario" value="Antiparasitario">Antiparasitario</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='accion_c' onchange="mostrar_accion(this)" checked='checked' id="insecticida" value="Insecticida">Insecticida</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='accion_c' onchange="mostrar_accion(this)" checked='checked' id="citotoxico" value="Citotoxico">Citotoxico</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='accion_c' onchange="mostrar_accion(this)" checked='checked' id="antitumoral" value="Antitumoral">Antitumoral</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='accion_c' onchange="mostrar_accion(this)" checked='checked' id="antimicrobiano" value="Antimicrobiano">Antimicrobiano</label>
			</div>

			<br>
			<h3 align="center"><b>Filo</b></h3>

			<div class="checkbox">
				<label><input type="checkbox" class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="anelida" value="Annelida">Anélida</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="artropoda" value="Arthropoda">Artrópoda</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="equinoderma" value="Echinodermata">Equinoderma</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox"  class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="molusca" value="Mollusca">Molusca</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="nematodo" value="Nematoda">Nemátodo</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="Chordata (Tunicata)" value="Chordata (Tunicata)">Chordata (Tunicata)</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="platelminto" value="Platyhelminthes">Platelminto</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="placozoa" value="Placozoa">Placozoa</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class='filo_c' onchange="mostrar_filo(this)" checked='checked'  id="Cnidaria (Hydridae)" value="Cnidaria (Hydridae)">Cnidaria (Hydridae)</label>
			</div>
		</div>

        <div class="panel panel-success filterable  col-lg-offset-4">
            <div class="panel-heading">
                <h3 class="panel-title">Péptidos</h3>
                <div class="pull-right">
                    <button class="btn btn-lg btn-success btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtrar</button>
                </div>
            </div>
            <table class="table table-hover"id="task-table">
                <thead>
                    <tr class="filters">
                        <th align="center"><input type="text" class="form-control" placeholder="CÓDIGO" disabled></th>
                        <th align="center"><input type="text" class="form-control" placeholder="NOMBRE" disabled></th>
                        <th align="center"><input type="text" class="form-control" placeholder="ESPECIE" disabled></th>
                        <th align="center"><input type="text" class="form-control" placeholder="TAMAÑO" disabled></th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $peptidos as $peptido}
                    <tr>
                        <!--
                        <td>{$peptido->uniprot}</td>
                        <td>{$peptido->nombre}</td>
                        <td>{$peptido->especie}</td>
                        <td>{$peptido->tamano}</td>
                        <td>{$peptido->actividad}</td>
                        <td>{$peptido->referencia}</td> -->

						<td>{$peptido->Codigo}</td>
                        <td>{$peptido->Nombre}</td>
                        <td>{$peptido->Especie}</td>
                        <td>{$peptido->Num_aas}</td>

						<td class='filo'>{$peptido->Filo}</td>
						<td class='accion'>{$peptido->Accion}</td>
						<!--<td><button class='btn btn-default'><a href="{url('Peptido/ver')}/{$peptido->Codigo}" target="_self">Ver más</a></button></td>-->
						<td><a class='btn btn-default' href="{url('Peptido/ver')}/{$peptido->Codigo}" target="_new">Ver más</a></td>

                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>


    </div>




</main>
{include file= "../layouts/inc/footer.tpl"}
