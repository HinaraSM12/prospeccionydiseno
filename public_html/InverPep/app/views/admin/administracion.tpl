<!DOCTYPE html>
<html>

<body>
    {include file= "../masterPage/template.tpl"}
    {include file= "../layouts/inc/header.tpl"}
    
            
</body>

<main class="detalle">
    <div class="row">	
        <div class="col-xs-12 col-sm-12 col-md-12">
            {if Session::has('mensaje')}
                <div class="alert alert-success">
                            <p>{{Session::get('mensaje') }}</p>
                            
                </div>			 
            {/if}
            
            <div class="csc-default">
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader">Administración</h1>
		</div>
                <div class="col-lg-12">
                    <ul id="myTab" class="nav nav-tabs nav-justified">
                        <li class="active">
                            <a href="#gestion-usuarios" data-toggle="tab"><i class="fa fa-tree"></i> Gestión de Usuarios</a>
                        </li>
                        <li class="">
                            <a href="#gestion-peptidos" data-toggle="tab"><i class="fa fa-car"></i> Gestión de Péptidos</a>
                        </li>
                        
                    
                    </ul>

                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="gestion-usuarios">
                            <br>
                            <div class="panel panel-success filterable">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Usuarios</h3>
                                    <div class="pull-right">
                                        <button onclick="window.location='{{url("Admin/crear") }}';" class="btn btn-success btn-filter"> <span><i class="glyphicon glyphicon-plus"></i></span> Crear Usuario</button>
                                    </div>

                                </div>
                                <table class="table table-hover" id="task-table">
                                    <thead>
                                        <tr class="filters">
                                            <th align="center">NOMBRES</th>
                                            <th align="center">APELLIDOS</th>
                                            <th align="center">USUARIO</th>
                                            <th align="center">PASSWORD</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $usuarios as $usuario}
                                        <tr>

                                            <td>{$usuario->nombres}</td>
                                            <td>{$usuario->apellidos}</td>
                                            <td>{$usuario->usuario}</td>
                                            <td>{$usuario->password}</td> 
                                            <td><button class='btn btn-default'><a class="normal" href="{url('Admin/eliminar')}/{$usuario->id}"  >Eliminar</a></button></td>
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        
                        </div>
                        <div class="tab-pane fade" id="gestion-peptidos">
                            <br>
                        
                                <div class="panel panel-success filterable">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Péptidos</h3>
                                        <div class="pull-right">
                                            <button class="btn btn-success btn-filter"> <span><i class="glyphicon glyphicon-plus"></i></span> Registrar Péptido</button>
                                            <button class="btn btn-success btn-filter"> <span><i class="glyphicon glyphicon-filter"></i></span>Filtrar</button>
                                        </div>
                                    </div>
                                    <table class="table table-hover" id="task-table">
                                        <thead>
                                            <tr class="filters">
                                                <th align="center"><input type="text" class="form-control" placeholder="UNIPROT" disabled></th>
                                                <th align="center"><input type="text" class="form-control" placeholder="NOMBRE" disabled></th>
                                                <th align="center"><input type="text" class="form-control" placeholder="ACTIVIDAD" disabled></th>
                                                <th align="center"><input type="text" class="form-control" placeholder="REFERENCIA" disabled></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {foreach $peptidos as $peptido}
                                            <tr>

                                                <td>{$peptido->uniprot}</td>
                                                <td>{$peptido->nombre}</td>
                                                <td>{$peptido->actividad}</td>
                                                <td>{$peptido->referencia}</td> 
                                                <td><button class='btn btn-default'><a class="normal" target="new" href="{url('Peptido/ver')}/{$peptido->codigo}"  >Ver más</a></button></td>
                                                <td><button class='btn btn-default'><a class="normal" href="{url('Admin/editar')}/{$peptido->codigo}"  >Editar</a></button></td>
                                                <td><button class='btn btn-default'><a class="normal" href="{url('Admin/borrar')}/{$peptido->codigo}"  > Eliminar</a></button></td>
                                            </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    
                    </div>
                    
                    <br>

                </div>
                
                <br><br>

		
                
                <br><br>

            </div>
	</div>

    </div>
                                        
                        
                
    
                        
</main>

{include file= "../layouts/inc/footer.tpl"}

