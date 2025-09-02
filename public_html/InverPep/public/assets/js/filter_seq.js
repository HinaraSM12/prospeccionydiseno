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
  
  function getMostUsedAminoacids(allAminoacids, aminoacids_list){
    let aminoacidsUsage = []
    aminoacids_list.forEach((aminoacid) => {
      aminoacidRegex = new RegExp(aminoacid,"g");
      aminoacidMatch = allAminoacids.match(aminoacidRegex);
      if (aminoacidMatch){
        aminoacidCount = aminoacidMatch.length;
        aminoJson = {}
        aminoJson["aminoacid"] = aminoacid; 
        aminoJson["count"] = aminoacidCount;
        aminoacidsUsage.push(aminoJson);
      }
    })
    
    aminoacidsUsage.sort((a, b) => (a.count < b.count) ? 1 : -1)
    mostUsedAminoacids = aminoacidsUsage.slice(0,5);
  
    let amionacidsUsageResponse = ""
    mostUsedAminoacids.forEach(function(aminoJson){
      aminoacidPercentage = ((aminoJson["count"]*100)/allAminoacids.length).toFixed(2);
      amionacidsUsageResponse += aminosFullName[aminoJson["aminoacid"]] + "(" + aminoJson["aminoacid"] + "): " + aminoacidPercentage + "% ";
    })
  
    return amionacidsUsageResponse;
  }
  
  
  function addHighLights(sequenceFind, sequenceInput){
    newSequence = "<span class=highlight>" + sequenceFind.match(sequenceInput)[0] + "</span>";
    sequenceWithHighLight = sequenceFind.replace(new RegExp(sequenceInput, 'g'), newSequence);

    return sequenceWithHighLight;
  }
