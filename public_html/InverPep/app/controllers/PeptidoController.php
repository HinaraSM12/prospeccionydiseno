<?php

class PeptidoController extends BaseController {
    
    /*public function getBuscar(){
        $tamanos = Peptido::groupBy('tamano')->get();
         return View::make('peptido.buscar_peptido')->with("tamanos", $tamanos);
    }*/
	
	public function getBuscar(){
        $codigos = Peptido::groupBy('Codigo')->get();
         return View::make('peptido.buscar_peptido')->with("codigos", $codigos);
    }
	
	public function getSearch(){
        $codigos = Peptido::groupBy('Codigo')->get();
         return View::make('peptido.search')->with("codigos", $codigos);
    }
    
    public function postSimple(){
        if ( Input::get('Codigo') != "" ) {
                    $peptidos = Peptido::where('Codigo','=',Input::get('Codigo'))->get();
        }
        echo Input::get('Nombre');
        if ( Input::get('Nombre') != "" ) {
                    $peptidos = Peptido::where('Nombre','=',Input::get('Nombre'))->get();
        }
        
        //if($peptidos){
            return View::make('peptido.listar_peptido') 
                        -> with("peptidos", $peptidos); 
   
        //}else{
        //}
    }
    
    public function postAvanzada(){

        $peptidos = Peptido::where(function($q){
                if ( Input::get('codigo') != "" ) {
				$q->where('Codigo','=',Input::get('codigo'));
                }
                if ( Input::get('especie') != "" ) {
                    $q->where('especie','like','%'.Input::get('especie').'%');
                }
                if ( Input::get('nombre') != "" ) {
                    $q->where('nombre','like','%'. Input::get('nombre').'%');
                }
                if ( Input::get('secuencia') != "" ) {
                    $q->where('secuencia','like','%'.Input::get('secuencia').'%' );
                }
				if (Input::get('tamano') == "1") {
					$q->where('Num_aas','<','10');
				}
				if (Input::get('tamano') == "2") {
					$q->whereBetween('Num_aas',array(10,15));
				}
				if (Input::get('tamano') == "3") {
					$q->whereBetween('Num_aas',array(16,20));
				}
				if (Input::get('tamano') == "4") {
					$q->whereBetween('Num_aas',array(21,30));
				}
				if (Input::get('tamano') == "5") {
					$q->whereBetween('Num_aas',array(31,40));
				}
				if (Input::get('tamano') == "6") {
					$q->where('Num_aas','>','40');
				}
                if (Input::get('estr') == "10") {
                    $q->where('Estructura','like','%helix%');
                }
				if (Input::get('estr') == "20") {
                    $q->where('Estructura','like','%bridge%');
                }
				if (Input::get('estr') == "30") {
                    $q->where('Estructura','like','%beta%');
                }
				if (Input::get('estr') == "40") {
                    $q->where('Estructura','like','%rich%');
                }
				if (Input::get('estr') == "50") {
                    $q->where('Estructura','not like','%helix%')
					->where('Estructura','not like','%bridge%')
					->where('Estructura','not like','%beta%')
					->where('Estructura','not like','%rich%');
                }
                if ( Input::get('act') == "100" ) {
                    $q->where('Actividad','like','%gram%')
					->orWhere('Actividad','like','%bacteria%');
                }
				if ( Input::get('act') == "200" ) {
                    $q->where('Actividad','like','%fungi%');
                }
				if ( Input::get('act') == "300" ) {
                    $q->where('Actividad','like','%virus%');
                }
				if ( Input::get('act') == "400" ) {
                    $q->where('Actividad','like','%parasites%');
                }
				if ( Input::get('act') == "500" ) {
                    $q->where('Actividad','like','%insect%');
                }
				if ( Input::get('act') == "600" ) {
                    $q->where('Actividad','like','%chemotactic%')
					->orWhere('Actividad','like','%mammalian%')
					->orWhere('Actividad','like','%antimicrobial%')
					->orWhere('Actividad','like','%hemolytic%')
					->orWhere('Actividad','like','%cancer%');
                }
                
        })->get();

        if($peptidos){

            return View::make('peptido.listar_peptido') 
            -> with("peptidos", $peptidos); 
   
        }else{
            return Redirect::to("/error")->with('mensaje','El péptido que busca no ha sido encontrado.');
        }        
        
    }
	
