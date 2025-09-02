//lista para guardar los datos de las traducciones
let datos=[];
//funcion
function formulario(){
    datos=[];
    //toma los datos del formulario
    let alertas=[];
    const secuencia = document.getElementById("secuencia").value.toUpperCase().replaceAll(" ","").replaceAll("\n","");
    console.log(secuencia)
    if(document.querySelector('input[name="tipoSecuencia"]:checked')==null){
        alertas.push("Debe ingresar el tipo de secuencia de entrada")
    }else {
        const tipoSecuencia=document.querySelector('input[name="tipoSecuencia"]:checked').value;
    }
    if(document.getElementById("file").files.length==0&&secuencia.length==0){
        alertas.push("Debe ingresar una secuencia o un archivo fasta de entrada")
    }

    const estandar=document.getElementById("estandar").value;
    if(estandar=="Seleccione el Organismo"){
        alertas.push("Desbes selecionar el tipo de organismo")
    }
    let html=""
    console.log(document.getElementById("file").files.length)
    if(alertas.length==0){
        if(document.getElementById("file").files.length>0){
         const file=document.getElementById("file").files[0];
         loadFile(file)
    }else {
            const tipoSecuencia=document.querySelector('input[name="tipoSecuencia"]:checked').value;
            html=transformarsecuencia(secuencia,tipoSecuencia,estandar,"entrada")
    }

    }else {
        texto=""
        for(let i in alertas){
            texto+=alertas[i]+"\n"


        }
        alert(texto)
    }




    document.getElementById("salidaTraductor").innerHTML=""
    document.getElementById("salidaTraductor").innerHTML=html
    //const rnaSequenceTranslation = aminoToRNA(aminoSequence, sequenceClass);

}
 async function loadFile(file) {
    document.getElementById("salidaDocumento").innerHTML ="";
    let text = await file.text();

    var lines = text.split(/\r\n|\n/);
    var test=/^>(.*)/gm;
    let secuencia="";
    let nombre="";
    const tipoSecuencia=document.querySelector('input[name="tipoSecuencia"]:checked').value;
    const estandar=document.getElementById("estandar").value;

    for(var line = 0; line < lines.length; line++){

        if(test.test(lines[line])){
            secuencia=""
            nombre=lines[line].match(test)[0].slice(1);

        }else if(test.test(lines[line+1])||line==lines.length-1){
            secuencia+=lines[line].toUpperCase()
            document.getElementById("salidaDocumento").innerHTML += transformarsecuencia(secuencia,tipoSecuencia,estandar,nombre)+'<br>';
        }else if(lines[line].length>0){
            secuencia+=lines[line].toUpperCase()
        }else {
            document.getElementById("salidaDocumento").innerHTML += transformarsecuencia(secuencia,tipoSecuencia,estandar,nombre)+'<br>';
        };
      console.log(test.test(lines[line]));

    };

      };
