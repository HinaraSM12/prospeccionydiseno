const transparentColor = { r: 0, g: 0, b: 0, a: 0 };

function getRGBColor(hexColor, alpha=1){
  var color = {};
  color.r = hexToR(hexColor);
  color.g = hexToG(hexColor);
  color.b = hexToB(hexColor);
  color.a = alpha;
  return color;
}
function hexToR(h) {return parseInt((cutHex(h)).substring(0,2),16)}
function hexToG(h) {return parseInt((cutHex(h)).substring(2,4),16)}
function hexToB(h) {return parseInt((cutHex(h)).substring(4,6),16)}
function cutHex(h) {return (h.charAt(0)=="#") ? h.substring(1,7):h}

// Colors for aminoacids
const greenLime = "#19FC01";
const blueSky = "#AED9E4";
const purple = "#A417F4";
const red = "#FE0001";
const blueKing = "#04007F";
const yellow = "#FFFD01";

const aminosColor = {
  "P": greenLime, 
  "H": blueSky,
  "T": purple, "S": purple, "Q": purple, "N": purple,
  "D": red, "E": red,
  "R": blueKing, "K": blueKing,
  "A": yellow, "C": yellow, "F": yellow, "G": yellow, "I": yellow, "L": yellow,
  "M": yellow, "V": yellow, "W": yellow, "Y": yellow
}