<?php
	session_start();
	date_default_timezone_set("Asia/kolkata");
	class database_functions{
		private $con;
		function __construct(){
			$this->con	=	new mysqli("localhost","root","","hms");
		}
		
		function get_patient_all_data($id){
			if($stmt_select = $this->con->prepare("SELECT `ID`, `Docid`, `PatientName`, `patientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis` FROM `tblpatient` WHERE `ID` = ?")){
				$stmt_select->bind_param("i",$id);
				$stmt_select->bind_result($result_id,$result_docid,$result_patientname,$result_patientemail,$result_patientgender,$result_patientaddress,$result_patientage,$result_patientmedhis);
				if($stmt_select->execute()){
					$data_container	=	array();
					if($stmt_select->fetch()){
						$data_container[0]	=	$result_id;
						$data_container[1]	=	$result_docid;
						$data_container[2]	=	$result_patientname;
						$data_container[3]	=	$result_patientemail;
						$data_container[4]	=	$result_patientgender;
						$data_container[5]	=	$result_patientaddress;
						$data_container[6]	=	$result_patientage;
						$data_container[7]	= 	$result_patientmedhis;

						return $data_container;
					}
				}
				return false;
			}
		}
		function get_patient_all_data1($id){
			if($stmt_select = $this->con->prepare("SELECT `ID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`,`CreationDate` FROM `tblmedicalhistory` WHERE `ID` = ?")){
				$stmt_select->bind_param("i",$id);
				$stmt_select->bind_result($result_id,$result_bp,$result_bs,$result_wt,$result_temp,$result_med,$result_date);
				if($stmt_select->execute()){
					$data_container	=	array();
					if($stmt_select->fetch()){
						$data_container[0]	=	$result_id;
						$data_container[1]	=	$result_bp;
						$data_container[2]	=	$result_bs;
						$data_container[3]	=	$result_wt;
						$data_container[4]	=	$result_temp;
						$data_container[5]	=	$result_med;
						$data_container[6]	=	$result_date;
						return $data_container;
					}
				}
				return false;
			}
		}

	}

?>

