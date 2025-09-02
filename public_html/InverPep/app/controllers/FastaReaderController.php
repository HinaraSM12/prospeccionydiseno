<?php

class FastaReaderController extends BaseController {

    public function getSequence(){
        $filename = "BD_FINAL.fasta";
        return View::make('general.filter_pep')->with("filename", $filename);
    }

}