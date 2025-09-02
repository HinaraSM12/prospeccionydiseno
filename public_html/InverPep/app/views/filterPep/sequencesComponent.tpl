<!-- Tabla de secuencias -->
<div class="container">

    <h2> Secuencias Encontradas </h2>
        <button type="button" id="downloadButton" class="btn btn-primary"  onclick="downloadSequences()">Descargar CSV</button> 
    <button type="button" id="downloadButtonFasta" class="btn btn-primary"  onclick="downloadSequencesFasta()">Descargar Fasta</button>
    <table id ="archivoInfoTable" class="table table-striped">
        <thead>
            <tr>
            <th scope="col">Titulo</th>
            <th scope="col">Secuencia</th>
            </tr>
        </thead>
        <tbody>
            {foreach $sequences as $sequence}
                <tr>
                    <td>{$sequence.header}</td>
                    <td>{$sequence.sequence}</td>
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>