<?php
/**
 * [ Template: Header ]
 * It's a template for the static pages on the ProjektEventKalender website.
 * He define all headers on the website.
 * @author Tim Voegtli tim.voegtli@gibmit.ch
 * @version 1.1 The new version wrapped the contend in a colum of fundation6.
 */
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	
	<!-- Page title -->
	<title><?php echo $title; ?></title>

	<!-- CSS for foundation6 -->
	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/foundation.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/foundation.min.css">

</head>
<body>
	<!-- Title -->
	<div id="title" class="column row">
		<h1><?php echo $title; ?></h1>
	</div>

	<!-- Content -->
	<div id="content" class="column row">