import * as data from './arn-translator-data.js';

export function aminoToRNA(amino, rnaCode){
    let rnaSequence = [];

    // Set all modifications to standar rna code
    for(let i = 0; i < amino.length; i++){
        rnaSequence.push(data.standarToSpecific[rnaCode][amino.charAt(i)]);
    }
    
    // Everything else to standar rna code
    for(let i=0; i < rnaSequence.length; i++){
        if(typeof rnaSequence[i] === 'undefined'){
            rnaSequence[i] = data.standar_code.aminoacid_to_rna[amino.charAt(i)];
        }
    }

    return rnaSequence;
}