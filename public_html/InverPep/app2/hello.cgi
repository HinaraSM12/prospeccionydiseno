#!/usr/bin/perl -w


use CGI;
$query = new CGI;
$secuencia = $query->param('secuencia');


use MIME::Base64;
print "Content-type:text/html\n\n";

print "<html><head><style>
				*{font-family: arial} 
				.row_form{margin: 20px}
				label{min-width: 200px;
				display: block;
				float: left;
				font-weight: bold;
				}
				
				table{
					border: 1px solid #999;
					width:90%;
					margin: 0 auto;
					margin: 1em;
					text-align: center;

				
				}
				
				table td,table th{
					margin-top: 5px;;
					margin-bottom: 5px
				}
				</style></head><body>";
print "<form>	<div class='row_form'> <label>Fasta File:</label>  
					<input type = 'file' name='fasta' id='fasta' ></div>
				<div class='row_form'><label>Sequence:</label> 
				<textarea  name='secuencia' id='secuencia' cols='50' rows='10'>".$secuencia."</textarea><br/><input type='submit' value='Submit'></div></form>";
if($secuencia ne ''){
	


print "<h3>Results</h3>";
#Parte 1: Abrir el archivo Fasta:
#$archivo = "fasta.fasta";
#open(SECUENCIA, $archivo);
#@archivo = <SECUENCIA>;
#close SECUENCIA; 

@archivo = split /\n/, $secuencia;

#Parte 2: Propiedades:
for ($i=0;$i<scalar @archivo; ++$i) {
	@archivo[$i]=~ s/\n//g;
	@archivo[$i]=~ s/\s//g; #Eliminar espacios vacios
	$pep = @archivo[$i];
    $Lg = length $pep;
	$SQ=SQ(@archivo[$i]);
	if ($SQ eq $Lg) {
	$PM = PM(@archivo[$i]); #Subrutina 1: Calcular el peso molecular
	$CN = CN(@archivo[$i]); #Subrutina 2: Calcular la carga neta
	if($CN eq '-0.0') {$CN=0;}
	$COM = COM(@archivo[$i]); #Subrutina 3: Calcular la hidrofobicidad
	$IB = IB(@archivo[$i]); #Subrutina 4: Calcular Indice de Boman
	$IA = IA(@archivo[$i]); #Subrutina 5: Calcular Indice Alifatico
	$H = HH(@archivo[$i]); #Subrutina 6: % a.as hidrofobicos
	$PI = PI(@archivo[$i]); #Subrutina 7: Calcular PI
	$ES= ES(@archivo[$i]); #Subrutina 8: Estructura secundaria 
	print "
	<table style='width:900px'>
	<tr><th>Peptide</th><td colspan='6' style='word-break: break-all;'>$pep</td>
	<tr><th>#a.as:</th><td>$Lg</td>
	<th>Molecular Weigth:</th><td>$PM</td>
	<th>Isoelectric point</th><td>$PI</td>
	</tr><tr>
	<th>Net Charge:</th><td>$CN</td>
	<th>Hidrophobicity:</th><td>$COM</td>
	<th>Boman index:</th><td>$IB</td>
	<th></th><td></td>
	</tr>
	
	<tr>
	<th>Aliphatic index:</th><td>$IA</td>
	<th>% hydrophobic amino acids</th><td>$H</td>
	
	</tr>
		<tr><td colspan='6'>$ES</td></tr>

	</table>
			      ";
	#@print[$i]= "<br> Peptido $pep <br> #a.as: $Lg \t Peso Molecular: $PM \t Carga Neta: $CN <br> Hidrofobicidad: $COM \t Indice de Boman: $IB \n Indice Alifatico: $IA \t % a.as hidrofobicos: $H \t pI: $PI <br> $ES <br>";
			}
	else {
	print "
	<table style='width:900px'>
	<tr><th>ERROR</th></tr>
	<tr><td colspan='6' style='word-break: break-all;' align='center';>$pep</td></tr>
	<tr><th>The sequence is not recognized as an amino acid sequence, verify that it only contains associated letters to amino acids</th>
	</tr>

	</table>
	";
	#@print[$i]= "\n Peptido $pep \n No se reconoce como una secuencia de aminoacidos, verifique que solo contiene letras asociadas a aminoacidos \n";
	}
#Parte 3: Archivos de salida:
	}
#open OUTPUT, ">prueba.doc";
#print OUTPUT "@print";
end;

#SUBRUTINA 0:
#Determinar si es una secuencia de aminoacidos
sub SQ {
my($j);
my($SQ)=0;
my($pep)=@_;
for($j=0; $j<length $pep;++$j) {
				if (substr($pep,$j,1)  eq'A') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'R') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'N') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'D') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'C') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'E') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'Q') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'G') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'H') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'I') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'L') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'K') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'M') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'F') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'P') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'S') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'T') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'W') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'Y') {$SQ=$SQ+1;}
				elsif (substr($pep,$j,1)  eq'V') {$SQ=$SQ+1;}
									}
		return $SQ;
}

