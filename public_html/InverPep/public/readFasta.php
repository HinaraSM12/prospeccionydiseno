<?php 

$filename = "BD_FINAL.fasta";

function read_fastas($filename){

    $fh = fopen($filename, 'r');
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

        return $sequences;
    }
}

//Call the function
$sequences = read_fastas($filename);
//do something with your fasta

?>