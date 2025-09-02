<!-- Interfaz Crear Usuario -->

<!DOCTYPE html>
<html>

<body>
    {include file= "../masterPage/template.tpl"}
    {include file= "../layouts/inc/header.tpl"}
    
            
</body>

<main class="detalle">
    <div class="row">	
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="csc-default">
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader">Crear Usuario</h1>
		</div>
                <br>
                <div class="col-lg-12">
                    <!--si el formulario contiene errores de validación-->
		{if $errors->any()}
			<div class="alert alert-danger">
                            <p>Diligencia el formulario correctamente:</p>
                            <ul>
                                {foreach $errors->all() as $error}
                                    - {{$error}} <br>
                                {/foreach}
                                
                            </ul>
			</div>
		{/if}
                {Form::open(['url'=>'Admin/crear'])}
                <span id="helpBlock" class="help-block">Llene los campos que aparecen a continuación</span> <br>				
                <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                          <label class="col-lg-2 control-label">Nombres: </label>
                                          <div class="col-lg-10">
                                              <input type="text" class="form-control" value="{Input::old('nombres')}" name="nombres" id="nombres" placeholder="" >
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <label class="col-lg-2 control-label">Apellidos</label>
                                          <div class="col-lg-10">
                                            <input type="text" class="form-control" value="{Input::old('apellidos')}" name="apellidos" placeholder="" id="apellidos">
                                          </div>
                                        </div>

                                        <div class="form-group">
                                          <label class="col-lg-2 control-label">Usuario: </label>
                                          <div class="col-lg-10">
                                              <input type="text" class="form-control" value="{Input::old('usuario')}" name="usuario" placeholder="" id="usuario">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <label class="col-lg-2 control-label">Password: </label>
                                          <div class="col-lg-10">
                                              <input type="password" class="form-control" name="password" placeholder=""> <br>
                                          </div>
                                        </div>

                                        <div class="form-group">
                                          <label class="col-lg-2 control-label"></label>
                                          <div class="col-lg-10">
                                              <button type="submit" value="Crear" class="btn btn-lg btn-success btn-block">Crear</button> 
                                          </div>
                                        </div>

                                      </form>                    
                {Form::close()}
                
                
                </div>
                        
	</div>

    </div>
    </div>
                        
           
    
                        
</main>

{include file= "../layouts/inc/footer.tpl"}

