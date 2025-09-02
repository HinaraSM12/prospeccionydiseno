{include file= "../masterPage/template.tpl"}
{include file= "../layouts/inc/header_typep.tpl"}

<main class="detalle">
  <div class="row">
    <div class="csc-header csc-header-n1 col-xs-12">
      <h2 p align="center" style="margin-top:0"> TYPE-PEPTIDE </p></h2>
    </div>
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
                                onkeypress="return validateEntry(event);"
                                placeholder="Escribir aquí secuencia"
                                onkeyup='draw()'>
                        <span id="typePrompt"></span>
                </div>
            </div>
        </form>
    </div>

    <div class="col-sm-1 col-md-1">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
          <i class="fa fa-question" aria-hidden="true"></i>
        </button>
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
          <div id="mode-group" class="btn-group btn-group-justified" data-toggle="buttons" style="margin-bottom: 10px;">
            <label class="btn btn-default" onclick="getCamara1()">
              <input type="radio" name="mode" id="look"> Centrar
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
                <th>No. AAs</th>
                <th class="noaa_th"></th>
            </tr>
              <tr>
                  <th>Carga Neta a pH Neutro</th>
                  <th class="charge_th"></th>
              </tr>
              <tr>
                  <th>Punto Isoeléctrico</th>
                  <th class="isoelectricPoint_th"></th>
              </tr>
              <tr>
                  <th>% de aminoácidos hidrofóbicos</th>
                  <th class="hidrofobic_th"></th>
              </tr>
              <tr>
                  <th>Indice de Boman</th>
                  <th class="boman_th"></th>
              </tr>
              <tr>
                  <th>Momento Hidrofobico Relativo</th>
                  <th class="momem_th"></th>
              </tr>
              <tr>
                  <th>Indice de Wimley White</th>
                  <th class="wimley_th"></th>
              </tr>
          </tbody>
      </table>
      </div>
      <!-- FIN DE LA TABLA DE INFORMACION -->
    </div>

    <!-- INICIO CANVAS -->
    <div id="canvas" class="graph_typ col-sm-12 col-md-9">
      <canvas id="myCanvas" style="border:1px solid #a0a0a0; position: relative;">
      </canvas>
    </div>
    <!-- FIN CANVAS -->
  </div>

  <div class="row" style="margin-top: 20px;">

      <div class="col-sm-1 col-md-1">


          <!-- INICIO MODAL DE INFORMACION-->
          <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title">Type Peptide</h4>
                </div>
                <div class="modal-body">
                  <p>
                    <strong>Type Peptide</strong> es una herramienta pedagógica para el diseño y optimización péptidos
                    antimicrobianos basados en sus propiedades fisicoquímicas.
                  </p>
                  <p>
                    La aplicación ha sido desarrollada por la línea de interacciones moleculares del grupo Biología Funcional , asociado a la Facultad de Ciencias de la Universidad Nacional de Colombia – Sede Medellín
                  </p>
                  <p>
                    A partir de una cadena de aminoácidos , la aplicación calcula algunas de sus propiedades fisicoquímicas
                    y genera una representación gráfica de una α-hélice teórica.
                  </p>
                  <hr>
                  <h3>Como usarla</h3>
                  <p>
                    La aplicacion esta compuesta por 3 secciones:
                  </p>
                  <hr>
                  <h4>1. Ingreso de datos:</h4>
                  <p>Ubicada en la parte inferior, <strong>para iniciar a utilizar la aplicacion</strong>, ingrese
                    caracteres en el espacio con la etiqueta "Escribir aqui aminoacido". Solo se reciben caracteres que
                    correspondan al código de una letra de los 20 aminoácidos más comunes
                  </p>
                  <hr>
                  <h4>2. Representación grafica:</h4>
                  <p>Ubicada en la parte derecha, en la cual se muestra la cadena peptídica ingresada en la seccion
                     Ingreso de datos como una α hélice.
                     <br>
                     Para <strong>ver la cadena lateral de un aminoacido</strong> en particular y su posición relativa
                     dar click sobre el, si se da otro click la informacion se oculta denuevo.
                     <br>
                     Para <strong>manejar la camara</strong> utilice el click izquierdo o derecho, y luego arrastre para
                     mover el angulo de vista o el plano respectivamente.
                  </p>
                  <hr>
                  <h4>3. Informacion:</h4>
                  <p>
                    Se calculan algunas características del péptido ingresado en la sección de entrada de datos.
                  </p>
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
                      <th class="charge_th"></th>
                  </tr>
                  <tr>
                      <th>Punto Isoeléctrico</th>
                      <th class="isoelectricPoint_th"></th>
                  </tr>
                  <tr>
                      <th>% de aminoácidos hidrofóbicos</th>
                      <th class="hidrofobic_th"></th>
                  </tr>
                  <tr>
                      <th>Indice de Boman</th>
                      <th class="boman_th"></th>
                  </tr>
                  <tr>
                      <th>Momento Hidrofobico Relativo</th>
                      <th class="momem_th"></th>
                  </tr>
                  <tr>
                      <th>Indice de Wimley White</th>
                      <th class="wimley_th"></th>
                  </tr>
              </tbody>
          </table>
      </div>
      <!-- FIN DE LA TABLA DE INFORMACION -->
  </div>

