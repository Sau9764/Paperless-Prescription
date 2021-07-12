<?php
//include connection file
include_once("connection.php");
include_once('libs/fpdf.php');
 $id=0;
 
class PDF extends FPDF
{
// Page header
function Header()
{
    // Logo
    $this->Image('logo1.png',20,10,130);
    $this->SetFont('Arial','B',13);
    // Move to the right
    $this->Cell(200);
    // Title
    $this->Cell(100,10,'Patient details',1,0,'C');
    // Line break
    $this->Ln(20);
}
 
// Page footer
function Footer()
{
    // Position at 1.5 cm from bottom
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Page number
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}
}
$db = new dbObj();
$connString =  $db->getConnstring();
$display_heading = array('id'=>'ID', 'name'=> 'Name', 'email'=>'email','contact_number'=> 'Contact No.','diseas_type'=>'Disese','age'=>'Age','checkup'=>'Checkup','bill_by_recept'=>'Recept bill','precriction'=>'precriction','additional_checkup'=>'Checkup','total_fees'=>'Total');

$result = mysqli_query($connString, "SELECT id, name, email, contact_number, diseas_type, age, checkup, bill_by_recept, precriction, additional_checkup, total_fees  FROM old_patient_database ") or die("database error:". mysqli_error($connString));
$header = mysqli_query($connString, "SHOW columns FROM old_patient_database");
 
$pdf = new PDF();
//header
$pdf->AddPage();
//foter page
$pdf->AliasNbPages();
$pdf->SetFont('Arial','B',12);
//get data from the database
			foreach($header as $heading) {
			$pdf->Cell(35,12,$display_heading[$heading['Field']],1);

			}
			foreach($result as $row) {
			$pdf->Ln();
			foreach($row as $column)
			$pdf->Cell(35,12,$column,1);
			}
$pdf->Output();
?>
