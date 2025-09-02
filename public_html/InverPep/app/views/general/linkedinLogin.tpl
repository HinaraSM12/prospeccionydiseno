<link rel="stylesheet" href="{URL::to('/')}/assets/css/linkedinLogin.css">
{include file= "../masterPage/template.tpl"}  
  
    
            
</body>    
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
                {if (isset($data))}
                    <div class="row" style="margin-top:20px">
                        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                            
                                <h1>Hello, {{$data->firstName }}!</h1>
                                <h2>Información Capturada</h2>    
                                <p><pre>{{var_dump($data)}}</pre></p>
                            
                        </div>
                    </div>
                    
                    
                {else}
                <div class="row" style="margin-top:20px">
                    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                        
                            <fieldset>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-md-offset-3">
                                        <h2><img  src="{URL::to('/')}/assets/img/Sunn.png" width="200" height="auto"></h2>
                                    </div>
                                    
				</div>
                                
                                <span id="helpBlock" class="help-block"><a class="btn" href="{{url('login/linkedin')}}"><img src="{URL::to('/')}/assets/img/login-with-linkedin.png" width="300" height="auto"></a></span><br>

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
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-md-offset-2">
                                        
                                    </div>
                                    </div>
				</div>
                                
                            </fieldset>
                      
                    </div>
                </div>
                {/if}

            </div>
            
        </div>
            
    </div>
</main>
</html>