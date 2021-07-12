

<?php
	require('libs/fpdf.php');
	require_once("db_connection.php");
	$db = new database_functions();
	if(isset($_GET['$ID']))
	{
	$vid=$_GET['$ID'];
	}
	

	class PDF extends FPDF{

		function Header(){
		    global $title;
		    $this->SetFont('Arial','B',45);
		    $this->SetDrawColor(0,80,180);
		    $this->SetFillColor(200,220,2558);
		    $this->SetTextColor(80,129,188);
		    $this->Cell(0,40,$title,0,1,'L',true);
		    $this->Image('img/logo.png',350,16,30);
		    $this->Ln(10);
		}

		function Footer(){
		    $this->SetY(-15);
		    $this->SetFont('Arial','I',8);
		    $this->SetTextColor(128);
		    $this->Cell(0,10,'Page '.$this->PageNo(),0,0,'C');
		}

		function Print_general_details($Details_info){
		     $this->AddPage();
		    foreach($Details_info as $row){
		    	$flag = true;
		        foreach($row as $col){
		        	if($flag == true){
		        		$this->SetFont('Arial','B',18);
		            	$this->Cell(80,20,"   ".$col,0,0,'L');
		            	$flag = false;	
		        	}else{
		            	$this->SetFont('Arial','',20);
		            	$this->Cell(200,20,"    ".$col,0,0,'L');
		            }
		        	

		        }
		        $this->Ln(10);
		       
		   	}
		    $this->Ln(10);
		    $this->Cell(0,0,"",1,0);
		}

		function print_table_wise($header){	
			 $this->SetFillColor(224,235,255);
   			 $this->SetTextColor(0);
   			 $fill = false;
			foreach($header as $row){
				$flag = true;
				foreach($row as $col){
			    	if($flag == true){
			    		$this->SetFont('Arial','B',18);
			        	$this->Cell(80,20,"   ".$col.":",1,0,'L',$fill);
			        	$flag = false;	
			    	}
			        else{
			        	$this->SetFont('Arial','',20);
			        	$this->SetFillColor(224,235,255);
			        	$this->Cell(200,20,"    ".$col,1,0,'L',$fill);
			        } 	
			    }
			    $this->Ln();	
			    $fill = !$fill;
			}

		}

	}	



	

	$patient_data = array();
	$patient_data = $db->get_patient_all_data($vid);
	$patient_data1 = $db->get_patient_all_data1($vid);
	$header = array
	(

		array("ID",$patient_data1[0]),
		array("BloodPressure",$patient_data1[1]),
		array("BloodSugar",$patient_data1[2]),
		array("Weight ",$patient_data1[3]),
		array("Temperature",$patient_data1[4]),
		array("MedicalPres ",$patient_data1[5]),
		array("Creation Date ",$patient_data1[6]),
	);

	$name = $patient_data[2];
	$email = $patient_data[3];
	$address = $patient_data[5];
	$gender = $patient_data[4];
	$age = $patient_data[6];
	
	$Details_info = array
	(
	array("Name : ",$name),
	array("Email : ",$email),
	
	array("Address : ",$address),
	array("Gender : ",$gender),
	array("Age : ",$age),
	);

	

	$pdf = new PDF();
	$title = '     Cubiciles | Hospital Management System';
	$logo = "";
	$pdf->SetTitle($title);
	$pdf->Print_general_details($Details_info);
	$pdf->Ln(20);
	$pdf->print_table_wise($header);
	$pdf->Output();


?>




