<!DOCTYPE html>
<html>
   	<head lang="ro-RO">
   		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-Type" content="text/html; UTF-8" />
		<title>Secret Santa Page</title>
		<link rel="stylesheet" href="resources/css/styles.css">
		<style>
			

		</style>
	</head>
	<body>
	   <div id="page">
		<!-- Banner Secret Santa-->
	    <img src="resources/images/SecretSantaBanner.png" alt="Secret Santa Banner">
	   	
		
		<button type="button" onclick="languageIndex(0)" style="float:right">EN</button>
		<button type="button" onclick="languageIndex(1)" style="float:right">RO</button>

		<h1 id="welcome">Bine ati venit pe pagina Secret Santa!</h1>
		<hr>
		
		<nav>
			
			<ul>
				
					<p><b id="extLinks">Legaturi externe:</b></p>
					<li>
					   <a class="navigItem" href="https://www.dailymotion.com/video/x37qnbn_100-de-colinde-de-craciun-colaj-colinde-traditionale-romanesti_music" target="_blank" id="christSongs" >Colinde</a>
					</li>
					<li>
					   <a class="navigItem" href="https://ro.wikipedia.org/wiki/Mo%C8%99_Cr%C4%83ciun" target="_blank" id="aboutSanta">Despre Mos Craciun</a>
					</li>
					<li>
						<a class="navigItem" href="http://astrologie.acasa.ro/astrologie-zodii-105/cum-sa-alegi-cadoul-potrivit-de-craciun-pentru-fiecare-zodie-in-parte-211219.html" target="_blank" id="tips">Sfaturi</a>
					</li>
				</ul> 

		</nav>

		<div class="text">
			<p id="info">
				Pe aceasta pagina veti putea afla cui trebuie sa ii faceti un cadou de Mos Craciun!
			</p>

			<p id="login">Va rugam sa va logati, mai jos.</p><br>

			<form action="/SecretSantaOld/home" method="post">
				<fieldset>
					<legend id="loginArea">Zona de autentificare</legend>
					<p id="user">Nume utilizator:</p>
					<input type="text" name="loginData.username" value="Username" required=true>
					<br>
					<p id="pass">Parola:</p>
					<input type="password" name="loginData.password" required=true><br><br>
					<input type="submit" value="Autentificare" id="loginBtn">
					<input type="reset" value="Reset">
					<input type="hidden" name="lang" value="0" id="langChoice">
				</fieldset> 
			</form>

			
	  </div>
	 </div>

    
    <script type="text/javascript" src="resources/js/en.js" charset="UTF-8"></script>
    <script>languageIndex(${lang});</script>
	</body>
</html>