	public function postAdvanced(){

        $peptidos = Peptido::where(function($q){
                if ( Input::get('codigo') != "" ) {
				$q->where('Codigo','=',Input::get('codigo'));
                }
                if ( Input::get('especie') != "" ) {
                    $q->where('especie','like','%'.Input::get('especie').'%');
                }
                if ( Input::get('nombre') != "" ) {
                    $q->where('nombre','like','%'. Input::get('nombre').'%');
                }
                if ( Input::get('secuencia') != "" ) {
                    $q->where('secuencia','like','%'.Input::get('secuencia').'%' );
                }
				if (Input::get('tamano') == "1") {
					$q->where('Num_aas','<','10');
				}
				if (Input::get('tamano') == "2") {
					$q->whereBetween('Num_aas',array(10,15));
				}
				if (Input::get('tamano') == "3") {
					$q->whereBetween('Num_aas',array(16,20));
				}
				if (Input::get('tamano') == "4") {
					$q->whereBetween('Num_aas',array(21,30));
				}
				if (Input::get('tamano') == "5") {
					$q->whereBetween('Num_aas',array(31,40));
				}
				if (Input::get('tamano') == "6") {
					$q->where('Num_aas','>','40');
				}
                if (Input::get('estr') == "10") {
                    $q->where('Estructura','like','%helix%');
                }
				if (Input::get('estr') == "20") {
                    $q->where('Estructura','like','%bridge%');
                }
				if (Input::get('estr') == "30") {
                    $q->where('Estructura','like','%beta%');
                }
				if (Input::get('estr') == "40") {
                    $q->where('Estructura','like','%rich%');
                }
				if (Input::get('estr') == "50") {
                    $q->where('Estructura','not like','%helix%')
					->where('Estructura','not like','%bridge%')
					->where('Estructura','not like','%beta%')
					->where('Estructura','not like','%rich%');
                }
                if ( Input::get('act') == "100" ) {
                    $q->where('Actividad','like','%gram%')
					->orWhere('Actividad','like','%bacteria%');
                }
				if ( Input::get('act') == "200" ) {
                    $q->where('Actividad','like','%fungi%');
                }
				if ( Input::get('act') == "300" ) {
                    $q->where('Actividad','like','%virus%');
                }
				if ( Input::get('act') == "400" ) {
                    $q->where('Actividad','like','%parasites%');
                }
				if ( Input::get('act') == "500" ) {
                    $q->where('Actividad','like','%insect%');
                }
				if ( Input::get('act') == "600" ) {
                    $q->where('Actividad','like','%chemotactic%')
					->orWhere('Actividad','like','%mammalian%')
					->orWhere('Actividad','like','%antimicrobial%')
					->orWhere('Actividad','like','%hemolytic%')
					->orWhere('Actividad','like','%cancer%');
                }
                
        })->get();

        if($peptidos){

            return View::make('peptido.list') 
            -> with("peptidos", $peptidos); 
   
        }else{
            return Redirect::to("/error")->with('mensaje','El péptido que busca no ha sido encontrado.');
        }        
        
    }

	public function postFiltro(){
		$peptidos = Peptido::where(function($q){
			if (Input::has('antibacteriano') and Input::get('antibacteriano') == "1") {
                    $q->where('Codigo','=','701');
                }
		})->get();
		
		if($peptidos){
	
            return View::make('peptido.listar_peptido')-> with("peptidos", $peptidos); 
   
        }
	}
	
    public function getListar(){
        $peptidos = Peptido::all();
        return View::make('peptido.listar_peptido')-> with("peptidos", $peptidos);
    }
	
	 public function getList(){
        $peptidos = Peptido::all();
        return View::make('peptido.list')-> with("peptidos", $peptidos);
    }
    
    public function getVer($Codigo){
        $peptidos = Peptido::where('Codigo', '=', $Codigo)->get();
        
        if($peptidos){
            
            return View::make('peptido.ver_peptido')-> with("peptidos", $peptidos);    
        }
		else {
            
        }
       
        
    }
	
	public function getSee($Codigo){
        $peptidos = Peptido::where('Codigo', '=', $Codigo)->get();
        
        if($peptidos){
            
            return View::make('peptido.see')-> with("peptidos", $peptidos);    
        }
		else {
            
        }
       
        
    }
	
}
