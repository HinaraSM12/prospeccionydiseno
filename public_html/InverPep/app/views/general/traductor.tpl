{include file= "../masterPage/template.tpl"}
{include file= "../layouts/inc/header_typep.tpl"}

<main class="detalle">
    <div class="row">
        <div class="csc-header csc-header-n1 col-xs-12">
        <h2 p align="center" style="margin-top:0"> Traductor </p></h2>
        </div>
    </div>

    <form>
        <div class="form-group">
            <label for="aminoTextInput">Aminoacidos</label>
            <textarea class="form-control" id="aminoTextInput" rows="3"
                style="text-transform:uppercase; letter-spacing: 4px;"
                onkeypress="return validateEntry(event);"></textarea>
        </div>
        <div class="form-group">
            <label for="aminoTextInput">ARN</label>
            <textarea class="form-control" id="arnTextInput" rows="3" placeholder="Traduccion ARN aqui" readonly></textarea>
        </div>
        <div class="form-group">
            <label for="aminoTextInput">ADN</label>
            <textarea class="form-control" id="adnTextInput" rows="3" placeholder="Traduccion ADN aqui" readonly></textarea>
        </div>

        <div class="row">

            <h2> Elegir uso de codon </h2>

            <div class="col-md-6">
                <label class="radio">
                <input type="radio" name="translationOption" id="standarOption" value="0" checked>
                Standard Code
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op1" value="1">
                 Vertebrate Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op2" value="2">
                Yeast Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op3" value="3">
                 Mold, Protozoan, and Coelenterate Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op4" value="4">
                 Invertebrate Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op5" value="5">
                 Ciliate, Dasycladacean and Hexamita Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op6" value="6">
                 Echinoderm and Flatworm Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op7" value="7">
                 Euplotid Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op8" value="8">
                 Alternative Yeast Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op9" value="9">
                 Ascidian Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op10" value="10">
                 Alternative Flatworm Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op11" value="11">
                 Chlorophycean Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op12" value="12">
                 Trematode Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op13" value="13">
                 Scenedesmus obliquus Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op14" value="14">
                 Pterobranchia Mitochondrial
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op15" value="15">
                 Candidate Division SR1 and Gracilibacteria
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op16" value="16">
                 Pachysolen tannophilus Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op17" value="17">
                 Karyorelict Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op18" value="18">
                 Condylostoma Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op19" value="19">
                 Mesodinium Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op20" value="20">
                 Peritrich Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op21" value="21">
                 Blastocrithidia Nuclear
                </label>
                <label class="radio">
                <input type="radio" name="translationOption" id="op22" value="22">
                 Cephalodiscidae Mitochondrial UAA-Tyr
                </label>

            </div>

            <div class="col-md-6">
                <button type="button" 
                    class="btn btn-primary btn-lg btn-block"
                    onclick="return transformAmino();">Traducir</button>
            </div>

             
            

        </div>
        
    </form>
</main>

{include file= "../layouts/inc/footer.tpl"}

