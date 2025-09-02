aminoacids_list = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y'];
aminosFullName = {
  'A': 'Alaline',
  'R': 'Arginine',
  'N': 'Asparagine',
  'D': 'Aspartic',
  'C': 'Cysteine',
  'Q': 'Glutamine',
  'E': 'Glutamic Acid',
  'G': 'Glycine',
  'H': 'Histidine',
  'I': 'Isoleucine',
  'L': 'Leucine',
  'K': 'Lysine',
  'M': 'Methionine',
  'F': 'Phenylalanine',
  'P': 'Proline',
  'S': 'Serine',
  'T': 'Threonine',
  'W': 'Tryptophan',
  'Y': 'Tyrosine',
  'V': 'Valine'
}

function toRadians (angle) {
	return angle * (Math.PI / 180);
}

function get_x(i, pos_off = 0, neg_off = 0){
  var radius = 10;
  radius = radius + radius * (pos_off - neg_off);
  value = Math.cos(toRadians(100*i)) * radius;
  return  value;
}

function get_y(i, pos_off = 0, neg_off = 0){
  var radius = 10;
  radius = radius + radius * (pos_off - neg_off);
  value = Math.sin(toRadians(100*i)) * radius;
  return value;
}

function validateEntry(event){
  var chart = event.key.toUpperCase();
  var key = event.keyCode || event.charCode;
  if( key == 8 || key == 46 )
    return true;
  if(aminoacids_list.indexOf(chart) != -1){
    return true;
  } else {
    return false;
  }
}

function makeTextSprite( message, parameters ){
  if ( parameters === undefined ) parameters = {};

  var fontface = parameters.hasOwnProperty("fontface") ?
    parameters["fontface"] : "Arial";

  var fontsize = parameters.hasOwnProperty("fontsize") ?
    parameters["fontsize"] : 18;

  var borderThickness = parameters.hasOwnProperty("borderThickness") ?
    parameters["borderThickness"] : 4;

  var borderColor = parameters.hasOwnProperty("borderColor") ?
    parameters["borderColor"] : { r:0, g:0, b:0, a:1.0 };

  var backgroundColor = parameters.hasOwnProperty("backgroundColor") ?
    parameters["backgroundColor"] : { r:255, g:255, b:255, a:1.0 };

  //var spriteAlignment = THREE.SpriteAlignment.topLeft;

  var canvas = document.createElement('canvas');
  var context = canvas.getContext('2d');
  context.font = "Bold " + fontsize + "px " + fontface;

  // get size data (height depends only on font size)
  var metrics = context.measureText( message );
  var textWidth = metrics.width;

  // background color
  context.fillStyle   = "rgba(" + backgroundColor.r + "," + backgroundColor.g + ","
                  + backgroundColor.b + "," + backgroundColor.a + ")";
  // border color
  context.strokeStyle = "rgba(" + borderColor.r + "," + borderColor.g + ","
                  + borderColor.b + "," + borderColor.a + ")";

  context.lineWidth = borderThickness;
  roundRect(context, borderThickness/2, borderThickness/2, textWidth + borderThickness, fontsize * 1.4 + borderThickness, 6);
  // 1.4 is extra height factor for text below baseline: g,j,p,q.

  // text color
  context.fillStyle = "rgba(0, 0, 0, 1.0)";

  context.fillText( message, borderThickness, fontsize + borderThickness);

  // canvas contents will be used for a texture
  var texture = new THREE.Texture(canvas);
  texture.minFilter = THREE.LinearFilter;
  texture.needsUpdate = true;

  var spriteMaterial = new THREE.SpriteMaterial(
    { map: texture } );
  var sprite = new THREE.Sprite( spriteMaterial );
  sprite.scale.set(10,5,.10);
  return sprite;
}

