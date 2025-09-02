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
                    <h1 class="csc-firstHeader">Ayuda</h1>
		</div>

			<div class="col-lg-12">
                    <ul id="myTab" class="nav nav-tabs nav-justified">
                        <li class="active">
                            <a href="#info" onclick='return false;' data-toggle="tab"><i class="fa fa-tree"></i>Información de la página</a>
                        </li>
                        <li class="">
                            <a href="#contacto" onclick='return false;' data-toggle="tab"><i class="fa fa-car"></i>Información de contacto</a>
                        </li>

                    </ul>

			<div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="info">
                            <br>

            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a class="normal" data-toggle="collapse" onclick='return false;' data-target="#A1" href="#Inverpep" aria-expanded="true" aria-controls="collapseOne">

                        <h4 class="panel-title">
                                InverPep

                        </h4>
                        </a>
                    </div>

                    <div id="A1" class="collapse">
                        <div class="well">
                            <p align="justify">
                                InverPep posee actualmente 702 AMPs experimentalmente validados provenientes de diferentes especies de invertebrados de los filos
								Artrópodos, Moluscos, Nematodos, Anélidos, Equinodermos, Platelmintos, Placozoa, Hydradae y el subfilo Tunicata. Todos estos
								péptidos se encuentran alojados en la base de datos junto con su información general (filo y especie de origen, nombre, tamaño),
								las propiedades fisicoquímicas (carga neta, hidrofobicidad, índice de Boman, índice alifático,  pI, porcentaje de aminoácidos
								hidrofóbicos y estructura secundaria, si es conocida), su actividad antimicrobiana y enlaces externos a la bibliografía.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-success ">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a class="normal" data-toggle="collapse" onclick='return false;' data-target="#A2" href="#Calcampi" aria-expanded="true" aria-controls="collapseOne">
                        <h4 class="panel-title">
                                CALCAMPI

                        </h4>
                        </a>
                    </div>

                    <div id="A2" class="collapse">
                        <div class="well">
                            <p align="justify">
                                Es una herramienta para calcular diferentes propiedades fisicoquímicas de múltiples péptidos al tiempo, se diseñó usando el
								lenguaje de programación PERL (versión 5.22.0.1) y luego se trasladó a PHP para integrarlo a la interfaz web de InverPep.
								El programa calcula peso molecular, carga neta a pH neutro, hidrofobicidad, índice de Boman, índice alifático, punto isoeléctrico
								y porcentaje de aminoácidos hidrofóbicos.<br>
								CALCAMPI requiere que se copien los péptidos listados en la plataforma o se tenga un archivo FASTA con la lista de los péptidos
								a ser analizados.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-success ">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a class="normal" data-toggle="collapse" onclick='return false;' data-target="#A3" href="#Obtencion" aria-expanded="true" aria-controls="collapseOne">
                        <h4 class="panel-title">
                                Obtención de datos

                        </h4>
                        </a>
                    </div>

                    <div id="A3" class="collapse">
                        <div class="well">
                            <p align="justify">
							<b>- Peso Molecular: </b>El peso molecular del péptido es la suma de las masas molares de todos los aminoácidos que lo conforman.<br><br>
							<b>- Carga Neta: </b>Para calcular la carga neta se usó la siguiente ecuación: <br>
							<center>
							<img alt="Ecuación de carga neta" src="{URL::to('/')}/assets/img/ec1.JPG" title="Ecuación de carga neta"/><br><br>
							</center>
							Donde Ni son los números y pKai los valores de pKa del N-terminal y las cadenas laterales de arginina, lisina e histidina; y el
							índice j pertenece al C-terminal y las cadenas laterales del ácido aspártico, ácido glutámico, cisteina y tirosina. Los valores de
							pKa usados para diseñar el algoritmo fueron tomados de Lehninger. La carga se calcula a pH neutro.<br>
							[Nelson, D., & Cox, M. (2008). Lehninger Principles of Biochemistry (5th edition ed.): W. H. Freeman.]<br><br>
							<b>- Hidrofobicidad: </b>La hidrofobicidad se representó en términos del gran promedio del valor de hidrofobicidad, calculado como la
							suma de los valores hidropáticos de todos los aminoácidos (tomados de la escala Kyte-Doolittle) dividido por el número de residuos de
							la secuencia. Valores positivos indican péptidos hidrofóbicos y negativos péptidos hidrofílicos.<br>
							El porcentaje de aminoácidos hidrofóbicos se calculó en base a la escala Kyte-Doolittle. Se define como la suma de residuos
							hidrofóbicos del péptido dividido por el número total de residuos.<br>
							[Kyte, J., & Doolittle, R. F. (1982). A simple method for displaying the hydropathic character of a protein. Journal of Molecular Biology,
							157(1), 105-132.]<br><br>
							<b>- Índice de Boman: </b>El índice de Boman se define como la suma de las energías libres de las cadenas laterales de los
							aminoácidos al transferirse de ciclohexano a agua dividido por el número de residuos del péptido. Puede servir como criterio para
							determinar el potencial de un péptido a unirse a una proteína o a una membrana.<br>
							[Radzicka, A., & Wolfenden, R. (1988). Comparing the polarities of the amino acids: side-chain distribution coefficients between the
							vapor phase, cyclohexane, 1-octanol, and neutral aqueous solution. Biochemistry, 27(5), 1664-1670.]<br><br>
							<b>- Índice alifático: </b>El índice alifático es el volumen relativo ocupado por las cadenas laterales alifáticas (alanina, valina,
							isoleucina y leucina). Valores positivos están asociados a un aumento de la termoestabilidad del péptido. Se calcula con la siguiente
							ecuación:<br><br>
							<center>
							<img alt="Índice alifático" src="{URL::to('/')}/assets/img/ec2.JPG" title="Índice alifático"/><br><br>
							</center>
							Donde XA, XV, XI y XL son los porcentajes molares (100 por fracción mol) de alanina, valina, isoleucina y leucina.
							Y a = 2.9 y b =3.9 son coeficientes estándares.<br>
							[Ikai, A. (1980). Thermostability and Aliphatic Index of Globular Proteins. Journal of Biochemistry, 88(6), 1895-1898.]<br><br>
							<b>- Punto isoeléctrico: </b>El punto isoeléctrico (pI) es el pH donde la carga neta es igual a cero. El pI se determinó usando un
							algoritmo en serie que calcula todas las posibles cargas netas al modificar el pH, el programa se detiene cuando encuentra el valor
							de pH con la carga neta más cercana a 0.<br><br>
							</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a class="normal" data-toggle="collapse" onclick='return false;' data-target="#A4" href="#Links" aria-expanded="true" aria-controls="collapseOne">
                        <h4 class="panel-title">
                                Links útiles
                        </h4>
                        </a>
                    </div>

                    <div id="A4" class="collapse">
                        <div class="well">
                            <p align="justify">
								<h3>Blast</h3><br>
							Blast busca regiones similares entre secuencias. El programa compara secuencias de nucleótidos o proteínas con secuencias de bases de
							datos y calcula la significancia estadística entre ellos.<br><br>
							<a href="http://www.rcsb.org/" target="_new">http://www.rcsb.org/</a>
							<br><br>
							[Altschul, S.F., Gish, W., Miller, W., Myers, E.W. & Lipman, D.J. (1990). Basic local alignment search tool. J. Mol. Biol. 215:403-410]
							<br><br>
							</p>

							<p align="justify">
								<h3>Protein Data Bank (PDB)</h3><br>
							PDB es una base de datos de estructuras tridimensionales de moléculas biológicas, tales como proteínas y nucleótidos.<br><br>
							<a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi" target="_new">http://blast.ncbi.nlm.nih.gov/Blast.cgi</a>
							<br><br>
							[H.M. Berman, J. Westbrook, Z. Feng, G. Gilliland, T.N. Bhat, H. Weissig, I.N. Shindyalov, P.E. Bourne (2000). The Protein Data Bank.
							Nucleic Acids Research, 28: 235-242.]
							<br><br>
							</p>

							<p align="justify">
								<h3>UniProt</h3><br>
							UniProt es un espacio que proporciona información libre, de alta calidad y fácil comprensión de secuencias de proteína y sus funciones.<br><br>
							<a href="http://www.uniprot.org/" target="_new">http://www.uniprot.org/</a>
							<br><br>
							[The UniProt, C. (2015). UniProt: a hub for protein information. Nucleic Acids Research, 43(D1), D204-D212.]
							<br><br>
							</p>

							<p align="justify">
								<h3>Expasy</h3><br>
							ExPASy es un portal que proporciona bases de datos científicas y herramientas computacionales de diferentes áreas de las ciencias
							biológicas, incluyendo proteómica, genómica, filogenia, genética poblacional, transcriptómica, etc.<br><br>
							<a href="http://www.expasy.org/" target="_new">http://www.expasy.org/</a>
							<br><br>
							[Artimo P, Jonnalagedda M, Arnold K, Baratin D, Csardi G, de Castro E, Duvaud S, Flegel V, Fortier A, Gasteiger E, Grosdidier A,
							Hernandez C, Ioannidis V, Kuznetsov D, Liechti R, Moretti S, Mostaguir K, Redaschi N, Rossier G, Xenarios I, and Stockinger H (2012).
							ExPASy: SIB bioinformatics resource portal, Nucleic Acids Res, 40(W1):W597-W603.]
							<br><br>
							</p>

							<p align="justify">
								<h3>HeliQuest</h3><br>
							HeliQuest calcula desde la secuencia de aminoácidos de una hélice (α-hélix, 3-10 hélix, 3-11 hélix o π hélix) sus propiedades
							fisicoquímicas. Con estos resultados realiza una búsqueda en bases de datos para identificar proteínas que posean segmentos
							similares.<br><br>
							<a href="http://heliquest.ipmc.cnrs.fr/" target="_new">http://heliquest.ipmc.cnrs.fr/</a>
							<br><br>
							[Gautier R., Douguet D., Antonny B. and Drin G (2008). HELIQUEST: a web server to screen sequences with specific α-helical
							properties. Bioinformatics, 24(18):2101-2.]
							<br><br>
							</p>

							<p align="justify">
								<h3>APD</h3><br>
							The Antimicrobial Peptide Database.<br><br>
							<a href="http://aps.unmc.edu/AP/main.php" target="_new">http://aps.unmc.edu/AP/main.php</a>
							<br><br>
							[Wang, G., Li, X. and Wang, Z. (2009) APD2: the updated antimicrobial peptide database and its application in peptide design.
							Nucleic Acids Research 37, D933-D937.
							<br><br>
							</p>

							<p align="justify">
								<h3>CAMP</h3><br>
							Collection of Anti-Microbial Peptides.<br><br>
							<a href="http://www.camp.bicnirrh.res.in/index.php" target="_new">http://www.camp.bicnirrh.res.in/index.php</a>
							<br><br>
							[Waghu FH, Barai RS, Gurung P, Idicula-Thomas S (2015). CAMPR3: a database on sequences, structures and signatures of antimicrobial
							peptides. Nucleic Acids Re,  gkv1051v1-gkv1051.]
							<br><br>
							</p>

							<p align="justify">
								<h3>YADAMP</h3><br>
							Yet another db of antimicrobial peptides.<br><br>
							<a href="http://yadamp.unisa.it/default.aspx" target="_new">http://yadamp.unisa.it/default.aspx</a>
							<br><br>
							[Piotto, S. P., Sessa, L., Concilio, S., & Iannelli, P. (2012). YADAMP: yet another database of antimicrobial peptides.
							International Journal of Antimicrobial Agents, 39(4), 346-351.]
							<br><br>
							</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a class="normal" data-toggle="collapse" onclick='return false;' data-target="#A5" href="#Glosario" aria-expanded="true" aria-controls="collapseOne">
                        <h4 class="panel-title">
                               Glosario
                        </h4>
                        </a>
                    </div>

                    <div id="A5" class="collapse">
                        <div class="well">
                            <p align="justify">
							<b>- AMP: </b>Antimicrobial Peptides. Péptidos con actividad sobre algún microorganismo. E.g. Cecropinas.<br><br>
							<b>- Actividad: </b>Es la acción que tiene el péptido sobre un grupo de microorganismos. La actividad antimicrobiana puede ser
							específica para un solo tipo de microorganismos o puede afectar a más de un grupo de organismos. E.g. Antiviral. <br><br>
							<b>- Código InverPep: </b>código asignado por InverPep para cada uno de sus registros. E.g. 1.<br><br>
							<b>- Especie de origen: </b>especie de donde se obtuvo el péptido. E.g. <i>Drosophila melanogaster</i><br><br>
							<b>- Estructura secundaria: </b>Plegamiento del péptido debido a las interacciones formadas por las cadenas laterales de los
							aminoácidos. E.g. Hélice alfa. <br><br>
							<b>- Filo de origen: </b>Filo al que pertenece la especie de donde se obtuvo el péptido. E.g. Artrópodo.<br><br>
							<b>- Invertebrados: </b>todos aquellos organismos que no se encuentran dentro del subfilo de los vertebrados; es decir, todos
							aquellos que carecen de columna vertebral y de esqueleto interno articulado. E.g. Moluscos.<br><br>
							<b>- Nombre del péptido: </b>nombre con el que se encuentra el péptido identificado en la bibliografía. E.g. Big Defensin.<br><br>
							<b>- Secuencia: </b>estructura primaria del péptido. Código de letras asociadas a los aminoácidos. E.g. ESTEVAN.<br><br>
							<b>- Tamaño: </b>Número de aminoácidos que conforman un péptido. E.g. 15 aminoácidos.<br><br>
							</p>
                        </div>
                    </div>
                </div>
            </div>

			  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a class="normal" data-toggle="collapse" onclick='return false;' data-target="#A6" href="#Citarla" aria-expanded="true" aria-controls="collapseOne">
                        <h4 class="panel-title">
                               La base de datos me ha sido útil, ¿Cómo puedo citarla?
                        </h4>
                        </a>
                    </div>

                    <div id="A6" class="collapse">
                        <div class="well">
                            <p align="justify"> Puedes citar InverPep usando la siguiente citación: <br><br>
							<b>Gómez EA, Giraldo P, Orduz S. InverPep: a database of invertebrates antimicrobial peptides. J Glob Antimicrob Resist 2017; 8:13-17. </b>
							</p>
                        </d
