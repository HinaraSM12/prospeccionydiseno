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
                    <h1 class="csc-firstHeader">Help</h1>
		</div>

			<div class="col-lg-12">
                    <ul id="myTab" class="nav nav-tabs nav-justified">
                        <li class="active">
                            <a href="#info" onclick='return false;' data-toggle="tab"><i class="fa fa-tree"></i>Website information</a>
                        </li>
                        <li class="">
                            <a href="#contacto"  onclick='return false;' data-toggle="tab"><i class="fa fa-car"></i>Contact information</a>
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
                                InverPep has at the moment 702 AMPs experimentally validated from different species and phylum of invertebrates. The peptides
								derived from the phylum Arthropod, Mollusca, Nematode, Annelida, Echinodermata, Platyhelminthes, Placozoa, Hydradae and the
								subphylum Tunichata. All the peptides are allowed in the database with their general information (phylum and species source,
								name, and length), the physicochemical properties (charge, hydrophobicity, Boman index, aliphatic index, pI, percentage of
								hydrophobic amino acids and secondary structure, if it’s known). The target organism and external link to scientific literature
								are also included.
							</p>
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
                                CALCAMPI is a physicochemical properties calculator of multiple peptides. It was design using the programming language Perl
								(version 5.22.0.1) and later it was translated to PHP to be integrated into the InverPep’s web interface. CALCAMPI calculates
								molar mass, charge, hydrophobicity, Boman index, aliphatic index, isoelectric point and percentage of hydrophobic amino acids.<br>
								CALCAMPI requires a peptide list on FASTA format or an uploaded FASTA file.
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
                                Data collection

                        </h4>
                        </a>
                    </div>

                    <div id="A3" class="collapse">
                        <div class="well">
                            <p align="justify">
							<b>- Molar mass: </b>The peptide’s molar mass is the sum of the molar mass of all the peptide’s amino acids.<br><br>
							<b>- Charge: </b>To calculate the charge it was used the following equation: <br>
							<center>
							<img alt="Ecuación de carga neta" src="{URL::to('/')}/assets/img/ec1.JPG" title="Ecuación de carga neta"/><br><br>
							</center>
							Where Ni are the number, and pKai the pKa values, of the N-terminus and the side chains of Arginine, Lysine, and Histidine. The
							j-index pertains to the C-terminus and the Aspartic Acid, Glutamic Acid, Cysteine, Tyrosine amino acids. The charge is calculated
							at three different pH, 5, 7, and 9. A quick inspection to the database reveals that, mainly because the great variation in lysine,
							the charge of certain peptides can largely vary at different pH.<br>
							[Nelson, D., & Cox, M. (2008). Lehninger Principles of Biochemistry (5th edition ed.): W. H. Freeman.]<br><br>
							<b>- Hydrophobicity: </b>The hydrophobicity was represented in terms of the grand average of hydrophobicity. It’s calculated as the
							sum of the hydropathic values of each amino acid (the values are taking from the Kyte-Doolittle scale) and divided by the total
							number of residues. Positive values indicate hydrophobic peptides and negative values indicate hydrophilic peptides.<br>
							The percentage of hydrophobic amino acids was calculated as the sum of the hydrophobic residues (Kyte-Doolittle scale) from the
							peptide and divided by the total number of the residues.<br>
							[Kyte, J., & Doolittle, R. F. (1982). A simple method for displaying the hydropathic character of a protein. Journal of Molecular Biology,
							157(1), 105-132.]<br><br>
							<b>- Boman index: </b>The Boman index is the sum of the free energies of the respective side chains for transfer from cyclohexane to
							water and divided by the total number of the residues of the peptide. The Boman index can be seen as the potencial of a peptide
							binding to a protein or a membrane.<br>
							[Radzicka, A., & Wolfenden, R. (1988). Comparing the polarities of the amino acids: side-chain distribution coefficients between the
							vapor phase, cyclohexane, 1-octanol, and neutral aqueous solution. Biochemistry, 27(5), 1664-1670.]<br><br>
							<b>- Aliphatic index: </b>The aliphatic index is the relative volume occupied for the aliphatic side chains of amino acids alanine,
							valine, isoleucine and leucine. Positive values are associated with thermostability of the peptide. It’s calculated with the
							following equation: <br><br>
							<center>
							<img alt="Índice alifático" src="{URL::to('/')}/assets/img/ec2.JPG" title="Índice alifático"/><br><br>
							</center>
							Where XA, XV, XI y XL are the mole percent (100 per mol fraction) of alanine, valine, isoleucine and leucine. And  a = 2.9 y b =3.9
							are standard coefficients.<br>
							[Ikai, A. (1980). Thermostability and Aliphatic Index of Globular Proteins. Journal of Biochemistry, 88(6), 1895-1898.]<br><br>
							<b>- Isoelectric point: </b>The pI is the pH where the peptide charge is equal to zero. The pI was determined using an algorithm that
							calculated all the possible charges when the pH is changed, the program stops when it founds the pH value with the peptide charge
							equal to zero.<br><br>
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
                                Useful links
                        </h4>
                        </a>
                    </div>

                    <div id="A4" class="collapse">
                        <div class="well">
                            <p align="justify">
								<h3>Blast</h3><br>
							The Basic Local Alignment Search Tool finds regions of local similarity between sequences. The program compares nucleotide or protein
							sequences to sequence databases and calculates the statistical significance of matches.<br><br>
							<a href="http://www.rcsb.org/" target="_new">http://www.rcsb.org/</a>
							<br><br>
							[Altschul, S.F., Gish, W., Miller, W., Myers, E.W. & Lipman, D.J. (1990). Basic local alignment search tool. J. Mol. Biol. 215:403-410]
							<br><br>
							</p>

							<p align="justify">
								<h3>Protein Data Bank (PDB)</h3><br>
							PDB is a crystallographic database for the three-dimensional structural data of large biological molecules, such as proteins and nucleic
							acids.<br><br>
							<a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi" target="_new">http://blast.ncbi.nlm.nih.gov/Blast.cgi</a>
							<br><br>
							[H.M. Berman, J. Westbrook, Z. Feng, G. Gilliland, T.N. Bhat, H. Weissig, I.N. Shindyalov, P.E. Bourne (2000). The Protein Data Bank.
							Nucleic Acids Research, 28: 235-242.]
							<br><br>
							</p>

							<p align="justify">
								<h3>UniProt</h3><br>
							UniProt is a space that provides a comprehensive, high-quality and freely accessible resource of protein sequence and functional information.<br><br>
							<a href="http://www.uniprot.org/" target="_new">http://www.uniprot.org/</a>
							<br><br>
							[The UniProt, C. (2015). UniProt: a hub for protein information. Nucleic Acids Research, 43(D1), D204-D212.]
							<br><br>
							</p>

							<p align="justify">
								<h3>Expasy</h3><br>
							ExPASy is the SIB Bioinformatics Resource Portal which provides access to scientific databases and software tools (i.e., resources)
							in different areas of life sciences including proteomics, genomics, phylogeny, systems biology, population genetics, transcriptomics
							etc.<br><br>
							<a href="http://www.expasy.org/" target="_new">http://www.expasy.org/</a>
							<br><br>
							[Artimo P, Jonnalagedda M, Arnold K, Baratin D, Csardi G, de Castro E, Duvaud S, Flegel V, Fortier A, Gasteiger E, Grosdidier A,
							Hernandez C, Ioannidis V, Kuznetsov D, Liechti R, Moretti S, Mostaguir K, Redaschi N, Rossier G, Xenarios I, and Stockinger H (2012).
							ExPASy: SIB bioinformatics resource portal, Nucleic Acids Res, 40(W1):W597-W603.]
							<br><br>
							</p>

							<p align="justify">
								<h3>HeliQuest</h3><br>
							HeliQuest calculates from the amino acid sequence of a helix (α-helix, 3-10 helix, 3-11 helix or π helix) its physicochemical
							properties and amino acid composition and uses the results to screen any databank in order to identify protein segments possessing
							similar features.<br><br>
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
                               Glossary
                        </h4>
                        </a>
                    </div>

                    <div id="A5" class="collapse">
                        <div class="well">
                            <p align="justify">
							<b>- Activity: </b>Target organisms of the antimicrobial peptide. The antimicrobial activity can be specific to a single organisms
							or a large group of them. E.g. Antiviral activity.<br><br>
							<b>- AMP: </b>Antimicrobial Peptides. Peptides with activity against microorganisms. E.g. Cecropins.<br><br>
							<b>- InverPep code: </b>code assigned by InverPep for each peptide in the database. E.g. 1.<br><br>
							<b>- Invertebrates: </b>organisms that don’t belong of the vertebrates’ subphylum; organisms that neither possess nor develop a
							vertebral column, derived from the notochord. E.g. Mollusks.<br><br>
							<b>- Length: </b>residue´s number of the peptide. E.g. 15 amino acids. <br><br>
							<b>- Peptide name: </b>name of the antimicrobial peptide in the scientific literature. E.g. Big Defensin.<br><br>
							<b>- Phylum: </b>Phylum of the source organism of the AMP. E.g. Arthropod.<br><br>
							<b>- Secondary structure: </b>is the specific geometric shape caused by intramolecular and intermolecular hydrogen bonding of amide
							groups. E.g. Alpha helix.<br><br>
							<b>- Sequence: </b>primary structure of the peptide. Letters code associated to the amino acids. E.g. ESTEVAN.<br><br>
							<b>- Source species: </b>Scientific name of the source organism of the antimicrobial peptide. E.g. <i>Drosophila melanogaster.</i><br><br>
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
                               The database had been useful to me, How can I quote it?
                        </h4>
                        </a>
                    </div>

                    <div id="A6" class="collapse">
                        <div class="well">
                            <p align="justify"> You can quote InverPep using the next citation: <br><br>
							<b>Gómez EA, Giraldo P, Orduz S. InverPep: a database of invertebrates antimicrobial peptides. J Glob Antimicrob Resist 2017; 8:13-17. </b>
							</p>
                        </div>
                    </div>
                </div>
            </div>

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a class="normal" data-toggle="collapse" onclick='return false;' data-target="#A7" href="#Citarla" aria-expanded="true" aria-controls="collapseOne">
                        <h4 class="panel-title">
                               I want to colaborate and upload a new peptide to InverPep, ¿How can I do it?
                        </h4>
                        </a>
                    </div>

                    <div id="A7" class="collapse">
                        <div class="well">
                            <p align="justify"> Thank your for wanting to contribute with InverPep. To upload new peptides you can follow the next link and complete the cuestionary: <a href="https://goo.gl/forms/rPPyL8S5jYMUidXH2" target="_blank" style="color:blue">Cuestionary </a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a class="normal" data-toggle="collapse" onclick='return false;' data-target="#A8" href="#PubMed" aria-expanded="true" aria-controls="collapseOne">
                        <h4 class="panel-title">
                               Does the database contain links to PubMed for every peptide in it?
                        </h4>
                        </a>
                    </div>

                    <div id="A8" class="collapse">
                        <div class="well">
                            <p align="justify">All the InverPep's peptides had been experimentally validated and in the information pages of each one you can find a link to the scientific literature that contains this comprobation </p>
                        </div>
                    </div>
                </div>
            </div>

			</div>

			<div class="tab-pane fade" id="contacto">
                            <br>

							<h2>Contacts</h2>
							<br>
							<h4 p align="center">Grupo de Biología Funcional<br>
							Research's area of Ecología y Sistemática de Insectos <br>
                            Facultad de Ciencias<br>
							Universidad Nacional de Colombia - Sede Medellín</p></h4>
							<br><br><br>
							<h2>Contact</h2>
							<br>
							<h4 p align="center">Sergio Orduz, Biol., M.Sc., Ph.D.<br>
							Coordinator of Grupo de Biología Funcional<br>
							sorduzp@unal.edu.co / 4306395 / Laboratory of Prospección y Diseño de Biomoléculas (Bl 16 - 211)</p></h4>
							<br><br><br>
							<h2>Participants</h2>
							<br>
							<table class="table table-bordered" border="2">

								<h4 align="center"><b>InverPep</b></h4>
								<br>
								<thead>
									<tr class="success">
										<th>Creation and manual annotation</th>
										<th>CALCAMPI</th>
										<th>Interface design</th>
										<th>Relization web database</th>
									</tr>
								</thead>
									<tr class="success">
										<td rowspan="2" align="center">Esteban Gómez<br>Paula Andrea Giraldo</td>
										<td align="center">Esteban Gómez</td>
										<td align="center">Esteban Gómez<br>Juan David Cadavid Q.<br>Ricardo Mesa F.</td>
										<td rowspan="2" align="center">Juan David Cadavid Q.<br>Ricardo Mesa F.<br> Esteban Gómez</td>
									</tr>
									</tbody>
								</table>
                            <form class="form-horizontal">


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
