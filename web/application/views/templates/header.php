<?php
/**
 * [ Template: Header ]
 * It's a template for the static pages on the ProjektEventKalender website.
 * He define all headers on the website.
 * @author Tim Voegtli tim.voegtli@gibmit.ch
 * @version 1.2 assets work.
 */
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	
	<!-- Page title -->
	<title><?php echo $title; ?></title>

	<!-- Page icon -->
	<link rel="icon" href="<?php echo base_url( 'assets/img/' . $page . '-favicon.gif' )?>" type="image/gif">

	<!-- CSS for foundation6 -->
	<link rel="stylesheet" type="text/css" href="<?php echo base_url( 'assets/css/foundation.min.css' ); ?>">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url( 'assets/css/style.css' ); ?>">

</head>
<body>
	<!-- Title -->
	<div id="title" class="column row">
		<h1><?php echo $title; ?></h1>
	</div>