</main>

{include file= "../layouts/inc/footer.tpl"}

<script src="{URL::to('/')}/assets/js/three.js" language="Javascript"></script>
<script src="{URL::to('/')}/assets/js/controls/TrackballControls.js" language="Javascript"></script>
<script src="{URL::to('/')}/assets/js/Detector.js"></script>
<script src="{URL::to('/')}/assets/js/main.js"></script>
<script src="{URL::to('/')}/assets/js/typep.js"></script>
<script src="{URL::to('/')}/assets/js/colorHandler.js"></script>

<script>

  $("#canvas").height(window.innerHeight*0.79);
  $("#myCanvas").height("100%");
  $("#myCanvas").width("100%");

  var scene, renderer, camera, controls;
  var mouse, raycaster, INTERSECTED;

  var ambientLight, spotLight, spotLight2;
  var line;

  var positive_aminoacids, negative_aminoacids;

  // List of elements, there are spheres and sprites in the graph
  // var sphereList, groupList, sprite_list, chain_list, names_list;
  var sphereList, groupList;

  var textures = loadTextures("{URL::to('/')}/assets/img/images/");

  init();
  animate();

  function init(){
    // Scene
    scene = new THREE.Scene();

    // Camera
    // Camera Aspect Ratio
    let AspectRatio = $("#myCanvas").width() / $("#myCanvas").height();
    camera = new THREE.PerspectiveCamera(45, AspectRatio, 1, 500);
    camera.position.set(0,0,50);
    scene.add(camera);

    //Renderer
    const canvasDom = document.getElementById("myCanvas");
    renderer = new THREE.WebGLRenderer({ canvas: canvasDom, alpha: true, domElement: canvasDom} );
    renderer.setSize($("#myCanvas").width(), $("#myCanvas").height());
    renderer.setClearAlpha (0.1);

    container = document.getElementById( 'canvas' );

    // Controls
    controls = new THREE.TrackballControls(camera, container);
    controls.rotateSpeed = 1.0;
    controls.zoomSpeed = 1.2;
    controls.panSpeed = 0.8;
    controls.noZoom = false;
    controls.noPan = false;
    controls.staticMoving = true;
    controls.dynamicDampingFactor = 0.3;
    controls.keys = [ 65, 83, 68 ];

    // Lights
    ambientLight = new THREE.AmbientLight(0x404040, 1);

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

    sphereList = new Array();
    sprite_list = new Array();
    chain_list = new Array();
    names_list = new Array();
    groupList = new Array();

    raycaster = new THREE.Raycaster();
    mouse = new THREE.Vector2();

    // Events
    container.addEventListener( 'click', onDocumentMouseDown, false );
    // container.addEventListener( 'mousemove', onDocumentMouseMove, false );
    window.addEventListener( 'resize', onWindowResize, false );
  }

  function animate() {
    setTimeout( function() {
      requestAnimationFrame( animate );
      controls.update();
    }, 1000 / 70 );
    render();
  }

  function render() {
    renderer.render( scene, camera );
  }

  function onDocumentMouseDown( event ) {
      // event.preventDefault();
    	scrollToCanvas();

      // The position of mouse inside the canvas element
      var mousePos = getMousePos(container, event);

      // Position conversion to raicaster element
      mouse.x = ( mousePos.x /  $("#myCanvas").width()) * 2 - 1 - 0.04;
      mouse.y = -( mousePos.y /  $("#myCanvas").height()) * 2 + 1;
      // *****************************

      // Ray with all elements in scene under the mouse at a given camera angle
      raycaster.setFromCamera( mouse, camera );

      // Select the elements which are spheres
      var intersects = raycaster.intersectObjects(sphereList);

      // If there are objects being clicked
      if ( intersects.length > 0 ){
          // Select the object which is in front of the click
          INTERSECTED = intersects[0].object;

          console.log(INTERSECTED.parent.children[2].visible);
          // Change visible value of intersect
          // INTERSECTED.group.aminoLetter.material.visible.changeValue()
          // INTERSECTED.group.aminoLetter.material.visible.changeValue()
          if (INTERSECTED.parent.children[2].visible){
            INTERSECTED.parent.children[2].visible = false;
            INTERSECTED.parent.children[3].visible = false;
          } else {
            INTERSECTED.parent.children[2].visible = true;
            INTERSECTED.parent.children[3].visible = true;
          }

      }

  }

  function getMousePos(canvas, evt) {
    var rect = canvas.getBoundingClientRect();

    respuesta = { x: evt.clientX - rect.left, y: evt.clientY - rect.top };

    return respuesta;
  }

  function onWindowResize(){
      $("#myCanvas").height("100%");
      $("#myCanvas").width("100%");
      camera.aspect = $("#myCanvas").width() / $("#myCanvas").height() ;
      camera.updateProjectionMatrix();
      controls.target = new THREE.Vector3(0,0,0);
      renderer.setSize($("#myCanvas").width(), $("#myCanvas").height()) ;
      controls.update();
  }

  function draw(){

    var aminoacids = document.getElementById("aminoacid").value.toUpperCase();

    scene.remove(line);

    var geometryLine = new THREE.Geometry();
    var materialLine = new THREE.LineBasicMaterial({ color: 0x000000 });

    for (i  =0 ; i < aminoacids.length; i++){
      // Setting a new vertice for the line joining the Spheres
      geometryLine.vertices.push(new THREE.Vector3(get_x(i), get_y(i), 2*i));

      // If the aminoacid has more character than the groupList
      if (typeof groupList[i] === 'undefined') {
        // Make group
        var aminoGroup = new THREE.Group();
        aminoGroup = makeGroup(aminoacids.charAt(i), i);
        scene.add(aminoGroup);
        groupList[i] = aminoGroup;
      }
      // If there is a character different in the position
      else if (!(groupList[i].letter === aminoacids.charAt(i))) {
        console.log("In amino: " + aminoacids[i]);
        var aminoGroup = new THREE.Group();
        aminoGroup = makeGroup(aminoacids.charAt(i), i);
        scene.remove(groupList[i]);
        sphereList.splice(sphereList.indexOf(groupList[i].children[0]), 1);
        scene.add(aminoGroup);
        groupList[i] = aminoGroup;
      }
    }

    // If the aminoacid has few letters than the groupList
    if (aminoacids.length < groupList.length){
      // index = aminoacids.length -1
      // for(index; index < groupList.length; index++){
      //   scene.remove(groupList[index])
      // }
      // errase groupList members removed from groupList array

      // Remove all groups who are beyond the last letter of the aminoacid
      var index = aminoacids.length;
      for (j = index; j < groupList.length; j++){
        scene.remove(groupList[j]);
        sphereList.splice(sphereList.indexOf(groupList[j].children[0]), 1);
      }

      // Remove groups from the groupList who are beyond the last letter
      groupList.splice(index, groupList.length - aminoacids.length)
    }

    line = new THREE.Line(geometryLine, materialLine);
    scene.add(line);

  }

  function makeGroup(aminoLetter, peptidePosition, ){
    // Color for letter and sphere
    var sphereColor = aminosColor[aminoLetter];

    // Side chain
    var sideChainTexture = textures[aminoLetter];
    var sideChainImage = new THREE.Sprite(sideChainTexture);
    sideChainImage.scale.set(10,10,1);
    sideChainImage.position.set(get_x(peptidePosition,pos_off=1), get_y(peptidePosition,pos_off=1), peptidePosition*2);
    sideChainImage.visible = false;

    // Amino name
    var aminoName = makeTextSprite( " " + (peptidePosition+1) +": " + aminosFullName[aminoLetter] + " ",
        ({ fontsize: 24, backgroundColor: transparentColor, borderColor: transparentColor }) );
    aminoName.position.set(get_x(peptidePosition,pos_off=1.5), get_y(peptidePosition, neg_off=0.5), peptidePosition*2);
    aminoName.visible = false;

    // Amino letter
    var aminoGraphLetter = makeTextSprite( " " + aminoLetter + " ",
          ({ fontsize: 24, borderColor: getRGBColor(sphereColor, alpha=1),
              backgroundColor: getRGBColor(sphereColor, alpha=0.2) }) );
    aminoGraphLetter.position.set(get_x(peptidePosition), get_y(peptidePosition), 2*peptidePosition);


    // Amino sphere
    var aminoSphereMaterial = new THREE.MeshLambertMaterial({ color: sphereColor});
    var aminoSphereGeometry = new THREE.SphereGeometry( getRadioAmino(aminoLetter), 32, 32);
    var aminoSphere = new THREE.Mesh( aminoSphereGeometry, aminoSphereMaterial );
    aminoSphere.position.set(get_x(peptidePosition), get_y(peptidePosition), 2*peptidePosition);
    aminoSphere.peptidePosition = peptidePosition;
    sphereList.push(aminoSphere);

    var group = new THREE.Group();
    group.add(aminoSphere);
    group.add(aminoGraphLetter);
    group.add(sideChainImage);
    group.add(aminoName);

    group.letter = aminoLetter;
    group.position = peptidePosition;
    return group;
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
          $(".noaa_th").html($("#aminoacid").val().length);
					$(".charge_th").html(getCharge($("#aminoacid").val().toUpperCase()));
					$(".isoelectricPoint_th").html(getIsoEle($("#aminoacid").val().toUpperCase()));
					$(".hidrofobic_th").html(getHidrof($("#aminoacid").val().toUpperCase()));
					$(".boman_th").html(getBoman($("#aminoacid").val().toUpperCase()));
					$(".momem_th").html(getMoment($("#aminoacid").val().toUpperCase()));
          $(".wimley_th").html(getWimley($("#aminoacid").val().toUpperCase()));
				} else {
					$(".charge_th").html(0);
					$(".isoelectricPoint_th").html(0);
					$(".hidrofobic_th").html(0);
					$(".boman_th").html(0);
					$(".momem_th").html(0);
        	$(".wimley_th").html(0);
				}

			}, 1000 );
	});

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

<!-- Information scripts-->
<script>

</script>