function getRandomInt( max) {
  return Math.floor(Math.random() * (max - 1)) + 1;
};
function ARNtoAMINo(ARN,estandar=0,index=0){
    let testarn=/[^AUGC]/gm
    if (testarn.test(ARN)) {
        let amino = "No se puede traducir a proteina"
        return(amino)
    }
    estandar=0
    let amino=""
    let i=3+index
    let dicc=data[estandar]

    while (i<=ARN.length) {

         base = ARN.charAt(i - 3) + ARN.charAt(i - 2) + ARN.charAt(i - 1)

         i += 3
         for (let j=0;j<aminoacids_list.length;j++){
             aux1=aminoacids_list[j]
             aux2=dicc[aux1]

             if(aux2.includes(base)) {
                 if(false){
                     amino+="<b>"+aux1+"</b>"
                 }else {
                     amino += aux1
                 }
             }
         }
    }
    return(amino)
};
function ARNtoADN(RNA){
    let dna="";
    for(let i = 0; i < RNA.length; i++) {
        if (RNA.charAt(i) == "U") {
            dna += "T"
        } else {
            dna += RNA.charAt(i)
        }
    }
    return(dna)
};
function ADNtoARN(ADN){
    let arn="";
    for(let i = 0; i < ADN.length; i++){
        if(ADN.charAt(i)=="T"){
            arn+="U"
        }else {
            arn+=ADN.charAt(i)
        }


    }
    return(arn)
};
function aminoToRNA(amino, estandar){
    let rnaSequence = "";

    let dicc=data[estandar]

    for(let i = 0; i < amino.length; i++){
        rnaSequence+=dicc[amino.charAt(i)]


        //let indice=0


        //rnaSequence+=bases[indice];
    }



    return rnaSequence;
};
//equivalencia de estandares
const aminoacids_list = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y', '*'];
let data={
  0:{
        "A": ["GCU", "GCC", "GCA", "GCG"],
        "C": ["UGU", "UGC"],
        "D": ["GAU", "GAC"],
        "E": ["GAA", "GAG"],
        "F": ["UUU", "UUC"],
        "G": ["GGU", "GGC", "GGA", "GGG"],
        "H": ["CAU", "CAC"],
        "I": ["AUU", "AUA", "AUC"],
        "K": ["AAA", "AAG"],
        "L": ["UUA", "UUG", "CUU", "CUC", "CUA", "CUG"],
        "M": ["AUG"],
        "N": ["AAU", "AAC"],
        "P": ["CCU", "CCC", "CCA", "CCG"],
        "Q": ["CAA", "CAG"],
        "R": ["CGU", "CGC", "CGA", "CGG", "AGA", "AGG"],
        "S": ["UCU", "UCC", "UCA", "UCG", "AGU", "AGC"],
        "T": ["ACU", "ACC", "ACA", "ACG"],
        "V": ["GUU", "GUC", "GUA", "GUG"],
        "W": ["UGG"],
        "Y": ["UAU", "UAC"],
        "*": ["UAA", "UAG", "UGA"]
    },
    1:{
        "A": "GCG",
        "C": "UGC",
        "D": "GAU",
        "E": "GAA",
        "F": "UUU",
        "G": "GGC",
        "H": "CAU",
        "I": "AUU",
        "K": "AAA",
        "L": "CUG",
        "M": "AUG",
        "N": "AAC",
        "P": "CCG",
        "Q":  "CAG",
        "R": "CGU",
        "S":  "AGC",
        "T": "ACC",
        "V":  "GUG",
        "W": "UGG",
        "Y": "UAU",
        "*": "UAA"
    },
    2: {
        "A": "GCU",
        "C": "UGU",
        "D": "GAU",
        "E": "GAA",
        "F": "UUU",
        "G": "GGU",
        "H": "CAU",
        "I": "AUU",
        "K": "AAA",
        "L": "UUG",
        "M": "AUG",
        "N": "AAU",
        "P": "CCA",
        "Q": "CAA",
        "R": "AGA",
        "S":  "UCU",
        "T": "ACU",
        "V":  "GUU",
        "W": "UGG",
        "Y": "UAU",
        "*": "UAA"
    },
    3:  {
        "A": "GCU",
        "C": "UGC",
        "D": "GAC",
        "E": "GAG",
        "F": "UUC",
        "G": "GGU",
        "H": "CAC",
        "I": "AUC",
        "K": "AAG",
        "L": "CUG",
        "M": "AUG",
        "N": "AAC",
        "P": "CCC",
        "Q": "CAG",
        "R": "CGU",
        "S":  "UCC",
        "T": "ACC",
        "V":  "GUG",
        "W": "UGG",
        "Y": "UAC",
        "*": "UAA"
    },
    4: {
        "A": "GCU",
        "C": "UGU",
        "D": "GAU",
        "E": "GAA",
        "F": "UUC",
        "G": "GGA",
        "H": "CAU",
        "I": "AUU",
        "K": "AAA",
        "L": "CUU",
        "M": "AUG",
        "N": "AAU",
        "P": "CCA",
        "Q": "CAA",
        "R": "AGA",
        "S":  "UCA",
        "T": "ACA",
        "V":  "GUU",
        "W": "UGG",
        "Y": "UAU",
        "*": "UAA"
    },
    5: {
        "A": "GCC",
        "C": "UGC",
        "D": "GAU",
        "E": "GAG",
        "F": "UUC",
        "G": "GGC",
        "H": "CAC",
        "I": "AUC",
        "K": "AAG",
        "L": "CUG",
        "M": "AUG",
        "N": "AAC",
        "P": "CCC",
        "Q": "CAG",
        "R": "CGC",
        "S":  "UGC",
        "T": "ACC",
        "V":  "GUG",
        "W": "UGG",
        "Y": "UAC",
        "*": "UAA"
    },
    6: {
        "A": "GCC",
        "C": "UGC",
        "D": "GAC",
        "E": "GAG",
        "F": "UUC",
        "G": "GGC",
        "H": "CAC",
        "I": "AUC",
        "K": "AAG",
        "L": "CUG",
        "M": "AUG",
        "N": "AAC",
        "P": "CCC",
        "Q": "CAG",
        "R": "CGG",
        "S": "UGC",
        "T": "ACC",
        "V":  "GUG",
        "W": "UGG",
        "Y": "UAC",
        "*": "UGA"
    },
    7: {
        "A": "GCC",
        "C": "UGC",
        "D": "GAC",
        "E": "GAG",
        "F": "UUC",
        "G": "GGC",
        "H": "CAC",
        "I": "AUC",
        "K": "AAG",
        "L": "CUG",
        "M": "AUG",
        "N": "AAC",
        "P": "CCC",
        "Q": "CAG",
        "R": "AGG",
        "S": "UGC",
        "T": "ACC",
        "V":  "GUG",
        "W": "UGG",
        "Y": "UAC",
        "*": "UGA"
    },
    8: {
        "A": "GCU",
        "C": "UGU",
        "D": "GAU",
        "E": "GAA",
        "F": "UUU",
        "G": "GGA",
        "H": "CAU",
        "I": "AUU",
        "K": "AAG",
        "L": "CUU",
        "M": "AUG",
        "N": "AAU",
        "P": "CCU",
        "Q": "CAA",
        "R": "AGA",
        "S":  "UCU",
        "T": "ACU",
        "V":  "GUU",
        "W": "UGG",
        "Y": "UAU",
        "*": "UGA"
    },
    9: {
        "A": "GCC",
        "C": "UGC",
        "D": "GAC",
        "E": "GAG",
        "F": "UUC",
        "G": "GGC",
        "H": "CAC",
        "I": "AUC",
        "K": "AAG",
        "L": "CUG",
        "M": "AUG",
        "N": "AAC",
        "P": "CCG",
        "Q": "CAG",
        "R": "AGG",
        "S":  "UCC",
        "T": "ACC",
        "V":  "GUG",
        "W": "UGG",
        "Y": "UAC",
        "*": "UGA"
    }
};
 const rna_to_dna = {

  C: "C",
  G: "G",
  U: "T",
  A: "A"
};
const dna_to_rna = {
  G: "G",
  C: "C",
  A: "A",
  T: "U",

};
function transformarsecuencia(secuencia,tipoSecuencia,estandar,nombre){
    let html="";
    secuencia=secuencia.replace("\\s*","")
    if (secuencia.length>0){

        //caso en el que ingresa una proteina o aminoacido
        if (tipoSecuencia=="AMINO") {
            let testamino=/[^ACDEFGHIKLMNPQRSTVWY*]/gm
            if (testamino.test(secuencia)) {
                    html = "La entrada no coresponde con una proteina"
            }else {
                const arn = aminoToRNA(secuencia, estandar)
                const dna = ARNtoADN(arn);
                datos.push({"nombre":nombre,"adn":dna,"arn":arn,"amino":secuencia});
                let variables={"Nombre":nombre}
                variables["Secuencia Original"]= secuencia
                if(document.getElementById("ADNF").checked==true){variables["ADN Forward (5' - 3')"]=dna}
                if(document.getElementById("ADNR").checked==true){variables["ADN Complementario (3' - 5')"]=complementarioADN(reverse(dna))}
                if(document.getElementById("ARNF").checked==true){variables["ARN Forward (5' - 3')"]=arn}
                if(document.getElementById("ARNR").checked==true){variables["ARN Complementario (3' - 5')"]=complementarioARN(reverse(arn))}


            html = box(variables)

            }
            return(html)

        }
        //caso en el que ingreas ADN
        else if(tipoSecuencia=="ADN"){
            let testadn=/[^ATGCRYNKMSWBVDH]/gm

            if (testadn.test(secuencia)) {
                   html = "La entrada no coresponde con ADN"
            }
            else{
                let dna=secuencia;
                let arn=ADNtoARN(dna);
                let aminoacido=ARNtoAMINo(arn,estandar)
                datos.push({"nombre":nombre,"adn":dna,"arn":arn,"amino":aminoacido});
                let variables={"Nombre":nombre}
                variables["Secuencia Original"]= secuencia
                if(document.getElementById("ADNR").checked==true){variables["ADN Complementario (3' - 5')"]=complementarioADN(reverse(dna))}
                if(document.getElementById("ARNF").checked==true){variables["ARN Forward (5' - 3')"]=arn}
                if(document.getElementById("ARNR").checked==true){variables["ARN Complementario (3' - 5')"]=complementarioARN(reverse(arn))}
                if(document.getElementById("AMINOF1").checked==true){variables["Proteina Forward (ORF+1)"]=aminoacido}
                if(document.getElementById("AMINOF2").checked==true){variables["Proteina Forward (ORF+2)"]=ARNtoAMINo(arn,estandar,1)}
                if(document.getElementById("AMINOF3").checked==true){variables["Proteina Forward (ORF+3)"]=ARNtoAMINo(arn,estandar,2)}
                if(document.getElementById("AMINOR1").checked==true){variables["Proteina  Complementario (ORF-1)"]=ARNtoAMINo(complementarioARN(reverse(arn)),estandar,0)}
                if(document.getElementById("AMINOR2").checked==true){variables["Proteina  Complementario (ORF-2)"]=ARNtoAMINo(complementarioARN(reverse(arn)),estandar,1)}
                if(document.getElementById("AMINOR3").checked==true){variables["Proteina  Complementario (ORF-3)"]=ARNtoAMINo(complementarioARN(reverse(arn)),estandar,2)}


                html = box(variables)

            }
            return(html)
        }
        //caso en el que ingreas ARN
        else if(tipoSecuencia=="ARN"){

            let testarn=/[^AUGCRYNKMSWBVDH]/gm
            if (testarn.test(secuencia)) {
                   html = "La entrada no coresponde con ARN"
                }
            else {
                let arn=secuencia;
                let adn=ARNtoADN(arn);
                let aminoacido=ARNtoAMINo(arn,estandar)
                datos.push({"nombre":nombre,"adn":adn,"arn":arn,"amino":aminoacido});
                let variables={"Nombre":nombre}
                variables["Secuencia Original"]= secuencia
                if(document.getElementById("ADNF").checked==true){variables["ADN Forward (5' - 3')"]=adn}
                if(document.getElementById("ADNR").checked==true){variables["ADN Complementario (3' - 5')"]=complementarioADN(reverse(adn))}
                if(document.getElementById("ARNR").checked==true){variables["ARN Complementario (3' - 5')"]=complementarioARN(reverse(arn))}
                if(document.getElementById("AMINOF1").checked==true){variables["Proteina Forward (ORF+1)"]=aminoacido}
                if(document.getElementById("AMINOF2").checked==true){variables["Proteina Forward (ORF+2)"]=ARNtoAMINo(arn,estandar,1)}
                if(document.getElementById("AMINOF3").checked==true){variables["Proteina Forward (ORF+3)"]=ARNtoAMINo(arn,estandar,2)}



                html = box(variables)


                }
            return(html)
        }
        else{
            console.log(tipoSecuencia);
        }
    }else {
        return ("")
    }

}
function generarDocumento(tipo,isReverse=false,marco=0,complementario=false){
    let texto="";

    for(let i=0;i<datos.length;i++){
        let dato=datos[i]

        const nombre=dato.nombre;
        let sec="";

        if(!(isReverse&&complementario)&&marco==0){
            //console.log(dato[tipo])
            sec=dato[tipo];
        }else if(tipo=="adn"){
            if (complementario){
                sec=complementarioADN(dato.adn)
            }else {
                sec=dato.adn
            }
            if (isReverse){
                sec=reverse(sec)
            }
        }else if(tipo=="arn"){
            if (complementario){
                sec=complementarioADN(dato.adn)
                sec=ADNtoARN(sec)
            }else {
                sec=dato.arn
            }
            if (isReverse){
                sec=reverse(sec)
            }else if(tipo=="amino"){
                if(marco==0){
                sec=dato.amino
                }
                else {
                    const estandar=document.getElementById("estandar").value;
                    sec=ARNtoAMINo(dato.arn,estandar,marco)
                }
            }
            }
        console.log(sec)
            if (isReverse){
                sec=reverse(sec)
            }
            console.log(sec)
        let aux=">"+nombre+"\n"+sec+"\n";
            console.log(aux)
        texto+=aux

    }
    download("documento.fasta",texto)

}
function download(filename, text) {
  var element = document.createElement('a');
  element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
  element.setAttribute('download', filename);

  element.style.display = 'none';
  document.body.appendChild(element);

  element.click();

  document.body.removeChild(element);
}
function reverse(s){
    return s.split("").reverse().join("");
}
const complementario={
    C : "G",
    G : "C",
    A : "T",
    T : "A",
    R : "Y",
    Y : "R",
    N : "N",
    K : "M",
    M : "K",
    S : "S",
    W : "W",
    B : "V",
    V : "B",
    D : "H",
    H : "D"
}
function complementarioADN(ADN){
    let ADNC="";
    for(let i = 0; i < ADN.length; i++){
        ADNC+=complementario[ADN.charAt(i)]
    }
    return(ADNC)

}

