function getRadioAmino(aminoLetter){
  if (['F', 'W', 'Y'].indexOf(aminoLetter) != -1){
    return 3;
  }// Big 
  else if (['I', 'L', 'M', 'K', 'R'].indexOf(aminoLetter) != -1){
      return 2.5;
  }// Medium
  else if (['V', 'H', 'E', 'Q'].indexOf(aminoLetter) != -1){
      return 2;
  }// Small
  else if (['C', 'P', 'T', 'D', 'N'].indexOf(aminoLetter) != -1){
      return 1.5;
  }// Pretty Small
  else if (['A', 'G', 'S'].indexOf(aminoLetter) != -1){
      return 1;
  }
}
