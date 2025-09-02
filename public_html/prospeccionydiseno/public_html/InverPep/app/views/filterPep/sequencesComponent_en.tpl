<!-- Tabla de secuencias -->
<div class="container">

    <h2> Sequences Found</h2>
    <button id = "downloadPeps">Download CSV</button>
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