<!DOCTYPE html>
<html>
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<body>
{include file= "../masterPage/template.tpl"}    
{include file= "../layouts/inc/header.tpl"}
            
</body>

<main class="detalle">
<div class="row">	
<div class="col-xs-12 col-sm-12 col-md-12">
		<div class="csc-default">
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader">Editar Péptido</h1>
		</div>
                    {foreach $peptidos as $peptido}
                    <div class="col-lg-12">
                    <br>
                            
                            {Form::open(['url'=>'Admin/editar'])}
                            <span id="helpBlock" class="help-block">Llene los campos que desea buscar. No es necesario llenarlos todos.</span><br>
                         
                            
                            <form class="form-horizontal">

				<div class="form-group">
			    	<label class="col-sm-2 control-label">C&oacutedigo:</label>
			    	<div class="col-sm-3">
			      		<input type="hidden" name="codigo" value="{$peptido->codigo}">
			    	</div>
                                
                                <label class="col-sm-2 control-label">C&oacutedigo UNIPROT:</label>
			    	<div class="col-sm-5">
			      		<input class="form-control" type="text" name="uniprot" value="{$peptido->uniprot}"  >
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">Especie:</label>
			    	<div class="col-sm-10">
			      		<input class="form-control" type="text" name="especie" value="{$peptido->especie}"  >
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">Nombre:</label>
			    	<div class="col-sm-10">
			      		<input class="form-control" type="text" name="nombre" value="{$peptido->nombre}" >
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">Secuencia:</label>
			    	<div class="col-sm-10">
                                    <textarea class="form-control" name="secuencia" value="{$peptido->secuencia}" pattern="[A-Z]+" value="" rows="3" size="50" ></textarea>
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">Tama&ntildeo:</label>
			    	<div class="col-sm-3">
			      		<input class="form-control" type="number" min="0" name="tamano" value="{$peptido->tamano}" >
			    	</div>
                                <label class="col-sm-2 control-label">Se&ntildeal:</label>
			    	<div class="col-sm-5">
			      		<input class="form-control" type="text" name="senal" value="{$peptido->senal}" >
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">Prop&eacuteptido:</label>
			    	<div class="col-sm-4">
			      		<input class="form-control" type="text" name="propeptido" value="{$peptido->propeptido}" >
			    	</div>
                                <label class="col-sm-2 control-label">Actividad:</label>
			    	<div class="col-sm-4">
			      		<input class="form-control" type="text" name="actividad" value="{$peptido->actividad}" >
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">Estructura:</label>
			    	<div class="col-sm-4">
			      		<input class="form-control" type="text" name="estructura" value="{$peptido->estructura}" >
			    	</div>
                                <label class="col-sm-2 control-label">Referencia:</label>
			    	<div class="col-sm-4">
			      		<input class="form-control" type="text" name="referencia" value="{$peptido->referencia}" >
			    	</div>
			  	</div>


			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">Carga neta:</label>
			    	<div class="col-sm-2">
			      		<input class="form-control" type="number" name="carga_neta" value="{$peptido->carga_neta}" >
			    	</div>
                                <label class="col-sm-2 control-label">Hidrofobicidad:</label>
			    	<div class="col-sm-2">
			      		<input class="form-control" type="number" name="hidrofobicidad" min="0" value="{$peptido->hidrofobicidad}"  step="any" >
			    	</div>
                                <label class="col-sm-2 control-label">&Iacutendice Boman:</label>
			    	<div class="col-sm-2">
			      		<input class="form-control" type="number" name="indice_boman"  step="any" value="{$peptido->indice_boman}" >
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">Amino&aacutecidos misma superficie:</label>
			    	<div class="col-sm-2">
			      		<input class="form-control" type="number" name="aminoacidos_misma_superficie" value="{$peptido->aminoacidos_misma_superficie}" min="0" >
			    	</div>
                                <label class="col-sm-2 control-label">Predicci&oacuten de la estructura:</label>
			    	<div class="col-sm-2">
			      		<input class="form-control" type="text" name="prediccion_estructura" value="{$peptido->prediccion_estructura}" >
			    	</div>
                                <label class="col-sm-2 control-label">&Iacutendice alif&aacutetico:</label>
			    	<div class="col-sm-2">
                                    <input class="form-control" type="number" name="indice_alifatico"  step="any" value="{$peptido->indice_alifatico}" min="0" > <br>
			    	</div>
			  	</div>


				<div class="form-group input-lg">
                                <label class="col-sm-2 control-label"></label>
    				<div class="col-lg-10">
      					<button type="submit" value="Buscar" class="btn btn-lg btn-success btn-block">Guardar</button> 
    				</div>
  				</div>
                                
                                </form>
                                
                                
                                

                        
                        {Form::close()}
                    
                    </div>
                        {/foreach}

                </div>
                    
			

			
		</div>
	</div>
</main>

{include file= "../layouts/inc/footer.tpl"}


