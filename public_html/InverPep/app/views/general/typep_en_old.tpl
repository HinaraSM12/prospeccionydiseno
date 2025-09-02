{include file= "../masterPage/templateResponsive.tpl"}
{include file= "../layouts/inc/header1.tpl"}

<main class="detalle">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="csc-default">
                <div class="logo">
                    <img alt="InverPep" src="{URL::to('/')}/assets/img/logo1.png" width="925" height="110" title="Inverpep"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="csc-header csc-header-n1 col-xs-12">
            <h2 p align="center" style="margin-top:0"> TYPE-PEPTIDE </p></h2>
        </div>

        <div id= "inicio" class="info_typ col-md-3 hidden-sm hidden-xs" style="overflow-y: scroll;">
            <!-- INICIO DE SECCION DE CONTROL -->
            <div class="well">
                <!-- INICIO SECCION DE BLOQUEO -->
                <div>
                    <span style="font-size: 1.3em"><strong> Camara </strong></span>
                    <div id="mode-group" class="btn-group pull-right"
                            data-toggle="buttons" style="margin-bottom: 20px;">

                        <label class="btn btn-default" onclick="lookCamara()">
                          <input type="radio" name="mode" id="look">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </label>

                        <label class="btn btn-default active" onclick="unlookCamara()">
                          <input type="radio" name="mode" id="unlook">
                            <i class="fa fa-unlock" aria-hidden="true"></i>
                        </label>

                    </div>
                </div>
                <!-- FINAL SECCION DE BLOQUEO -->

                <!-- INICIO SECCION DE ESCOJER CAMARA -->
                <div id="mode-group" class="btn-group btn-group-justified"
                        data-toggle="buttons" style="margin-bottom: 10px;">

                    <label class="btn btn-default" onclick="getCamara1()">
                      <input type="radio" name="mode" id="look"> Center
                    </label>

                </div>
                <!-- FIN SECCION DE ESCOJER CAMARA -->

                <!-- INICIO SECCION DE GIRO -->
                <!--
                <div>
                    <span style="font-size: 1.3em"><strong> Giro </strong></span>

                    <div id="mode-group" class="btn-group pull-right"
                            data-toggle="buttons">
                        <label class="btn btn-default">
                          <input type="radio" name="mode" id="look">
                            <i class="fa fa-undo" aria-hidden="true"></i>
                        </label>

                        <label class="btn btn-default">
                          <input type="radio" name="mode" id="look">
                            <i class="fa fa-ban" aria-hidden="true"></i>
                        </label>

                        <label class="btn btn-default">
                          <input type="radio" name="mode" id="look">
                            <i class="fa fa-repeat" aria-hidden="true"></i>
                        </label>
                    </div>
                </div>
                -->
                <!-- FINAL SECCION DE GIRO -->
            </div>
            <!-- FIN DE SECCION DE CONTROL -->

             <!-- INICIO DE LA TABLA DE INFORMACION -->
            <div class="well">
            <table class="table table-responsive table-striped">

                <!-- Cabecera de la tabla -->
                <thead>
                    <tr>
                        <th>Propiedad</th>
                        <th>Valor</th>
                    </tr>
                </thead>

                <!-- Cuerpo de la tabla -->
                <tbody>
                    <tr>
                        <th>Carga Neta a pH Neutro</th>
                        <th id=charge_th></th>
                    </tr>
                    <tr>
                        <th>Punto Isoeléctrico</th>
                        <th id=isoelectricPoint_th></th>
                    </tr>
                    <tr>
                        <th>% de aminoácidos hidrofóbicos</th>
                        <th id=hidrofobic_th></th>
                    </tr>
                    <tr>
                        <th>Indice de Boman</th>
                        <th id=boman_th></th>
                    </tr>
                    <tr>
                        <th>Momento Hidrofobico Relativo</th>
                        <th id=momem_th></th>
                    </tr>
                </tbody>
            </table>
            </div>
            <!-- FIN DE LA TABLA DE INFORMACION -->


        </div>


        <!-- INICIO CANVAS -->
        <div id="canvas" class="graph_typ col-sm-12 col-md-9">
            <canvas id="myCanvas"
                    style="border:1px solid #000000; position: relative;">
            </canvas>
    	</div>
        <!-- FIN CANVAS -->

    </div>

    <div class="row" style="margin-top: 20px;">
        <!-- INICIO DEL INPUT -->
        <div class="input_typ col-sm-11 col-md-11">
            <form class="" action="#">
                <div class="form-group">
                    <div class="input-field">
                            <input id="aminoacid"
                                    class="form-control"
                                    type="text"
                                    style="text-transform:uppercase"
                                    maxlength='200'
                                    onkeypress="return validateEntry(event)" placeholder="Escribir aquí aminoácido"
                                    onkeyup='draw("{URL::to('/')}")'>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-sm-1 col-md-1">
            <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">
              <i class="fa fa-question" aria-hidden="true"></i>
            </button>

            <!-- INICIO MODAL DE INFORMACION-->
            <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Type Peptide</h4>
                  </div>
                  <div class="modal-body">
                    <p>Instrucciones en construcción</p>
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!-- FIN MODAL DE INFORMACION -->
        </div>
        <!-- FIN DEL INPUT -->
    </div>

    <div class="row">
        <!-- INICIO DE LA TABLA DE INFORMACION -->
        <div class="info_typ col-md-3 visible-sm visible-xs">
            <table class="table table-responsive table-striped">

                <!-- Cabecera de la tabla -->
                <thead>
                    <tr>
                        <th>Property</th>
                        <th>Value</th>
                    </tr>
                </thead>

                <!-- Cuerpo de la tabla -->
                <tbody>
                    <tr>
                        <th>Carga Neta a pH Neutro</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>Punto Isoeléctrico</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>% de aminoácidos hidrofóbicos</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>Indice de Boman</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>Momento Hidrofobico Relativo</th>
                        <th></th>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- FIN DE LA TABLA DE INFORMACION -->
    </div>

