{include file= "../masterPage/templateResponsive.tpl"}
{include file= "../layouts/inc/header1.tpl"}

<main class="detalle">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="csc-default">
                <div class="logo">
                    <img alt="InverPep" src="{URL::to('/')}/assets/img/logo1.png" width="925" height="110" title="Inverpep"/>
                </div>
        <div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader">Tools</h1>
        </div>

          <div class="col-lg-12">
            <h2 p align="center"> CALCAMPI </p></h2>
            <h4 p align="center"><b> Physicochemical properties calculator of multiple peptides at the same time. </b></p></h4><br>
            <h4 p align="center"> For each peptide the program calculates: Molecular Weight, Net Charge, Hydrophobicity, Boman index, Aliphatic index, % of hydrophobic amino acids, Isoelectric Point and structure secondary prediction </p></h4>
            <h4 p align="center"> The peptides (amino acids sequence in UPPERCASE) can be added manually (peptide per line) or you can upload a FASTA file with the peptide list (peptide per line). </p></h4>
            <h4 p style='margin-top: 0.5em' align="center"> <a style='color: #50992E; font-weight:bold; ' download="example.fasta" href='/gruposdeinvestigacion/prospeccionydisenobiomoleculas/InverPep/app2/fasta.fasta' > Example file</a> </h4>
            <iframe width='100%' height='500px' src='http://ciencias.medellin.unal.edu.co/gruposdeinvestigacion/prospeccionydisenobiomoleculas/InverPep/app2/hello.cgi'</iframe>
        </div>


            </div>
        </div>
    </div>
</main>

{include file= "../layouts/inc/footer.tpl"}

<script>
$(document).ready(function(){
    $(".panel-collapse").click(function(){
        $(".panel-body").collapse('toggle');
    });
});
</script>
