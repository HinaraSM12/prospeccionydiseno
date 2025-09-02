<!-- Tabla de secuencias -->
<div class="container">

    <h2> Sequences Found</h2>
    <button type="button" id="downloadButton" class="btn btn-primary"  onclick="downloadSequences()">Download CSV</button> 
    <button type="button" id="downloadButtonFasta" class="btn btn-primary"  onclick="downloadSequencesFasta()">Download Fasta</button>
    <table id ="archivoInfoTable" class="table table-striped">
        <thead>
            <tr>
            <th scope="col">Title</th>
            <th scope="col">Sequence</th>
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