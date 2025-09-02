<?php

class AdminController extends BaseController {

    public function getIndex(){
        $peptidos = Peptido::all();
        $usuarios = Usuario::all();
        return View::make('admin.administracion')
                -> with("peptidos", $peptidos)
                -> with("usuarios", $usuarios);
    }
    
    public function getEliminar($id){
        // Método para Eliminar Usuario
        $Usuarios = Usuario::find($id);
        if ($Usuarios){
            $Usuarios->delete();
        }
        return Redirect::to("/Admin")->with('mensaje','¡Usuario Eliminado Correctamente!.');
        
    }
    public function getBorrar($codigo){
        // Método para Borrar Péptidos
        $peptidos = Peptido::where('codigo', '=', $codigo)->get();
        if ($peptidos){
            $peptidos->delete();
        }
        return Redirect::to("/Admin")->with('mensaje','¡Péptido Eliminado Correctamente!.');
        
    }
    
    public function getCrear(){
        return View::make('admin.crear');
    }

    public function postCrear(){
        
        // Método para Crear Usuario

	$rules = [
	'nombres' => 'required|min:4|max:20',
        'apellidos' => 'required|min:4|max:20',
        'usuario' => 'required|min:4|max:20|unique:usuario',
	'password' => 'required|min:6|max:100' 
        ];
        
	 $messages = [
		    'required' => 'El campo :attribute es obligatorio.',
		    'min' => 'El campo :attribute no puede tener menos de :min carácteres.',
		    'max' => 'El campo :attribute no puede tener más de :min carácteres.',
		    'unique' => 'El usuario ingresado ya existe en la base de datos'
        ];
        
	$validation = Validator::make(Input::all(), $rules, $messages); 
        
	if ($validation->fails())
	    {
                echo $validation->messages();
 
	        return Redirect::to("/Admin/crear")-> withErrors($validation)->withInput();
 
	    }
        else
            {
                $usuario =[
                    'nombres' =>Input::get('nombres'),
                    'apellidos' => Input::get('apellidos'),
                    'usuario' => Input::get('usuario'),
                    'password' => Hash::make(Input::get('password'))
                ];
                $insert = DB::table('usuario')->insert($usuario);
        
                if($insert)
	    	{
 
	    		return Redirect::to("/Admin")->with('mensaje','¡Usuario Registrado Correctamente!.');
                        
 
	    	}
 
	    }
    }
    
    
    
    public function getEditar($codigo){
        $peptidos = Peptido::where('codigo', '=', $codigo)->get();
        echo $peptidos;
        if ($peptidos){
                return View::make('admin.editar')-> with("peptidos", $peptidos);
        }
    }
    
    
    public function postEditar(){
        
        // Método para Editar Péptidos
        $peptido = [
        'codigo' => Input::get('codigo'),
        'uniprot' => Input::get('uniprot'),
        'especie' => Input::get('especie'),
        'nombre' => Input::get('nombre'),
        'secuencia' => Input::get('secuencia'),
        'tamano' => Input::get('tamano'),
        'senal' => Input::get('senal'),
        'propeptido' => Input::get('propeptido'),
        'actividad' => Input::get('actividad'),
        'estructura' => Input::get('estructura'),
        'referencia' => Input::get('referencia'),
        'carga_neta' => Input::get('carga_neta'),
        'hidrofobicidad' => Input::get('hidrofobicidad'),
        'indice_boman' => Input::get('indice_boman'),
        'aminoacidos_misma_superficie' => Input::get('aminoacidos_misma_superficie'),
        'prediccion_estructura' => Input::get('prediccion_estructura'),
        'indice_alifatico' => Input::get('indice_alifatico')
        ];

	$update = DB::table('peptido')
                ->where('codigo', Input::get('codigo'))
                ->update($peptido);
        
                if($update)
	    	{
 
	    		return Redirect::to("/Admin")->with('mensaje','¡Péptido Guardado!.');
                        
 
	    	}
 
	    
    }
    public function getLogout() {
        Auth::logout();
        return Redirect::to('/');
    }
    
    
}