function roundRect(ctx, x, y, w, h, r) {
	ctx.beginPath();
	ctx.moveTo(x + r, y);
	ctx.lineTo(x + w - r, y);
	ctx.quadraticCurveTo(x + w, y, x + w, y + r);
	ctx.lineTo(x + w, y + h - r);
	ctx.quadraticCurveTo(x + w, y + h, x + w - r, y + h);
	ctx.lineTo(x + r, y + h);
	ctx.quadraticCurveTo(x, y + h, x, y + h - r);
	ctx.lineTo(x, y + r);
	ctx.quadraticCurveTo(x, y, x + r, y);
	ctx.closePath();
	ctx.fill();
	ctx.stroke();
}

var resize_canvas = function(camera, controls, renderer) {

      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      controls.target = new THREE.Vector3(0,0,0);

      renderer.setSize(window.innerWidth, window.innerHeight*0.85);

      controls.update();
    };

function loadTextures(path){

	var textures = {};
	var spriteMap, spriteMaterial, sprite;

	//A
	spriteMap = new THREE.TextureLoader().load( path + "A.png" );
	spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
	textures.A = spriteMaterial;

    //C
    spriteMap = new THREE.TextureLoader().load( path + "C.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.C = spriteMaterial;

    //D
    spriteMap = new THREE.TextureLoader().load( path + "D.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.D = spriteMaterial;

    //E
    spriteMap = new THREE.TextureLoader().load( path + "E.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.E = spriteMaterial;

    //F
    spriteMap = new THREE.TextureLoader().load( path + "F.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.F = spriteMaterial;

    //G
    spriteMap = new THREE.TextureLoader().load( path + "G.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.G = spriteMaterial;

    //H
    spriteMap = new THREE.TextureLoader().load( path + "H.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.H = spriteMaterial;

    //I
    spriteMap = new THREE.TextureLoader().load( path + "I.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.I = spriteMaterial;

    //K
    spriteMap = new THREE.TextureLoader().load( path + "K.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.K = spriteMaterial;

    //L
    spriteMap = new THREE.TextureLoader().load( path + "L.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.L = spriteMaterial;

    //M
    spriteMap = new THREE.TextureLoader().load( path + "M.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.M = spriteMaterial;

    //N
    spriteMap = new THREE.TextureLoader().load( path + "N.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.N = spriteMaterial;

    //P
    spriteMap = new THREE.TextureLoader().load( path + "P.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.P = spriteMaterial;

    //Q
    spriteMap = new THREE.TextureLoader().load( path + "Q.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.Q = spriteMaterial;

    //R
    spriteMap = new THREE.TextureLoader().load( path + "R.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.R = spriteMaterial;

    //S
    spriteMap = new THREE.TextureLoader().load( path + "S.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.S = spriteMaterial;

    //T
    spriteMap = new THREE.TextureLoader().load( path + "T.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.T = spriteMaterial;

    //V
    spriteMap = new THREE.TextureLoader().load( path + "V.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.V = spriteMaterial;

    //W
    spriteMap = new THREE.TextureLoader().load( path + "W.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.W = spriteMaterial;

    //Y
    spriteMap = new THREE.TextureLoader().load( path + "Y.png" );
    spriteMaterial = new THREE.SpriteMaterial( { map: spriteMap, color: 0xffffff } );
    textures.Y = spriteMaterial;

    return textures;
}

function getCharge(aminoacids){
  CNi = 0;
  CNj = 0;

  for (var i = 0, len = aminoacids.length; i <= len; i++) {
    switch(aminoacids[i]) {
      case "R":
        CNi=CNi+((10**12.48)/((10**7)+(10**12.48)));
        break;
      case "K":
        CNi=CNi+((10**10.79)/((10**7)+(10**10.79)));
        break;
      case "H":
        CNi=CNi+((10**6.04)/((10**7)+(10**6.04)));
        break;
      case "D":
        CNj=CNj+((10**7)/((10**7)+(10**3.86)));
        break;
      case "E":
        CNj=CNj+((10**7)/((10**7)+(10**4.25)));
        break;
      case "C":
        CNj=CNj+((10**7)/((10**7)+(10**8.33)));
        break;
      case "Y":
        CNj=CNj+((10**7)/((10**7)+(10**10.07)));
        break;
      default:
        break;
    }
  }

  CNi=CNi+((10**9.69)/((10**7)+(10**9.69)));
  CNj=CNj+((10**7)/((10**7)+(10**2.34)));

  //return sprintf("%.1f",$CNi-$CNj);
  return (CNi-CNj).toFixed();
}

function getIsoEle(aminoacids){
    CNi = 0;
    CNj = 0;
    CN = 0;
    PI = 0;

    if (aminoacids != ""){
      for(i = 0; i<14; i=i+0.01){
        for (var j = 0, len = aminoacids.length; j < len; j++){
          switch(aminoacids[j]){
            case "R":
              CNi=CNi+((10**12.48)/((10**i)+(10**12.48)));
              break;
            case "K":
              CNi=CNi+((10**10.79)/((10**i)+(10**10.79)));
              break;
            case "H":
              CNi=CNi+((10**6.04)/((10**i)+(10**6.04)));
              break;
            case "D":
              CNj=CNj+((10**i)/((10**i)+(10**3.86)));
              break;
            case "E":
              CNj=CNj+((10**i)/((10**i)+(10**4.25)));
              break;
            case "C":
              CNj=CNj+((10**i)/((10**i)+(10**8.33)));
              break;
            case "Y":
              CNj=CNj+((10**i)/((10**i)+(10**10.07)));
              break;
          }
        }

        CNi=CNi+((10**9.69)/((10**i)+(10**9.69)));
        CNj=CNj+((10**i)/((10**i)+(10**2.34)));
        CN= CNi-CNj;

        if(CN>=-0.1) {
          if(CN <=0.1) {
            PI=i.toFixed(1);
          }
        }

        CNi=0;
        CNj=0;
      }
    }

    return PI;
}

function getHidrof(aminoacids){
  H = 0;

  for (var j = 0, len = aminoacids.length; j < len; j++){
    switch(aminoacids[j]) {
      case "A":
      case "I":
      case "L":
      case "F":
      case "V":
      case "M":
      case "C":
      case "W":
        ++H;
    }
  }

  return ((H/aminoacids.length)*100).toFixed(2);
}

function getMoment(aminoacids){
  $sen = 0;
  $cos = 0;
  $MH = 0;
  $MHr = 0;
  $i = 0;

  for (var j = 0, len = aminoacids.length; j < len; j++){
    $i++;
    switch(aminoacids[j]){
      case "A":
          $sen=$sen+1.8*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos+1.8*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "I":
          $sen=$sen+4.5*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos+4.5*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "L":
          $sen=$sen+3.8*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos+3.8*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "W":
          $sen=$sen-0.9*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-0.9*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "F":
          $sen=$sen+2.8*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos+2.8*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "V":
          $sen=$sen+4.2*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos+4.2*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "M":
          $sen=$sen+1.9*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos+1.9*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "Y":
          $sen=$sen-1.3*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-1.3*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "P":
          $sen=$sen-1.6*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-1.6*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "T":
          $sen=$sen-0.7*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-0.7*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "S":
          $sen=$sen-0.8*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-0.8*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "C":
          $sen=$sen+2.5*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos+2.5*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "G":
          $sen=$sen-0.4*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-0.4*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "N":
          $sen=$sen-3.5*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-3.5*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "D":
          $sen=$sen-3.5*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-3.5*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "Q":
          $sen=$sen-3.5*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-3.5*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "E":
          $sen=$sen-3.5*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-3.5*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "H":
          $sen=$sen-3.2*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-3.2*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "K":
          $sen=$sen-3.9*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-3.9*Math.cos((($i+1)*100*Math.PI)/180);
          break;
        case "R":
          $sen=$sen-4.5*Math.sin((($i+1)*100*Math.PI)/180);
          $cos=$cos-4.5*Math.cos((($i+1)*100*Math.PI)/180);
          break;
    }
  }

  $MH= (1/aminoacids.length)*((($sen**2)+($cos**2))**0.5);
  $MHr=(($MH/2.88)*100).toFixed(2);
  return $MHr;
}

function getBoman(aminoacids){
  $IB = 0;
    for (var j = 0, len = aminoacids.length; j < len; j++){
      switch(aminoacids[j]){
        case "A":
          $IB=$IB+1.81;
          break;
        case "I":
        case "L":
          $IB=$IB+4.92;
          break;
        case "W":
          $IB=$IB+2.33;
          break;
        case "F":
          $IB=$IB+2.98;
          break;
        case "V":
          $IB=$IB+4.04;
          break;
        case "M":
          $IB=$IB+2.35;
          break;
        case "Y":
          $IB=$IB-0.14;
          break;
        case "T":
          $IB=$IB-2.57;
          break;
        case "S":
          $IB=$IB-3.40;
          break;
        case "C":
          $IB=$IB+1.28;
          break;
        case "G":
          $IB=$IB+0.94;
          break;
        case "N":
          $IB=$IB-6.64;
          break;
        case "D":
          $IB=$IB-8.75;
          break;
        case "Q":
          $IB=$IB-5.54;
          break;
        case "E":
          $IB=$IB-6.81;
          break;
        case "H":
          $IB=$IB-4.66;
          break;
        case "K":
          $IB=$IB-5.55;
          break;
        case "R":
          $IB=$IB-14.92;
          break;

      }
    }
    $IB=(-$IB/aminoacids.length);
    return $IB.toFixed(2);
}



function getNumberString(string){
  let numberString = "";
  for(i = 1; i <= string.length; i++){
    if ( i > 10){
      numberString += i + ",";
    } else {
      numberString += i + ",";
    }
  }
  return numberString;
}

const octanol_interface_wimley = {
  "A": 0.33,
  "R": 1,
  "N": 0.43,
  "D": 2.41,
  "C": 0.22,
  "Q": 0.19,
  "E": 1.61,
  "G": 1.14,
  "H": -0.06,
  "I": -0.81,
  "L": -0.69,
  "K": 1.81,
  "M": -0.44,
  "F": -0.58,
  "P": -0.31,
  "S": 0.33,
  "T": 0.11,
  "W": -0.24,
  "Y": 0.23,
  "V": -0.53,
}

const octanol_wimley = {
  "A": 0.5,
  "R": 1.81,
  "N": 0.85,
  "D": 3.64,
  "C": -0.02,
  "Q": 0.77,
  "E": 3.63,
  "G": 1.15,
  "H": 0.11,
  "I": -1.12,
  "L": -1.25,
  "K": 2.80,
  "M": -0.67,
  "F": -1.71,
  "P": 0.14,
  "S": 0.46,
  "T": 0.25,
  "W": -2.08,
  "Y": -0.71,
  "V": -0.46,
}

const interface_wimley = {
  "A": 0.17,
  "S": 0.13,
}



function getWimley(string, scale = octanol_interface_wimley){
    WL = 0;
    for (index = 0; index < string.length; index++){
      amino = string[index];

      switch(amino){
        case "A": WL += scale["A"]; break;
        case "R": WL += scale["R"]; break;
        case "N": WL += scale["N"]; break;
        case "D": WL += scale["D"]; break;
        case "C": WL += scale["C"]; break;
        case "E": WL += scale["E"]; break;
        case "Q": WL += scale["Q"]; break;
        case "G": WL += scale["G"]; break;
        case "H": WL += scale["H"]; break;
        case "I": WL += scale["I"]; break;
        case "L": WL += scale["L"]; break;
        case "K": WL += scale["K"]; break;
        case "M": WL += scale["M"]; break;
        case "F": WL += scale["F"]; break;
        case "P": WL += scale["P"]; break;
        case "S": WL += scale["S"]; break;
        case "T": WL += scale["T"]; break;
        case "W": WL += scale["W"]; break;
        case "Y": WL += scale["Y"]; break;
        case "V": WL += scale["V"]; break;
      } 
    }

    WL = WL.toFixed(2);
    return WL;
}

function getWimley2(string){
  
}