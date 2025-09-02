<!-- Buscador de secuencias -->
<div class="container">
    <form>
        <div class="row row-bottom-margin">
            <div class="col-md-10">
            <input type="text" class="form-control" id="inputTextSequence" aria-describedby="text1Help" 
                    placeholder="Escriba la secuencia que desea buscar"style="text-transform:uppercase"
                    onkeypress="return validateEntry(event);">
            </div>
            <div class="col-md-2">
                <button type="button" id="findButton" class="btn btn-primary"  onclick="findSequences()">Buscar</button>
            </div>
        </div>

        <div class="row row-bottom-margin">

            <!-- Input for Charge -->
            <div class="form-group col-md-2">
                <div class="input-group">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="min-charge-input">Carga Min</span>
                    </div>
                    <input type="number" class="form-control" id="minCharge">
                </div>
            </div>
            <div class="form-group col-md-2">
                <div class="input-group">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="max-charge-input">Carga Max</span>
                    </div>
                    <input type="number" class="form-control" id="maxCharge">
                </div>
            </div>

            <!-- Input for Isoelectric Point -->
            <div class="form-group col-md-4">
                <div class="input-group">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="min-iso-input">Isoelectric Min</span>
                    </div>
                    <input type="number" class="form-control" id="minIsoelectric" step=".1">
                </div>
            </div>
            <div class="form-group col-md-4" >
                <div class="input-group">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="max-iso-input">Isoelectric Max</span>
                    </div>
                    <input type="number" class="form-control" id="maxIsoelectric" step=".1">
                </div>
            </div>
        </div>
        
        <div class="row row-bottom-margin">
            <!-- Input for Isoelectric Point -->
            <div class="form-group col-md-3">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text" id="min-hidro-input">% Hidrofobic Min</span>
                </div>
                <input type="number" class="form-control" id="minHidrofobic" step="any">
            </div>
            </div>
            <div class="form-group col-md-3" >
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text" id="max-iso-input">% Hidrofobic Max</span>
                </div>
                <input type="number" class="form-control" id="maxHidrofobic" step="any">
            </div>
            </div>

            <!-- Input for Boman Index-->
            <div class="form-group col-md-3">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text" id="min-boman-input">Boman min</span>
                </div>
                <input type="number" class="form-control" id="minBoman" step=".01">
            </div>
            </div>
            <div class="form-group col-md-3" >
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text" id="max-boman-input">Boman max</span>
                </div>
                <input type="number" class="form-control" id="maxBoman" step=".01">
            </div>
            </div>

        </div>

        <div class="row row-bottom-margin">
            <div class="form-group col-md-6">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text" id="min-mom-input">Momento Hidrofobico Relativo min</span>
                </div>
                <input type="number" class="form-control" id="minMoment" step=".01">
            </div>
            </div>
            <div class="form-group col-md-6" >
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text" id="max-mom-input">Momento Hidrofobico Relativo max</span>
                </div>
                <input type="number" class="form-control" id="maxMoment" step=".01">
            </div>
            </div>
        </div>
    </form>
</div>