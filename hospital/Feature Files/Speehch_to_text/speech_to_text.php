<?php
require_once('../lib/db_functions.php');
	$db = new database_functions();
?>
<!DOCTYPE html>
<html>
	<head>
		<title>PAPERLESS PRECREPTION</title>
		<link rel="stylesheet" type="text/css" href="/css/style.css" />
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.1/css/font-awesome.min.css" />
		<style type="text/css">
			body{
				font-family: verdana;
			}
			#result{
				height: 200px;
				border: 1px solid #ccc;
				padding: 10px;
				box-shadow: 0 0 10px 0 #bbb;
				margin-bottom: 30px;
				font-size: 14px;
				line-height: 25px;
			}
			button{
				font-size: 20px;
				position: absolute;
				top: 240px;
				left: 50%;
			}
		</style>
	</head>
	<body>
	<?php
		require_once('../header.php');
	?>
	<div class="middle_container">
		<h4 align="center">Speech to text converter in JS</h4>
		<div id="result"></div>
		<button onclick="startConverting();"><i class="fa fa-microphone"></i></button>
		<script type="text/javascript">
			var r = document.getElementById('result');
			function startConverting () {
				if('webkitSpeechRecognition' in window){
					var speechRecognizer = new webkitSpeechRecognition();
					speechRecognizer.continuous = true;
					speechRecognizer.interimResults = true;
					speechRecognizer.lang = 'en-IN';
					speechRecognizer.start();
					var finalTranscripts = '';
					speechRecognizer.onresult = function(event){
						var interimTranscripts = '';
						for(var i = event.resultIndex; i < event.results.length; i++){
							var transcript = event.results[i][0].transcript;
							transcript.replace("\n", "<br>");
							if(event.results[i].isFinal){
								finalTranscripts += transcript;
							}else{
								interimTranscripts += transcript;
							}
						}
						r.innerHTML = finalTranscripts + '<span style="color:#999">' + interimTranscripts + '</span>';
					};
					speechRecognizer.onerror = function (event) {
					};
				}else{
					r.innerHTML = 'Your browser is not supported. If google chrome, please upgrade!';
				}
			}
		</script>
		<div class="btns" style="align:center;">
			<input type="submit" name="sms_btn" class="proceed_btn" value="Send By SMS" style="margin-left:80px;"/></a>
			<input type="submit" name="email_btn" class="proceed_btn" value="Send By Emial" style="margin-left:80px;"/></a>
		</div>
		</div>
		<?php
			require_once('../footer.php');
		?>
	</body>
</html>