</main>

{include file= "../layouts/inc/footer.tpl"}

<script src="{URL::to('/')}/assets/js/three.min.js" language="Javascript"></script>
<script src="{URL::to('/')}/assets/js/controls/TrackballControls.js" language="Javascript"></script>
<script src="{URL::to('/')}/assets/js/Detector.js"></script>
<script src="{URL::to('/')}/assets/js/main.js"></script>

<script>

    $("#canvas").height(window.innerHeight*0.79);
    $("#myCanvas").height("100%");
    $("#myCanvas").width("100%");

    var scene;
    var container;
    var renderer;
    var camera;
    var controls;
    var raycaster;
    var mouse;

    var ambientLight, spotLight, spotLight2;
    var line;

    var INTERSECTED;
    var radius;
    var thetha;

    var positive_aminoacids, negative_aminoacids;
    var element_list;
    var sphere_list, sprite_list, aminoacids_list, chain_list;

    //Test Color
    //var canvas_background_color = 0xff0fff;
    //Production Color
    var canvas_background_color = 0x000000;
    var canvas_background_alpha = 0;
    var canvasDom = document.getElementById("myCanvas");

    var rendererWidth;
    var rendererHeight;

    var draw_counter = 0;
    var textures = loadTextures("{URL::to('/')}/assets/img/images/");

    init();
    animate();

    function init(){

        var geometry = new THREE.BoxBufferGeometry( 200, 200, 200 );

        hola = new THREE.MeshLambertMaterial();
        hola.color = new THREE.Color(0xE6E2AF);

        mesh = new THREE.Mesh(geometry, hola);
        mesh.position = (0,0,0);

        //Scene
        scene = new THREE.Scene();

        //Camera
        //Aspect ratio (second parameter) = width/height
        camera = new THREE.PerspectiveCamera(45, $("#myCanvas").width() / $("#myCanvas").height(), 1, 500);
        camera.position.set(0,0,50);

        //Renderer
        var renderer_parameters = new Object()
        renderer_parameters.canvas = canvasDom;
        renderer_parameters.alpha = true;

        renderer = new THREE.WebGLRenderer(renderer_parameters);

        renderer.domElement = canvasDom;
        renderer.setSize($("#myCanvas").width(), $("#myCanvas").height());
        renderer.setClearColor (canvas_background_color, canvas_background_alpha);

        container = document.getElementById( 'canvas' );

        //Controls
        controls = new THREE.TrackballControls(camera, container);
        controls.rotateSpeed = 1.0;
        controls.zoomSpeed = 1.2;
        controls.panSpeed = 0.8;
        controls.noZoom = false;
        controls.noPan = false;
        controls.staticMoving = true;
        controls.dynamicDampingFactor = 0.3;
        controls.keys = [ 65, 83, 68 ];

        //Lights
        ambientLight = new THREE.AmbientLight(0x404040);

        spotLight = new THREE.SpotLight(0xffffff);
        spotLight.position.set(1000, 1000, 1000 );
        spotLight.castShadow = false;
        spotLight.intensity = 1.2

        spotLight2 = new THREE.SpotLight(0xffffff);
        spotLight2.position.set(-1000, -1000, -1000 );
        spotLight2.castShadow = false;
        spotLight2.intensity = 0.8

        scene.add(ambientLight);
        scene.add(spotLight);
        scene.add(spotLight2);
        //scene.add( mesh );
        //Custom
        radius = 10;
        theta = 0;

        positive_aminoacids = new Array('K', 'R', 'H');
        negative_aminoacids = new Array('D','E');

        sphere_list = new Array();
        sprite_list = new Array();
        chain_list = new Array();
        element_list = new Array();

        aminoacids_list = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y'];

        raycaster = new THREE.Raycaster();
        mouse = new THREE.Vector2();

        //Events
        container.addEventListener( 'click', onDocumentMouseDown, false );
        container.addEventListener( 'touchstart', onDocumentTouchStart, false );
        container.addEventListener( 'mousemove', onDocumentMouseMove, false );
        window.addEventListener( 'resize', onWindowResize, false );
    }

    function animate(){
        setTimeout( function() {
            requestAnimationFrame( animate );
            controls.update();
        }, 1000 / 70 );
        render();
        update();
    }

    function render() {
        renderer.render( scene, camera );
    }

    function update(){
        controls.update();
    }

    function onDocumentTouchStart( event ){
        event.preventDefault();
        event.clientX = event.touches[0].clientX;
        event.clientY = event.touches[0].clientY;
        onDocumentMouseDown( event );
    }

    function onDocumentMouseDown( event ) {

        event.preventDefault();
      	scrollToCanvas();

	      var mousePos = getMousePos(container, event);

	      mouse.x = ( mousePos.x /  $("#myCanvas").width()) * 2 - 1;
	    	mouse.y = -( mousePos.y /  $("#myCanvas").height()) * 2 + 1;

        raycaster.setFromCamera( mouse, camera );
        var intersects = raycaster.intersectObjects(sphere_list);

        if ( intersects.length > 0 ){
            INTERSECTED = intersects[ 0 ].object;
            if (!INTERSECTED.has_spritey){
                spriteMaterial = textures[INTERSECTED.amino];
                var sprite = new THREE.Sprite(spriteMaterial);
                sprite.scale.set(10,10,1);
                i = INTERSECTED.i_position;
                sprite.position.set(get_x(i,pos_off=1), get_y(i,pos_off=1), i*2);
                sprite.unic = i;
                scene.add(sprite);
                chain_list.push(sprite);

                elementProperties = new Object();
                elementProperties.sprite = sprite;
                elementProperties.amino = INTERSECTED.amino;
                elementProperties.i = i;

                element_list.push(elementProperties);
                INTERSECTED.has_spritey = true;
            }else if (INTERSECTED.has_spritey){
                for (var j=0; j < chain_list.length; j++){
                    if (chain_list[j].unic === INTERSECTED.i_position){
                        for(var k=0; k < element_list.length; k++){
                            if(element_list[k].sprite === chain_list[j]){
                                element_list.splice(k,1);
                            }
                        }
                        scene.remove(chain_list[j]);
                        chain_list.splice(j,1);
                        INTERSECTED.has_spritey = false;
                    }
                }
            }
        }
    }

    function onDocumentMouseMove(event){

      var mousePos = getMousePos(container, event);

      mouse.x = ( mousePos.x /  $("#myCanvas").width()) * 2 - 1;
    	mouse.y = -( mousePos.y /  $("#myCanvas").height()) * 2 + 1;

    }

    function getMousePos(canvas, evt) {
      var rect = canvas.getBoundingClientRect();

      respuesta = new Object();
      respuesta.x = evt.clientX - rect.left;
      respuesta.y = evt.clientY - rect.top;

      return respuesta;
    }

    function onWindowResize(){
        $("#canvas").height(window.innerHeight*0.8);
        $("#myCanvas").height("100%");
        $("#myCanvas").width("100%");
        camera.aspect = $("#myCanvas").width() / $("#myCanvas").height() ;
        camera.updateProjectionMatrix();
        controls.target = new THREE.Vector3(0,0,0);
        renderer.setSize($("#myCanvas").width(), $("#myCanvas").height()) ;
        controls.update();
    }

    function draw(url){
        var aminoacids = document.getElementById("aminoacid").value;
        var geometry_sphere;
        geometry_sphere = new THREE.SphereGeometry( 2, 32, 32);
        aminoacids = aminoacids.toUpperCase();

        scene.remove(line);

        while(sphere_list.length > 0){
            scene.remove(sphere_list.pop());
        }

        while(sprite_list.length > 0){
            scene.remove(sprite_list.pop());
        }

        clean_chain_list(scene, chain_list);

        var geometry = new THREE.Geometry();

        var material = new THREE.LineBasicMaterial({
            color: 0x000000
        });

        for (i=0 ; i<aminoacids.length; i++){

            geometry.vertices.push(new THREE.Vector3(get_x(i), get_y(i), 2*i));

            var sphere_meshMaterial;
            var sphere;
            var backgroundColor_sprite;
            var border_sprite;

			var materialProperties = new Object();
			var color_used = get_color_by_aminoacid(aminoacids.charAt(i));

            materialProperties.color = color_used;
            var sphere_meshMaterial = new THREE.MeshLambertMaterial(materialProperties);
            var sphere = new THREE.Mesh( geometry_sphere, sphere_meshMaterial );

            var bkgroundProperties = new Object();
            bkgroundProperties.r = hexToR(color_used);
            bkgroundProperties.g = hexToG(color_used);
            bkgroundProperties.b = hexToB(color_used);
            bkgroundProperties.a = 0.6;
            backgroundColor_sprite = (bkgroundProperties);

            var borderProperties = new Object();
            borderProperties.r = hexToR(color_used);
            borderProperties.g = hexToG(color_used);
            borderProperties.b = hexToB(color_used);
            borderProperties.a = 1;
            border_sprite = (borderProperties);

            var spritey = makeTextSprite( " " + aminoacids.charAt(i) + " ",
                ({ fontsize: 24, borderColor: border_sprite, backgroundColor: backgroundColor_sprite }) );

            sprite_list.push(spritey)
            spritey.position.set(get_x(i), get_y(i), 2*i);
            scene.add( spritey );

            sphere.has_spritey = false;
            sphere.i_position = i;
            sphere.amino = aminoacids.charAt(i);

            sphere_list.push(sphere);
            sphere.position.set(get_x(i), get_y(i), 2*i);
            scene.add(sphere);
        }

        line = new THREE.Line(geometry, material);
        scene.add(line);

        if(aminoacids){
            $("#cavas_info").hide(1000);
        } else {
            $("#cavas_info").show(1000);
        }

    }

	function get_color_by_aminoacid(amino){
		var color;

		if(amino == "P")
			color="#19FC01"; //Verde
		else if(amino == "H")
			color="#AED9E4"; //Azul Palido
		else if(amino == "T" || amino == "S" || amino == "Q" || amino == "N")
			color="#A417F4";
		else if(amino == "D" || amino == "E")
			color = "#FE0001";
		else if(amino == "R" || amino == "K")
			color = "#04007F";
		else
			color = "#FFFD01";

		return color;
	}