#SUBRUTINA 1:
#Determinar Peso Molecular
sub PM {
my($j);
my($PM) = 0;
my($PMs) = 0; 
my($pep)=@_;
for($j=0; $j<length $pep;++$j) {
				if (substr($pep,$j,1)  eq'A') {$PM=$PM+71.0788;}
				elsif (substr($pep,$j,1)  eq'R') {$PM=$PM+156.1876;}
				elsif (substr($pep,$j,1)  eq'N') {$PM=$PM+114.1039;}
				elsif (substr($pep,$j,1)  eq'D') {$PM=$PM+115.0886;}
				elsif (substr($pep,$j,1)  eq'C') {$PM=$PM+103.1448;}
				elsif (substr($pep,$j,1)  eq'E') {$PM=$PM+129.1155;}
				elsif (substr($pep,$j,1)  eq'Q') {$PM=$PM+128.1308;}
				elsif (substr($pep,$j,1)  eq'G') {$PM=$PM+57.052;}
				elsif (substr($pep,$j,1)  eq'H') {$PM=$PM+137.1412;}
				elsif (substr($pep,$j,1)  eq'I') {$PM=$PM+113.1595;}
				elsif (substr($pep,$j,1)  eq'L') {$PM=$PM+113.1595;}
				elsif (substr($pep,$j,1)  eq'K') {$PM=$PM+128.1742;}
				elsif (substr($pep,$j,1)  eq'M') {$PM=$PM+131.1986;}
				elsif (substr($pep,$j,1)  eq'F') {$PM=$PM+147.1766;}
				elsif (substr($pep,$j,1)  eq'P') {$PM=$PM+97.1167;}
				elsif (substr($pep,$j,1)  eq'S') {$PM=$PM+87.0782;}
				elsif (substr($pep,$j,1)  eq'T') {$PM=$PM+101.1051;}
				elsif (substr($pep,$j,1)  eq'W') {$PM=$PM+186.2133;}
				elsif (substr($pep,$j,1)  eq'Y') {$PM=$PM+163.1760;}
				elsif (substr($pep,$j,1)  eq'V') {$PM=$PM+99.1326;}
									}
		$PMs=sprintf("%.2f",$PM+1.0079+17.0073);
		return $PMs;
		 }
#SUBRUTINA 2:
#Determinar Carga Neta a pH neutro
sub CN {
my($j);
my($CN)=0;
my($CNi)=0;
my($CNj)=0;
my($pep)=@_;
for($j=0; $j<length $pep; ++$j) {
			if(substr($pep,$j,1) eq 'R') {$CNi=$CNi+((10**12.48)/((10**7)+(10**12.48)));}
			elsif(substr($pep,$j,1) eq 'K') {$CNi=$CNi+((10**10.79)/((10**7)+(10**10.79)));}
			elsif(substr($pep,$j,1) eq 'H') {$CNi=$CNi+((10**6.04)/((10**7)+(10**6.04)));}
			elsif(substr($pep,$j,1) eq 'D') {$CNj=$CNj+((10**7)/((10**7)+(10**3.86)));}
			elsif(substr($pep,$j,1) eq 'E') {$CNj=$CNj+((10**7)/((10**7)+(10**4.25)));}
			elsif(substr($pep,$j,1) eq 'C') {$CNj=$CNj+((10**7)/((10**7)+(10**8.33)));}
			elsif(substr($pep,$j,1) eq 'Y') {$CNj=$CNj+((10**7)/((10**7)+(10**10.07)));}
			else{$CNi=$CNi;$CNj=$CNj;}
								}
			$CNi=$CNi+((10**9.69)/((10**7)+(10**9.69)));
			$CNj=$CNj+((10**7)/((10**7)+(10**2.34)));
			$CN=sprintf("%.1f",$CNi-$CNj);
			return $CN;
		}
