<?php
//////////////////////PRUEBAS//////////////////////////////
Route::get('/linkedinLogin', function() //Rutas directas
{
            $data = Session::get('data');
            return View::make('general.linkedinLogin')->with('data', $data); 
});

Route::get('/login/linkedin', function()
{
    $provider = new Linkedin(Config::get('social.linkedin'));
    if ( !Input::has('code')) {
        // If we don't have an authorization code, get one
        $provider->authorize();
    } else {
        try {
            // Try to get an access token (using the authorization code grant)
            $t = $provider->getAccessToken('authorization_code', array('code' => Input::get('code')));
            try {
                // We got an access token, let's now get the user's details
                $userDetails = $provider->getUserDetails($t);
                $resource = '/v1/people/~:(firstName,lastName,pictureUrl,positions,educations,threeCurrentPositions,threePastPositions,dateOfBirth,location)';
                $params = array('oauth2_access_token' => $t->accessToken, 'format' => 'json');
                $url = 'https://api.linkedin.com' . $resource . '?' . http_build_query($params);
                $context = stream_context_create(array('http' => array('method' => 'GET')));
                $response = file_get_contents($url, false, $context);
                $data = json_decode($response);
                return Redirect::to('/user')->with('data',$data);
            } catch (Exception $e) {
                return 'Unable to get user details';
            }

        } catch (Exception $e) {
            return 'Unable to get access token';
        }
    }
});

Route::get('/user', function()
{
    $data = Session::get('data');
    return View::make('user')->with('data', $data);
});





///////////////////////INVERPEP///////////////////////////

/*Route::get('/', function() //Rutas directas
{
            return View::make('general.index'); 
});*/

Route::get('/home', function() //Rutas directas
{
            return View::make('general.index'); 
});

Route::get('/', function() //Rutas directas
{
            return View::make('general.index'); 
});


Route::get('/home_en', function() //Rutas directas
{
            return View::make('general.index_en'); 
});
Route::get('/test', function() //Rutas directas
{
            return View::make('general.index');  
});
Route::get('/herramientas', function() //Rutas directas
{
            return View::make('general.herramientas');    
});
Route::get('/tools', function() //Rutas directas
{
            return View::make('general.tools1');
            //return View::make('general.tools'); 
});

Route::get('/typep', function() //Rutas directas
{
    //return "Hello world";
    return View::make('general.typep');
});
Route::get('/typep_en', function() //Rutas directas
{
    //return "Hello world";
    return View::make('general.typep_en');
});
Route::get('/estadisticas', function() //Rutas directas
{
            return View::make('general.estadisticas');    
});
Route::get('/statistics', function() //Rutas directas
{
            return View::make('general.statistics');    
});

Route::get('/traductor', function() {
    return View::make('general.traductor');
});

Route::get('/ayuda', function() //Rutas directas
{
            return View::make('general.ayuda');   
});
Route::get('/help', function() //Rutas directas
{
            return View::make('general.help');   
});
Route::get('/error', function() //Rutas directas
{
            return View::make('general.error');   
});


Route::post('/login', function() 
{
    $usuario = Input::get('usuario');
    $password = Input::get('password');
    if (Auth::attempt(['usuario' => $usuario, 'password' => $password])) {
        return Redirect::to("/Admin");
    }
    else {
        return Redirect::to("/login")->with('mensaje','¡Usuario o contraseña invalidos!.');
    }    
});

Route::get('/login', function() 
{   
        return View::make('general.login');  
});

Route::get('/filter_pep', function() //Rutas directas
{
    $sequences_directory = "assets/sequences/";
    $filename = "BD_FINAL.fasta";
    $fh = fopen('assets/sequences/BD_FINAL.fasta', 'r');
    if (filesize($filename) == 0) { //check if file is empty or not
        echo "Input file is empty!";
    }
    else {

        $i= 0 ;
        $sequences = array();
        while($line = fgets($fh)){
            $i++;
            if($i%2==1){
            $sequence['header'] = $line;
            }
            else{
            $sequence['sequence'] = $line;
            array_push($sequences, $sequence);
            }
        }
        
        return View::make('filterPep.filter_pep')->with("sequences", $sequences);
    }
    
    //return View::make('general.filter_pep');
});
Route::get('/filter_pep_en', function() //Rutas directas
{
    $sequences_directory = "assets/sequences/";
    $filename = "BD_FINAL.fasta";
    $fh = fopen('assets/sequences/BD_FINAL.fasta', 'r');
    if (filesize($filename) == 0) { //check if file is empty or not
        echo "Input file is empty!";
    }
    else {

        $i= 0 ;
        $sequences = array();
        while($line = fgets($fh)){
            $i++;
            if($i%2==1){
            $sequence['header'] = $line;
            }
            else{
            $sequence['sequence'] = $line;
            array_push($sequences, $sequence);
            }
        }
        
        return View::make('filterPep.filter_pep_en')->with("sequences", $sequences);
    }
});


Route::controller('Peptido', 'PeptidoController');
//Route::controller('filter_pep', 'FastaReaderController@getSequence');
Route::group(array('before'=>'auth'),function(){
Route::controller('Admin', 'AdminController');
});
