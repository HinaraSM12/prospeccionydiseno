<?php
	//Get the aminoacids through post
	$aminoacids = trim($_POST['data']);

	//Convert the string in array
	$aminoacids = str_split($aminoacids);

	//Functions	
	function calculateCharge($aminoacids){

		$CNi = 0;
		$CNj = 0;

		foreach($aminoacids as $aminoacid){
			switch ($aminoacid){
				case "R":
					$CNi=$CNi+((10**12.48)/((10**7)+(10**12.48)));
					break;
				case "K":
					$CNi=$CNi+((10**10.79)/((10**7)+(10**10.79)));
					break;
				case "H":
					$CNi=$CNi+((10**6.04)/((10**7)+(10**6.04)));
					break;
				case "D":
					$CNj=$CNj+((10**7)/((10**7)+(10**3.86)));
					break;
				case "E":
					$CNj=$CNj+((10**7)/((10**7)+(10**4.25)));
					break;
				case "C":
					$CNj=$CNj+((10**7)/((10**7)+(10**8.33)));
					break;
				case "Y":
					$CNj=$CNj+((10**7)/((10**7)+(10**10.07)));
					break;
				default:
					break;

			}
		}

		$CNi=$CNi+((10**9.69)/((10**7)+(10**9.69)));
		$CNj=$CNj+((10**7)/((10**7)+(10**2.34)));

		//return sprintf("%.1f",$CNi-$CNj);
		return sprintf("%+d",round($CNi-$CNj));
	}

	function calculateIsoelectricPoint($aminoacids){
		$CNi = 0;
		$CNj = 0;
		$CN = 0;
		$PI = 0;

		if (!empty($aminoacids[0])){
			for($i = 0; $i<14; $i=$i+0.01){
				foreach($aminoacids as $aminoacid){
					switch($aminoacid){
						case "R":
							$CNi=$CNi+((10**12.48)/((10**$i)+(10**12.48)));
							break;
						case "K":
							$CNi=$CNi+((10**10.79)/((10**$i)+(10**10.79)));
							break;
						case "H":
							$CNi=$CNi+((10**6.04)/((10**$i)+(10**6.04)));
							break;
						case "D":
							$CNj=$CNj+((10**$i)/((10**$i)+(10**3.86)));
							break;
						case "E":
							$CNj=$CNj+((10**$i)/((10**$i)+(10**4.25)));
							break;
						case "C":
							$CNj=$CNj+((10**$i)/((10**$i)+(10**8.33)));
							break;
						case "Y":
							$CNj=$CNj+((10**$i)/((10**$i)+(10**10.07)));
							break;
					}
				}

				$CNi=$CNi+((10**9.69)/((10**$i)+(10**9.69)));
				$CNj=$CNj+((10**$i)/((10**$i)+(10**2.34)));
				$CN=sprintf("%.1f",$CNi-$CNj);

				if($CN>=-0.1) {
					if($CN <=0.1) {
						$PI=sprintf("%.1f",$i);
					}
				}

				$CNi=0;
				$CNj=0;
			}
		}

		return $PI;
	}
	
	function calculateHidrofobic($aminoacids){
		$H = 0;

		foreach($aminoacids as $aminoacid){
			switch($aminoacid) {
				case "A":
				case "I":
				case "L":
				case "F":
				case "V":
				case "M":
				case "C":
				case "W":
					++$H;
			}
		}

		return sprintf("%.2f",($H/sizeof($aminoacids))*100);
	}

	function calculateHidrofobicMomentum($aminoacids){

		$sen = 0;
		$cos = 0;
		$MH = 0;
		$MHr = 0;
		$i = 0;

		
		
		foreach($aminoacids as $aminoacid){
			$i++;
			switch($aminoacid){
				case "A":
					$sen=$sen+1.8*sin((($i+1)*100*pi())/180);
					$cos=$cos+1.8*cos((($i+1)*100*pi())/180);
					break;
				case "I":
					$sen=$sen+4.5*sin((($i+1)*100*pi())/180);
					$cos=$cos+4.5*cos((($i+1)*100*pi())/180);
					break;
				case "L":
					$sen=$sen+3.8*sin((($i+1)*100*pi())/180);
					$cos=$cos+3.8*cos((($i+1)*100*pi())/180);
					break;
				case "W":
					$sen=$sen-0.9*sin((($i+1)*100*pi())/180);
					$cos=$cos-0.9*cos((($i+1)*100*pi())/180);
					break;
				case "F":
					$sen=$sen+2.8*sin((($i+1)*100*pi())/180);
					$cos=$cos+2.8*cos((($i+1)*100*pi())/180);
					break;
				case "V":
					$sen=$sen+4.2*sin((($i+1)*100*pi())/180);
					$cos=$cos+4.2*cos((($i+1)*100*pi())/180);
					break;
				case "M":
					$sen=$sen+1.9*sin((($i+1)*100*pi())/180);
					$cos=$cos+1.9*cos((($i+1)*100*pi())/180);
					break;
				case "Y":
					$sen=$sen-1.3*sin((($i+1)*100*pi())/180);
					$cos=$cos-1.3*cos((($i+1)*100*pi())/180);
					break;
				case "P":
					$sen=$sen-1.6*sin((($i+1)*100*pi())/180);
					$cos=$cos-1.6*cos((($i+1)*100*pi())/180);
					break;
				case "T":
					$sen=$sen-0.7*sin((($i+1)*100*pi())/180);
					$cos=$cos-0.7*cos((($i+1)*100*pi())/180);
					break;
				case "S":
					$sen=$sen-0.8*sin((($i+1)*100*pi())/180);
					$cos=$cos-0.8*cos((($i+1)*100*pi())/180);
					break;
				case "C":
					$sen=$sen+2.5*sin((($i+1)*100*pi())/180);
					$cos=$cos+2.5*cos((($i+1)*100*pi())/180);
					break;
				case "G":
					$sen=$sen-0.4*sin((($i+1)*100*pi())/180);
					$cos=$cos-0.4*cos((($i+1)*100*pi())/180);
					break;
				case "N":
					$sen=$sen-3.5*sin((($i+1)*100*pi())/180);
					$cos=$cos-3.5*cos((($i+1)*100*pi())/180);
					break;
				case "D":
					$sen=$sen-3.5*sin((($i+1)*100*pi())/180);
					$cos=$cos-3.5*cos((($i+1)*100*pi())/180);
					break;
				case "Q":
					$sen=$sen-3.5*sin((($i+1)*100*pi())/180);
					$cos=$cos-3.5*cos((($i+1)*100*pi())/180);
					break;
				case "E":
					$sen=$sen-3.5*sin((($i+1)*100*pi())/180);
					$cos=$cos-3.5*cos((($i+1)*100*pi())/180);
					break;
				case "H":
					$sen=$sen-3.2*sin((($i+1)*100*pi())/180);
					$cos=$cos-3.2*cos((($i+1)*100*pi())/180);
					break;
				case "K":
					$sen=$sen-3.9*sin((($i+1)*100*pi())/180);
					$cos=$cos-3.9*cos((($i+1)*100*pi())/180);
					break;
				case "R":
					$sen=$sen-4.5*sin((($i+1)*100*pi())/180);
					$cos=$cos-4.5*cos((($i+1)*100*pi())/180);
					break;
			}
		}

		$MH= (1/sizeof($aminoacids))*((($sen**2)+($cos**2))**0.5);
		$MHr=sprintf("%.2f",($MH/2.88)*100);
		return $MHr;
	}

	function calculateBoman($aminoacids){
		$IB = 0;
		foreach($aminoacids as $aminoacid){
			switch($aminoacid){
				case "A":
					$IB=$IB+1.81;
					break;
				case "I":
				case "L":
					$IB=$IB+4.92;
					break;
				case "W":
					$IB=$IB+2.33;
					break;
				case "F":
					$IB=$IB+2.98;
					break;
				case "V":
					$IB=$IB+4.04;
					break;
				case "M":
					$IB=$IB+2.35;
					break;
				case "Y":
					$IB=$IB-0.14;
					break;
				case "T":
					$IB=$IB-2.57;
					break;
				case "S":
					$IB=$IB-3.40;
					break;
				case "C":
					$IB=$IB+1.28;
					break;
				case "G":
					$IB=$IB+0.94;
					break;
				case "N":
					$IB=$IB-6.64;
					break;
				case "D":
					$IB=$IB-8.75;
					break;
				case "Q":
					$IB=$IB-5.54;
					break;
				case "E":
					$IB=$IB-6.81;
					break;
				case "H":
					$IB=$IB-4.66;
					break;
				case "K":
					$IB=$IB-5.55;
					break;
				case "R":
					$IB=$IB-14.92;
					break;

			}
		}
		$IB=sprintf("%.2f",-$IB/sizeof($aminoacids));
		return $IB;	
	}



	echo json_encode(
		array(
			'charge' => calculateCharge($aminoacids),
			'isoelectricPoint' => calculateIsoelectricPoint($aminoacids),
			'hydrophobicAminoacids' => calculateHidrofobic($aminoacids),
			'hidrofobicMomentum' => calculateHidrofobicMomentum($aminoacids),
			'bomanIndex' => calculateBoman($aminoacids)
		)
	);

?>