<?php
	$servername="localhost";
	$username="root";
	$password="";
	$database="pabrik";
	
	$konek=mysqli_connect($servername, $username,$password, $database);
	if(!$konek){
		die("koneksi gagal");
	}
?>