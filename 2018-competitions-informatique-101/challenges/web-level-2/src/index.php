<?php
	$headers = getallheaders();
	$admin = array_key_exists('X-Admin', $headers) && $headers['X-Admin'] === 'true';
	// Set headers.
	if ($admin) {
		header("X-Admin: true");
	} else {
		header("X-Admin: false");
	}
	$lands = array(
		'pizzaland' => array(
			'name' => 'Pizza Land',
			'image' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Thanks_to_all_our_food_donors%21_%287986353032%29.jpg/800px-Thanks_to_all_our_food_donors%21_%287986353032%29.jpg',
			'description' => "Hmmm pizza."
		),
		'playland' => array(
			'name' => 'Play Land',
			'image' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Childrens_Game_Park_01621.jpg/1280px-Childrens_Game_Park_01621.jpg',
			'description' => 'A nice place to play.'
		),
		'relaxland' => array(
			'name' => 'Relax Land',
			'image' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Diamonds_Thudufushi_Beach_and_Water_Villas%2C_May_2017_-09.jpg/1920px-Diamonds_Thudufushi_Beach_and_Water_Villas%2C_May_2017_-09.jpg',
			'description' => 'Stress free.'
		),
		'adminland' => array(
			'name' => 'Admin Land',
			'image' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Guy_Steele.jpg/486px-Guy_Steele.jpg',
			'description' => 'A nice picture of me! Also my secret: FLAG-bb3df76f05b4064f5906f945460fe8dd.'
		),
	);
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>The Land</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	 <!-- Custom CSS -->
	 <style media="screen">
		 body {
			 background: black;
			 color: white;
			 margin-bottom: 1rem;
		 }
		 .land {
			 width: 90%
		 }
		 main {
			 padding-top: 1rem;
		 }
	 </style>
  </head>
  <body>
	  <header>
	   <div class="navbar navbar-dark bg-dark box-shadow">
		  <div class="container d-flex justify-content-between">
			 <a href="/" class="navbar-brand d-flex align-items-center">
				<strong>The Land</strong>
			 </a>
		  </div>
	   </div>
	 </header>
    <!-- Begin page content -->
    <main role="main" class="container">
		<?php if (!isset($_GET['land']) || !array_key_exists($_GET['land'], $lands)) { ?>
			<h1 class="mt-5">The Lands</h1>
			<p>This is my lands!</p>
			<ul>
				<li>
					<a href="/?land=pizzaland">Pizza Land</a>
				</li>
				<li>
					<a href="/?land=playland">Play Land</a>
				</li>
				<li>
					<a href="/?land=relaxland">Relax Land</a>
				</li>
				<!--
				<li>
					<a href="/?land=adminland">Admin Land</a>
				</li>
			 	-->
			</ul>
		<?php } else { ?>
			<?php if ($_GET['land'] === 'adminland' && $admin === false) { ?>
				<p>
					Your are not an admin, you can't see the <strong>Admin Land</strong>!
				</p>
			<?php } else { ?>
				<h1 class="mt-5"><?php echo $lands[$_GET['land']]['name'] ?></h1>
				<p><?php echo $lands[$_GET['land']]['description'] ?></p>
				<img class="land" src="<?php echo $lands[$_GET['land']]['image'] ?>" alt="<?php echo $lands[$_GET['land']]['name'] ?>">
			<?php } ?>
		<?php } ?>
	</main>
  </body>
</html>
