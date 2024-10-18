<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.FileInputStream, java.io.IOException, java.util.Properties" %>
<%@ page import="java.io.InputStream, java.io.IOException" %>

<%
		 // Initialize a Properties object
	    Properties properties = new Properties();

	    // Load the properties file
	    try {
	        InputStream inputStream = application.getResourceAsStream("/WEB-INF/authorization.properties");
	        properties.load(inputStream);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/custom.css">

<title>VehicleCareReserve</title>
</head>

<body class="img js-fullheight" style="background-image: url(images/vehicleServicebackground.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 mb-5">
					<h2 class="heading-section">Welcome to VehicleCareReserve</h2>
				</div>
				<p class="w-100 text-center">Experience seamless service reservations at your fingertips. <br>Book now and enjoy a smoother ride ahead!</p>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      			<h3 class="mb-4">Sign In using Asgardeo</h3>
		      	
	           		<div class="social d-flex text-center" onclick="window.location.href='https://api.asgardeo.io/t/sutharsi/oauth2/authorize?response_type=code&client_id=BqTqH2kPhaOp14lnwqvqYG1MWM0a&scope=openid%20address%20email%20phone%20profile&redirect_uri=http%3A%2F%2Flocalhost%3A8070%2FVehicle-Reservation%2Fauthorize.jsp'">
        				<button class="px-2 py-2 mr-md-1 rounded">Continue With Asgardeo!</button>
    				</div>
	           
	          		<p class="w-100 text-center">&mdash; Don't have an Asgardeo Account &mdash;</p>
	         		<div class="social d-flex text-center">
	          			<a href="https://console.asgardeo.io/" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Create Account</a>
	          		</div>
		      		</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>