//modal
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})
function box(variables ){
   let html='<div class="card">\
                        <div class="card-body"  style="border-style: solid ;border-width: 2px;background-color: white;padding: 10px">'
    for(let i in variables){
        html+='<h6 class="  mb-2">'+i+'</h6>\
                        <p class="card-text" style="word-wrap: break-word;">' + variables[i] + '</p>'
    }

    html+='</div>\
            </div>'
    return(html)
}
function formularioSalida(entrada){
    let amino='</br><div class="card">' +
        '<div class="card-body" padding: 10px">' +
        '<div style="display:flex;">'+
        '<div style="padding-top:10px;" >'+
        '<h6 class="  mb-2">ADN</h6>' +
        '<input type="checkbox" id="ADNF">&nbsp;Forward  (5&#39; - 3&#39;) &nbsp;&nbsp;<input type="checkbox" id="ADNR">&nbsp;Complementario&nbsp;(3&#39; - 5&#39;)' +
        "</br></br>"+
         '<h6 class="  mb-2">ARN</h6>' +
        '<input type="checkbox" id="ARNF">&nbsp;Forward  (5&#39; - 3&#39;) &nbsp;&nbsp;<input type="checkbox" id="ARNR">&nbsp;Complementario&nbsp;(3&#39; - 5&#39;)' +
        '</div>\
            </div>'


    let ADN='</br><div class="card">' +
        '<div class="card-body" padding: 10px">' +
        '<div style="display:flex;">'+
        '<div style="padding-top:10px;" >'+
        '<h6 class="  mb-2">ADN</h6>' +
        '<input type="checkbox" id="ADNR">&nbsp;Complementario&nbsp;(3&#39; - 5&#39;)' +
        "</br></br>"+
        '</div>'+
        '<div style="padding:10px;padding-left: 30px;">'+
         '<h6 class="  mb-2">ARN</h6>' +
        '<input type="checkbox" id="ARNF">&nbsp;Forward  (5&#39; - 3&#39;)&nbsp;&nbsp;<input type="checkbox" id="ARNR"/>&nbsp;Complementario&nbsp;(3&#39; - 5&#39;)' +
         "</br></br>"+
        '</div>'+
        '</div>'+
        '<div>'+
        '<h6 class="  mb-2">PROTEINA</h6>' +
        '<table style="border:none;">'+
        '<tr>'+
        '<td><input type="checkbox" id="AMINOF1"/>&nbsp;Forward (ORF+1)&nbsp;&nbsp;</td>' +

        '<td><input type="checkbox" id="AMINOF2"/>&nbsp;Forward (ORF+2)&nbsp;&nbsp;</td>' +

        '<td><input type="checkbox" id="AMINOF3"/>&nbsp;Forward (ORF+3)&nbsp;&nbsp;</td>' +
        '</tr>'+
        '<tr>'+
        '<td><input type="checkbox" id="AMINOR1"/>&nbsp;Complementario (ORF-1)&nbsp;&nbsp;</td>' +

        '<td><input type="checkbox" id="AMINOR2">&nbsp;Complementario (ORF-2)&nbsp;&nbsp;</td>' +

        '<td><input type="checkbox" id="AMINOR3">&nbsp;Complementario (ORF-3)&nbsp;&nbsp;</td>' +
        '</tr>'+
        '</table>'+
        '</div>'+
        '</div>\
            </div>'

    let ARN='</br><div class="card">' +
        '<div class="card-body" padding: 10px">' +
        '<div style="display:flex;">'+
        '<div style="padding-top:10px;" >'+
        '<h6 class="  mb-2">ADN</h6>' +
        '<input type="checkbox" id="ADNF"/>&nbsp;Forward  (5&#39; - 3&#39;) &nbsp;&nbsp;<input type="checkbox" id="ADNR">&nbsp;Complementario (3&#39; - 5&#39;)' +
        "</br></br>"+
        '</div>'+
        '<div style="padding:10px;padding-left: 30px;">'+
         '<h6 class="  mb-2">ARN</h6>' +
        '<input type="checkbox" id="ARNR"/>&nbsp;Complementario (3&#39; - 5&#39;)' +
         "</br></br>"+
        '</div>'+
        '</div>'+
        '<div>'+
        '<h6 class="  mb-2">PROTEINA</h6>' +
        '<div ">'+
        '<input type="checkbox" id="AMINOF1">&nbsp;Forward (ORF+1)&nbsp;&nbsp;' +

        '<input type="checkbox" id="AMINOF2">&nbsp;Forward (ORF+2)&nbsp;&nbsp;' +

        '<input type="checkbox" id="AMINOF3">&nbsp;Forward (ORF+3)&nbsp;&nbsp;' +
        '</div>'+
        '</div>'+
        '</div>\
            </div>'

    if(entrada=="AMINO"){
        document.getElementById("opcionesSalidas").innerHTML=amino
    }else if(entrada=="ADN"){
        document.getElementById("opcionesSalidas").innerHTML=ADN
    }else if(entrada=="ARN"){
        document.getElementById("opcionesSalidas").innerHTML=ARN
    }
}

function complementarioARN(ARN){
    const complementarioarn={
    C : "G",
    G : "C",
    A : "U",
    U : "A"
}
    let ADNC="";
    for(let i = 0; i < ARN.length; i++){
        ADNC+=complementarioarn[ARN.charAt(i)]
    }
    return(ADNC)
}
