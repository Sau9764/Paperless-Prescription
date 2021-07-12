<?php

// EDIT THE 2 LINES BELOW AS REQUIRED
				$email_to = "saurabhkekade9764@gmail.com";
				$email_subject = "The prescription of the patient ".$result_name."";
				$email_from="samarthupare1935@gmail.com";
				function died($error) {
					// your error code can go here
					echo "We are very sorry, but there were error(s) found with the form you submitted. ";
					echo "These errors appear below.<br /><br />";
					echo $error."<br /><br />";
					echo "Please go back and fix these errors.<br /><br />";
					die();
				}
				
				
				
				$email_message = "Form details below.\n\n";
				function clean_string($string) {
				  $bad = array("content-type","bcc:","to:","cc:","href");
				  return str_replace($bad,"",$string);
				}
				
				$email_message .= "Prescription are: \n".$p_btn."\n";
			// create email headers
			$headers = 'From: '.$email_from."\r\n".
			'Reply-To: '.$email_from."\r\n" .
			'X-Mailer: PHP/' . phpversion();
			@mail($email_to, $email_subject, $email_message, $headers);  
			?>
			<!-- include your own success html here -->
			Thank you for contacting us. We will be in touch with you very soon.