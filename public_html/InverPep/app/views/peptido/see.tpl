 {include file= "../masterPage/template.tpl"}
<style>
 p.test {
    width: 100%; 
    word-wrap: break-word;
}
 </style>
   
    {include file= "../layouts/inc/header1.tpl"}
            
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
						<b>CODE: </b> {$peptido->Codigo} <br>
						<b>PHYLUM: </b> {$peptido->Filo} <br>
                        <b>SPECIE: </b> <i>{$peptido->Especie}</i><br>
                        <b>NAME: </b> {$peptido->Nombre} <br>
                        <p class="test"> <b>SEQUENCE: </b> {$peptido->Secuencia} <br> </p>
                        <b>LENGTH: </b> {$peptido->Num_aas} <br>
                        <b>MOLAR MASS: </b> {{round({$peptido->Peso_molecular},3)}} <br>
                        <b>STRUCTURE: </b> {$peptido->Estructura} <br>
                        <b>CHARGE: </b> {{round({$peptido->Carga_neta},3)}} <br>
                        <b>pI: </b> {{round({$peptido->pl},3)}} <br>
                        <b>HYDROPHOBICITY: </b> {{round({$peptido->Hidrofobicidad},3)}} <br>
                        <b>BOMAN INDEX: </b> {{round({$peptido->Indice_Boman},3)}} <br>
                        <b>ALIPHATIC INDEX: </b> {{round({$peptido->Indice_alifatico},3)}}<br>
                        <b>% OF HYDROPHOBIC AMINO ACIDS: </b> {{round({$peptido->pct_aas_hidrofobicos},3)}} <br>
                        <b>ACTIVITY: </b> {$peptido->Actividad} <br>
						<b>SOURCE: </b> {$peptido->Origen} <br>
                        <b>REFERENCE: </b> {$peptido->Referencia} <br>
						<b>LINK: </b> <a href="{$peptido->Link}" target="_new">{$peptido->Link}</a><br><br>
						</h4>
						<center>
						<td><button class='btn btn-default'><a class="normal" target="_self" href="{url('Peptido/list')}">Back to list</a></button></td>
						</center>
						
                </div>
                {/foreach}
            </div>
        </div>
    </div>
            
    <br><br>
          
</main>

{include file= "../layouts/inc/footer.tpl"}

