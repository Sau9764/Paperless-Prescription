<?php
//include connection file
include_once("connection.php");
include_once('libs/fpdf.php');
 
class PDF extends FPDF
{
// Page header
function Header()
{
    // Logo
    $this->Image('logo.png',10,-1,70);
    $this->SetFont('Arial','B',13);
    // Move to the right
    $this->Cell(80);
    // Title
    $this->Cell(80,10,'Employee List',1,0,'C');
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
$display_heading = array('id'=>'ID', 'name'=> 'Name', 'email'=>'email','contact_number'=> 'Contact No.','diseas_type'=>'diseas_type','age'=>'age','checkup'=>'checkup','bill_by_recept'=>'bill_by_recept','precriction'=>'precriction','additional_checkup'=>'additional_checkup','total_fees'=>'total_fees');
$id=0; 
$result = mysqli_query($connString, "SELECT id, name, email, contact_number, diseas_type, age, checkup, bill_by_recept, precriction, additional_checkup, total_fees  FROM old_patient_database where `id`=$id") or die("database error:". mysqli_error($connString));
$header = mysqli_query($connString, "SHOW columns FROM old_patient_database");
 
$pdf = new PDF();
//header
$pdf->AddPage();
//foter page
$pdf->AliasNbPages();
$pdf->SetFont('Arial','B',12);
foreach($header as $heading) {
$pdf->Cell(40,12,$display_heading[$heading['Field']],1);

}
foreach($result as $row) {
$pdf->Ln();
foreach($row as $column)
$pdf->Cell(40,12,$column,1);
}
$pdf->Output();
?>
