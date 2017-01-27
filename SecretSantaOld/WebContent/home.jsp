<!DOCTYPE html>
<html>
   	<head lang="ro-RO">
   		<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	   

	   	<button type="button" onclick="languageHome(0)" style="float:right">EN</button>
		<button type="button" onclick="languageHome(1)" style="float:right">RO</button>	
		
		<h1>${currentUser.loginData.username}<span id="welcomeMessage">, bine ai revenit! Parola ta este: </span>${currentUser.loginData.password}</h1>
		<hr>
		
		<nav>
				<ul>
					<p><b id="menu">Meniu</b></p>
					<li>
					   <a class=navigItem href="home?lang=1" id="home">Acasa</a>
					</li>
					<li>
					   <a class=navigItem href="wishlist?lang=1" id="wishList">Listă dorințe</a>
					</li>
					<li>
					   <a class=navigItem href="participants" id="participants">Participanti</a>
					</li>
					<li>
						<a class=navigItem href="about" id="about">Despre</a>
					</li>
				
					<p><b id="extLinks">Legaturi externe:</b></p>
					<li>
					   <a class="navigItem" href="https://www.dailymotion.com/video/x37qnbn_100-de-colinde-de-craciun-colaj-colinde-traditionale-romanesti_music" id="christSongs" >Colinde</a>
					</li>
					<li>
					   <a class="navigItem" href="https://ro.wikipedia.org/wiki/Mo%C8%99_Cr%C4%83ciun" id="aboutSanta">Despre Mos Craciun</a>
					</li>
					<li>
						<a class="navigItem" href="http://astrologie.acasa.ro/astrologie-zodii-105/cum-sa-alegi-cadoul-potrivit-de-craciun-pentru-fiecare-zodie-in-parte-211219.html" id="tips">Sfaturi</a>
					</li>
					<br>
					
					<li>
						<a href="logout?lang=1" id="logout">Deconectare</a>
					</li>
				</ul> 

		</nav>

		<div class="text">
			<p id="info">Pe aceasta pagina veti putea afla cui trebuie sa ii faceti un cadou de Mos Craciun!</p>

			<p id="note"><i><u>Nota:</u><br>Va aducem la cunostinta faptul ca informatiile privind destinatarii cadourilor sunt confidentiale, fiind cunoscute doar de catre persoana care va face cadoul respectiv.</i></p>
			
	  	</div>
	  </div>

	  <script type="text/javascript" src="resources/js/en.js" charset="UTF-8"></script>
	  <script>languageHome(${lang})</script>
	</body>


</html>