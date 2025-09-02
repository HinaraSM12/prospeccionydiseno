{include file= "../masterPage/templateResponsive.tpl"}  

    {include file= "../layouts/inc/header.tpl"}


<main class="detalle">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            {if Session::has('mensaje')}
                <div class="alert alert-danger">
                            <p>{{Session::get('mensaje') }}</p>

                </div>
            {/if}

            <div class="csc-default">
                <div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader"></h1>
		</div>
                <div class="row" style="margin-top:20px">
                    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                        {Form::open(['url'=>'/login'])}
                            <fieldset>
				<h2>BIENVENIDO!!! </h2>
                                <span id="helpBlock" class="help-block">Por favor inicia sesión.</span><br>

				<!--<hr class="colorgraph">-->
				<div class="form-group">
                                    <input type="text" name="usuario" id="email" class="form-control input-lg" placeholder="Usuario" aria-describedby="basic-addon2">
                                    <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-user"></span></span>
				</div>
				<div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Contraseña" aria-describedby="basic-addon2">
                                    <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
				</div>
				<!--<hr class="colorgraph">-->
				<div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Login">
                                    </div>
				</div>
                            </fieldset>
                      {Form::close()}
                    </div>
                </div>

            </div>

        </div>

    </div>
</main>

 {include file= "../layouts/inc/footer.tpl"}
