
 {include file= "../masterPage/template.tpl"}
<style>
 p.test {
    width: 100%; 
    word-wrap: break-word;
}
</style>
   
    {include file= "../layouts/inc/header.tpl"}
            
<main class="detalle">

    <div class="row">
        <div class="col-lg-12">
            <div class="csc-default">
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader"></h1>
		</div>
                {foreach $peptidos as $peptido}
                    
                <div class="panel panel-default">
                    <div class="panel-heading">
						<h2 class="panel-title">{$peptido->Nombre}</h2>
					</div>
                    <div class="panel-body"></div>
					<br>
						<h4> 
						<b>CÓDIGO: </b> {$peptido->Codigo} <br>
						<b>FILO: </b> {$peptido->Filo} <br>
                        <b>ESPECIE: </b> <i>{$peptido->Especie}</i><br>
                        <b>NOMBRE: </b> {$peptido->Nombre} <br>
                        <p class="test"> <b>SECUENCIA: </b>  {$peptido->Secuencia} <br> </p>
                        <b>NÚMERO DE AMINOÁCIDOS: </b> {$peptido->Num_aas} <br>
                        <b>PESO MOLECULAR: </b> {{round({$peptido->Peso_molecular},3)}} <br>
                        <b>ESTRUCTURA: </b> {$peptido->Estructura} <br>
                        <b>CARGA NETA A PH7: </b> {{round({$peptido->Carga_neta},3)}} <br>
                        <b>pI: </b> {{round({$peptido->pl},3)}} <br>
                        <b>HIDROFOBICIDAD: </b> {{round({$peptido->Hidrofobicidad},3)}} <br>
                        <b>ÍNDICE DE BOMAN: </b> {{round({$peptido->Indice_Boman},3)}} <br>
                        <b>ÍNDICE ALIFÁTICO: </b> {{round({$peptido->Indice_alifatico},3)}} <br>
                        <b>% DE AMINOÁCIDOS HIDROFÓBICOS: </b> {{round({$peptido->pct_aas_hidrofobicos},3)}} <br>
                        <b>ACTIVIDAD: </b> {$peptido->Actividad} <br>
						<b>ORIGEN: </b> {$peptido->Origen} <br>
                        <b>REFERENCIA: </b> {$peptido->Referencia} <br>
						<b>LINK: </b> <a href="{$peptido->Link}" target="_new">{$peptido->Link}</a><br><br>
						</h4>
						<center>
						<td><button class='btn btn-default'><a class="normal" target="_self" href="{url('Peptido/listar')}">Regresar al listado</a></button></td>
						</center>
						
                </div>
                {/foreach}
            </div>
        </div>
    </div>
            
    <br><br>
                

</main>

{include file= "../layouts/inc/footer.tpl"}

