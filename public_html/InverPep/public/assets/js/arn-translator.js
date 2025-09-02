import * as data from './arn-translator-data';
import {aminoToRNA} from '../arn-translator-api.js';

function printRNA(arrayRNA){
  let rnaToPrint = ""
  for(let i=0; i < arrayRNA.length; i++){
    rnaToPrint += arrayRNA[i][0];
  }
  $("#arnTextInput").val(rnaToPrint);
}

 function printDNA(arrayRNA){
  let rnaToPrint = "";
  let dnaToPrint = "";
  
  for(let i=0; i < arrayRNA.length; i++){
    rnaToPrint += arrayRNA[i][0];
  }

  for(let i=0; i < rnaToPrint.length; i++){
    dnaToPrint += rna_to_dna[rnaToPrint.charAt(i)];
  }
  $("#adnTextInput").val(dnaToPrint);
}

window.validateEntry = function validateEntry(event){
  var chart = event.key.toUpperCase();
  var key = event.keyCode || event.charCode;
  if( key == 8)
    return true;
  if(data.aminoacids_list.indexOf(chart) != -1){
    return true;
  } else {
    return false;
  }
}

export function transformAmino(){
  const sequenceClass = $('input[name=translationOption]:checked').val();
  const aminoSequence = $("#aminoTextInput").val().toUpperCase();
  const rnaSequenceTranslation = aminoToRNA(aminoSequence, sequenceClass);

  console.log('rnaSequenceTranslation -> ', rnaSequenceTranslation);
  printRNA(rnaSequenceTranslation);
  printDNA(rnaSequenceTranslation);
}