#SUBRUTINA 3:
#Determinar la hidrofobicidad del péptido
sub COM {
my ($j)=0;
my ($Ky)=0;
my ($pep)=@_;
my ($com)=0;	 
for($j=0; $j<length $pep;++$j) {
				if (substr($pep,$j,1)  eq 'A') {$Ky=$Ky+1.8;}
				elsif (substr($pep,$j,1)  eq'I') {$Ky=$Ky+4.5;}
				elsif (substr($pep,$j,1)  eq'L') {$Ky=$Ky+3.8;}
				elsif (substr($pep,$j,1)  eq'W') {$Ky=$Ky-0.9;}
				elsif (substr($pep,$j,1)  eq'F') {$Ky=$Ky+2.8;}
				elsif (substr($pep,$j,1)  eq'V') {$Ky=$Ky+4.2;}	 
				elsif (substr($pep,$j,1)  eq'M') {$Ky=$Ky+1.9;}
				elsif (substr($pep,$j,1)  eq'Y') {$Ky=$Ky-1.3;}
				elsif (substr($pep,$j,1)  eq'P') {$Ky=$Ky-1.6;}
				elsif (substr($pep,$j,1)  eq'T') {$Ky=$Ky-0.7;}
				elsif (substr($pep,$j,1)  eq'S') {$Ky=$Ky-0.8;}
				elsif (substr($pep,$j,1)  eq'C') {$Ky=$Ky+2.5;}
				elsif (substr($pep,$j,1)  eq'G') {$Ky=$Ky-0.4;}
				elsif (substr($pep,$j,1)  eq'N') {$Ky=$Ky-3.5;}
				elsif (substr($pep,$j,1)  eq'D') {$Ky=$Ky-3.5;}
				elsif (substr($pep,$j,1)  eq'Q') {$Ky=$Ky-3.5;}
				elsif (substr($pep,$j,1)  eq'E') {$Ky=$Ky-3.5;}
				elsif (substr($pep,$j,1)  eq'H') {$Ky=$Ky-3.2;}
				elsif (substr($pep,$j,1)  eq'K') {$Ky=$Ky-3.9;}
				elsif (substr($pep,$j,1)  eq'R') {$Ky=$Ky-4.5;}
								}
		$Ky=sprintf("%.2f",$Ky/length $pep);
		
				if ($Ky>=0) {$com="$Ky -> Peptido Hidrofobico";}
				elsif ($Ky<0) {$com="$Ky -> Peptido Hidrofilico";}
		return $com;
		}
