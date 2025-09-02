{include file= "../masterPage/templateResponsive.tpl"}
{include file= "../layouts/inc/header.tpl"}

<main class="detalle">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">


            <div class="csc-default">
                <div class="logo">
                    <img alt="InverPep" src="{URL::to('/')}/assets/img/logo1.png" width="925" height="110" title="Inverpep"/>
                </div>
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader">Herramientas</h1>
		</div>
		<div class="col-lg-12">
			<h2 p align="center"> CALCAMPI </p></h2>
			<h4 p align="center"><b> Herramienta para calcular propiedades fisico-químicas de multiples péptidos al mismo tiempo. </b></p></h4><br>
			<h4 p align="center"> Para cada péptido el programa calcula: Peso molecular, Carga Neta, Hidrofobicidad, Índice de Boman, Índice Alifático, % de aminoácidos hidrofóbicos, Punto Isoeléctrico y tendencia de estructura secundaria</p></h4><br>
			<h4 p align="center"> Los péptidos (secuencia de aminoácidos en MAYÚSCULA) se pueden agregar de forma manual y en lista (un péptido por línea) o se puede cargar un archivo FASTA que contenga los péptidos en lista (péptido por línea).
			<h4 p style='margin-top: 0.5em' align="center"> <a style='color: #50992E; font-weight:bold; ' download="ejemplo.fasta" href='/gruposdeinvestigacion/prospeccionydisenobiomoleculas/InverPep/app2/fasta.fasta' > Archivo de ejemplo</a> </h4>
			<iframe width='100%' height='500px' src='https://ciencias.medellin.unal.edu.co/gruposdeinvestigacion/prospeccionydisenobiomoleculas/InverPep/app2/hola.cgi' ></iframe>
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