</script>

<script>

	function scrollToCanvas(){

		$('html, body').animate({
			scrollTop: $("#inicio").offset().top
		}, 800);

        //$("#aminoacid").focus();
	}

	var delay = (function(){
		var timer = 0;
		return function(callback, ms){
			clearTimeout (timer);
			timer = setTimeout(callback, ms);
		};
	})();

	$('#aminoacid').keyup(function() {
			delay(function(){
				if ($('#aminoacid').val()){
					$("#charge_th").html(getCharge($("#aminoacid").val().toUpperCase()));
					$("#isoelectricPoint_th").html(getIsoEle($("#aminoacid").val().toUpperCase()));
					$("#hidrofobic_th").html(getHidrof($("#aminoacid").val().toUpperCase()));
					$("#boman_th").html(getBoman($("#aminoacid").val().toUpperCase()));
					$("#momem_th").html(getMoment($("#aminoacid").val().toUpperCase()));
				} else {
					$("#charge_th").html(0);
					$("#isoelectricPoint_th").html(0);
					$("#hidrofobic_th").html(0);
					$("#boman_th").html(0);
					$("#momem_th").html(0);
				}

			}, 1000 );
	});

</script>

<script src="https://threejs.org/examples/js/libs/tween.min.js"></script>

<script>
    function clean_chain_list(scene, chain_list){

        for(var i=0; i < chain_list.length; i++ ){
            chain_list[i].material.transparent = true;
            var tweenoff_properties = new Object()
            tweenoff_properties.opacity = 0;

            var tweenoff = new TWEEN.Tween(chain_list[i].material).to(tweenoff_properties, 200);


        }


        while(chain_list.length > 0){
            scene.remove(chain_list.pop());
        }

    }
</script>

<!-- Camara control functions -->
<script>

    function unlookCamara(){
        if(controls.noPan){
            controls.noPan = false;
        }

        if(controls.noRotate){
            controls.noRotate = false;
        }
    }

    function lookCamara(){
        if(!controls.noPan){
            controls.noPan = true;
        }

        if(!controls.noRotate){
            controls.noRotate = true;
        }

    }

    function getCamara1(){
        if (typeof sprite_list !== 'undefined') {

            camera.position.x = 0;
            camera.position.y = 0;
            camera.position.z = sprite_list.length*2 + 30;

            controls.target = new THREE.Vector3(0,0,0);;
        }
    }

</script>