#SUBRUTINA 4:
#Calcular el Indice de Boman (Kcal/mol) a pH neutro
sub IB {
my ($j)=0;
my ($IB)=0;
my ($pep)=@_;	 
for($j=0; $j<length $pep;++$j) {
				if (substr($pep,$j,1)  eq'A') {$IB=$IB+1.81;}
				elsif (substr($pep,$j,1)  eq'I') {$IB=$IB+4.92;}
				elsif (substr($pep,$j,1)  eq'L') {$IB=$IB+4.92;}
				elsif (substr($pep,$j,1)  eq'W') {$IB=$IB+2.33;}
				elsif (substr($pep,$j,1)  eq'F') {$IB=$IB+2.98;}
				elsif (substr($pep,$j,1)  eq'V') {$IB=$IB+4.04;}	 
				elsif (substr($pep,$j,1)  eq'M') {$IB=$IB+2.35;}
				elsif (substr($pep,$j,1)  eq'Y') {$IB=$IB-0.14;}
				elsif (substr($pep,$j,1)  eq'P') {$IB=$IB;}
				elsif (substr($pep,$j,1)  eq'T') {$IB=$IB-2.57;}
				elsif (substr($pep,$j,1)  eq'S') {$IB=$IB-3.40;}
				elsif (substr($pep,$j,1)  eq'C') {$IB=$IB+1.28;}
				elsif (substr($pep,$j,1)  eq'G') {$IB=$IB+0.94;}
				elsif (substr($pep,$j,1)  eq'N') {$IB=$IB-6.64;}
				elsif (substr($pep,$j,1)  eq'D') {$IB=$IB-8.75;}
				elsif (substr($pep,$j,1)  eq'Q') {$IB=$IB-5.54;}
				elsif (substr($pep,$j,1)  eq'E') {$IB=$IB-6.81;}
				elsif (substr($pep,$j,1)  eq'H') {$IB=$IB-4.66;}
				elsif (substr($pep,$j,1)  eq'K') {$IB=$IB-5.55;}
				elsif (substr($pep,$j,1)  eq'R') {$IB=$IB-14.92;}
								}
		$IB=sprintf("%.2f",-$IB/length $pep);		
		return $IB;
		}
#SUBRUTINA 5:
#Calcular el Indice de Alifatico
sub IA {
my ($j)=0;
my ($IA)=0;
my($A)=0;
my($V)=0;
my($I)=0;
my($L)=0;
my($pep)=@_;	 
for($j=0; $j<length $pep;++$j) {
				if (substr($pep,$j,1)  eq'A') {++$A;}
				elsif (substr($pep,$j,1)  eq'I') {++$I;}
				elsif (substr($pep,$j,1)  eq'L') {++$L;}
				elsif (substr($pep,$j,1)  eq'V') {++$V;}
								}
			$A=sprintf("%.2f",($A/length $pep)*100);
			$I=sprintf("%.2f",($I/length $pep)*100);
			$L=sprintf("%.2f",($L/length $pep)*100);
			$V=sprintf("%.2f",($V/length $pep)*100);
			
			$IA=$A+(2.9*$V)+(3.9*($I+$L));
			return $IA;
		}
#Subrutina 6:
#% de aminoacidos hidrofobicos
sub HH {
my ($j)=0;
my ($H)=0;
my ($pep)=@_;
for($j=0; $j<length $pep;++$j) {
				if (substr($pep,$j,1)  eq 'A') {++$H;}
				elsif (substr($pep,$j,1)  eq'I') {++$H;}
				elsif (substr($pep,$j,1)  eq'L') {++$H;}
				elsif (substr($pep,$j,1)  eq'F') {++$H;}
				elsif (substr($pep,$j,1)  eq'V') {++$H;}	 
				elsif (substr($pep,$j,1)  eq'M') {++$H;}
				elsif (substr($pep,$j,1)  eq'C') {++$H;}
				elsif (substr($pep,$j,1)  eq'W') {++$H;}
								}
			$H=sprintf("%.2f",($H/length $pep)*100);
			return $H; 
			
		}
