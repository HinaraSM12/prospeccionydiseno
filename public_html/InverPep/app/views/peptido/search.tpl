 {include file= "../masterPage/template.tpl"}   
{include file= "../layouts/inc/header1.tpl"}          

<main class="detalle">
<div class="row">	
<div class="col-xs-12 col-sm-12 col-md-12">
		<div class="csc-default">
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader">Search Peptides</h1>
		</div>
                    
                    <div class="col-lg-12">
                    <ul id="myTab" class="nav nav-tabs nav-justified">
                        
                        <li class="active">
                            <a href="#busqueda-avanzada" data-toggle="tab"><i class="fa fa-car"></i> Advanced Search</a>
                        </li>
                    
                    </ul>
                        
                    
                        
                        
                        <div class="tab-pane active in" id="busqueda-avanzada">
                            <br>
                            
                            {Form::open(['url'=>'Peptido/advanced'])}
                            <span id="helpBlock" class="help-block">Fill in the fields to search. No need to fill them all.</span><br>
                         
                            
                            <form class="form-horizontal">

				<div class="form-group">
			    	<label class="col-sm-3 control-label col-sm-offset-1">Code:</label>
			    	<div class="col-sm-8">
			      		<input class="form-control" type="number" name="codigo">
			    	</div>
                                
                                <label class="col-sm-3 control-label col-sm-offset-1">Source species:</label>
			    	<div class="col-sm-8">
			      		<input class="form-control" type="text" name="especie">
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-3 control-label col-sm-offset-1">Peptide name:</label>
			    	<div class="col-sm-8">
			      		<input class="form-control" type="text" name="nombre" value=""  >
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-3 control-label col-sm-offset-1">Sequence:</label>
			    	<div class="col-sm-8">
                                    <textarea class="form-control" name="secuencia" pattern="[A-Z]+" value="" rows="3" size="50" ></textarea>
			    	</div>
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-3 control-label col-sm-offset-1">Length:</label>
			    	<div class="col-sm-8">
			      		<select class="form-control" name="tamano">
							<option value="">Select a range of size</option>
							<option value="1"><10</option>
							<option value="2">10-15</option>
							<option value="3">16-20</option>
							<option value="4">21-30</option>
							<option value="5">31-40</option>
							<option value="6">>40</option>
						</select>							
			    	</div>
                                
			  	</div>

			  	<div class="form-group">
			    	<label class="col-sm-3 control-label col-sm-offset-1">Structure:</label>
			    	<div class="col-sm-8">
			      		<select class="form-control" name="estr">
							<option value="">Select an structure</option>
							<option value="10">Helix</option>
							<option value="20">Bridge</option>
							<option value="30">Beta</option>
							<option value="40">Rich</option>
							<option value="50">Other</option>
						</select>
			    	</div>
					
                                <label class="col-sm-3 control-label col-sm-offset-1">Activity:</label>
			    	<div class="col-sm-8">
			      		<select class="form-control" name="act">
							<option value="">Select an activity</option>
							<option value="100">Antibacteriana</option>
							<option value="200">Antifúngico</option>
							<option value="300">Antiviral</option>
							<option value="400">Antiparasitario</option>
							<option value="500">Insecticida</option>
							<option value="600">Other</option>
						</select>
						<br>
			    	</div>
			  	</div>

                                <hr>
                                

				<div class="form-group input-lg">
                                <label class="col-sm-2 control-label"></label>
    				<div class="col-lg-10">
      					<button type="submit" value="Buscar" class="btn btn-lg btn-success btn-block">Search</button> 
    				</div>
  				</div>
                                
                                </form>
                                
                                
                                

                        </div>
                        {Form::close()}
                    
                    </div>

                </div>
                    
			

			
		</div>
	</div>
</main>

{include file= "../layouts/inc/footer.tpl"}





