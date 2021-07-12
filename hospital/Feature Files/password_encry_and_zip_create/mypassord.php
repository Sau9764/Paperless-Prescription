<?php

// Connecting to DB

define('DB_SERVER','localhost');
define('DB_USER','root');
define('DB_PASS' ,'');
define('DB_NAME', 'sample_test');
$con = mysqli_connect(DB_SERVER,DB_USER,DB_PASS,DB_NAME);
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

// end connection

if(isset($_POST['submit']))
{
$userid=$_POST['userid'];
$normal_pass = $_POST['password'];
$password=md5($normal_pass);

$query=mysqli_query($con,"insert into test(userid,password) values('$userid','$password')");
// creating unique key of username and password

if($query)
{
	echo "<script>alert('Successfully Registered. '); </script>";
}
}


if(isset($_POST['add_zip'])){

    // creating encrypted string

    $encrypted_string = "";

    $sql = "select * from test where userid = 1";
        $res = $con->query($sql);
        if($res->num_rows > 0){
            while($row = $res->fetch_assoc()){
                $get_id = $row['userid'];
                $get_pass = $row['password'];
            }
                //$encrypted_string = "1";
                $encrypted_string = openssl_encrypt($get_id,"AES-128-ECB",$get_pass);
        }else{
            echo "0 rows selected.";
        }

        // add password to the zip file

        $zip = new ZipArchive;

    if ($zip->open('test.zip', ZipArchive::CREATE) === TRUE) {
   
    $zip->setPassword($encrypted_string);
    $zip->addFile('demo.txt');
    $zip->setEncryptionName('demo.txt', ZipArchive::EM_AES_256, $encrypted_string);
    $zip->close();
    echo "<script>alert('Successfully add zip.'); </script>";
    }else
        echo "<script>alert('Failed to add zip. '); </script>";

}

if(isset($_POST['add_file'])){
     $encrypted_string = "";

    $sql = "select * from test where userid = 1";
        $res = $con->query($sql);
        if($res->num_rows > 0){
            while($row = $res->fetch_assoc()){
                $get_id = $row['userid'];
                $get_pass = $row['password'];
            }
                //$encrypted_string = "1";
                $encrypted_string = openssl_encrypt($get_id,"AES-128-ECB",$get_pass);
        }else{
            echo "0 rows selected.";
        }

        // add password to the zip file

        $zip = new ZipArchive;

    if ($zip->open('test.zip') === TRUE) {
   
    $zip->setPassword($encrypted_string);
    $zip->addFile('demo_1.txt');
    $zip->setEncryptionName('demo_1.txt', ZipArchive::EM_AES_256, $encrypted_string);
    $zip->close();
    echo "<script>alert('Successfully add zip.'); </script>";
    }else
        echo "<script>alert('Failed to add zip. '); </script>";
}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Sample key encryption</title>
</head>
<body>
	<form method = "POST">
		<input type="text" name="userid">
		<input type="password" name="password">
		<button type="submit" name="submit">Submit</button>
        <button type="submit" name="add_zip">add_zip</button>
        <button type="submit" name="add_file">add_file</button>
    </form>


    <br>

    <div> 
    	<?php
    	$sql = "select * from test";
    	$res = $con->query($sql);
    	if($res->num_rows > 0){
    		while($row = $res->fetch_assoc()){
                $get_id = $row['userid'];
                $get_pass = $row['password'];

                $encrypted_string = openssl_encrypt($get_id,"AES-128-ECB",$get_pass);

    			echo "name : " . $row['userid'] . " password : ". $row['password'] . " Ecnrypted string : " . $encrypted_string . "<br>";
    		}
    	}else{
    		echo "0 rows selected.";
    	}
    	
    	?>
    </div>

</body>
</html>