#Subrutina 7:
# Punto Isoelectrico
sub PI {
my($j);
my($i);
my (@CN)=0;
my($CN)=0;
my($PI)=0;
my($CNi)=0;
my($CNj)=0;
my($pep)=@_;
for($i=0; $i<=14; $i=$i+0.01) {
	for($j=0; $j<length $pep; ++$j) {
			if(substr($pep,$j,1) eq 'R') {$CNi=$CNi+((10**12.48)/((10**$i)+(10**12.48)));}
			elsif(substr($pep,$j,1) eq 'K') {$CNi=$CNi+((10**10.79)/((10**$i)+(10**10.79)));}
			elsif(substr($pep,$j,1) eq 'H') {$CNi=$CNi+((10**6.04)/((10**$i)+(10**6.04)));}
			elsif(substr($pep,$j,1) eq 'D') {$CNj=$CNj+((10**$i)/((10**$i)+(10**3.86)));}
			elsif(substr($pep,$j,1) eq 'E') {$CNj=$CNj+((10**$i)/((10**$i)+(10**4.25)));}
			elsif(substr($pep,$j,1) eq 'C') {$CNj=$CNj+((10**$i)/((10**$i)+(10**8.33)));}
			elsif(substr($pep,$j,1) eq 'Y') {$CNj=$CNj+((10**$i)/((10**$i)+(10**10.07)));}
			else{$CNi=$CNi;$CNj=$CNj;}
									}
			$CNi=$CNi+((10**9.69)/((10**$i)+(10**9.69)));
			$CNj=$CNj+((10**$i)/((10**$i)+(10**2.34)));
			$CN=sprintf("%.1f",$CNi-$CNj);
			if($CN>=-0.1) {
				if($CN <=0.1) {$PI=sprintf("%.1f",$i);}
						  }
			else {$i=$i;}
			$CNi=0;
			$CNj=0;
				}
	return $PI;
}
#Subrutina 8:
sub ES {
my($j)=0;
my($H)=0;
my($B)=0;
my($R)=0;
my($P)=0;
my($ES)=0;
my ($pep)=@_;
for($j=0; $j<length $pep;++$j) {
				if (substr($pep,$j,1)  eq 'A') {++$H;}
				elsif (substr($pep,$j,1)  eq'I') {++$B;}
				elsif (substr($pep,$j,1)  eq'L') {++$H;}
				elsif (substr($pep,$j,1)  eq'W') {++$B;}
				elsif (substr($pep,$j,1)  eq'F') {++$B;}
				elsif (substr($pep,$j,1)  eq'V') {++$B;}
				elsif (substr($pep,$j,1)  eq'M') {++$H;}
				elsif (substr($pep,$j,1)  eq'Y') {++$B;}
				elsif (substr($pep,$j,1)  eq'P') {++$R;}
				elsif (substr($pep,$j,1)  eq'T') {++$B;}
				elsif (substr($pep,$j,1)  eq'S') {++$R;}
				elsif (substr($pep,$j,1)  eq'C') {++$B;}
				elsif (substr($pep,$j,1)  eq'G') {++$R;}
				elsif (substr($pep,$j,1)  eq'N') {++$R;}
				elsif (substr($pep,$j,1)  eq'D') {++$R;}
				elsif (substr($pep,$j,1)  eq'Q') {++$H;}
				elsif (substr($pep,$j,1)  eq'E') {++$H;}
				elsif (substr($pep,$j,1)  eq'H') {++$H;}
				elsif (substr($pep,$j,1)  eq'K') {++$H;}
				elsif (substr($pep,$j,1)  eq'R') {++$H;}
								}
				
				$H=sprintf("%.1f",($H/length $pep)*100);
				$B=sprintf("%.1f",($B/length $pep)*100);
				$R=sprintf("%.1f",($R/length $pep)*100);
				
				if($H>$B) {
					if($H>$R){$P="Possibly Alpha Helix";}
					else{$P="No tendency to Alpha Helix or Beta Sheet";}
							}
				elsif($B>$H) {
					if($B>$R){$P="Possibly Beta Sheet";}
					else{$P="No tendency to Alpha Helix or Beta Sheet";}
							}
				else{$P="No tendency to Alpha Helix or Beta Sheet";}
				
				return $ES="%Alpha Helix $H  	%Beta sheet: $B 	%Turn/Coil: $R 	--> $P";			
}
}
			
			
			print "<script>// Check for the various File API support.
if (window.File && window.FileReader && window.FileList && window.Blob) {
   function readSingleFile(evt) {
    var f = evt.target.files[0]; 

    if (f) {
      var r = new FileReader();
      r.onload = function(e) { 
	      var contents = e.target.result;
		   
document.getElementById('secuencia').value = contents;
      }
      r.readAsText(f);
    } else { 
	document.getElementById('secuencia').value = '';
    }
  }

  document.getElementById('fasta').addEventListener('change', readSingleFile, false);
} else {
  alert('Su navegador no está soportado por la aplicación.');
}
</script>";
print "</body><html>";