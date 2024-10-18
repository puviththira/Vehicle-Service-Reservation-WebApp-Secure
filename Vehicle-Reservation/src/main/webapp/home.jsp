<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.services.*" %>
<%@	page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.net.URL, java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader" %>
<%@ page import="java.net.URL, java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader, java.io.IOException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/material-dashboard.min.css">
    <link rel="stylesheet" href="css/custom.css">

</head>

<body class="img js-fullheight" style="background-image: url(images/homebg.png);">

<%
    String introspectionEndpointUrl = "https://api.asgardeo.io/t/sutharsi/oauth2/introspect";
    String accessToken = (String) session.getAttribute("access_token");
    String idToken = (String) session.getAttribute("id_token");
    String userName = ""; 
    String phoneNumber ="";
    String givenName="";
    String lastName= "";
    String country="";
    if (accessToken != null && idToken != null) {
        try {
        	
            URL url = new URL("https://api.asgardeo.io/t/sutharsi/oauth2/userinfo");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + accessToken);
			
   
            
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            connection.disconnect();

            String responseJSON = content.toString();
 
        JSONObject jsonObject = new JSONObject(responseJSON);

        userName = jsonObject.optString("username");
        String email = jsonObject.optString("email");
        phoneNumber = jsonObject.optString("phone_number");
        givenName = jsonObject.optString("given_name");
        lastName = jsonObject.optString("family_name");
        
        JSONObject addressObject = jsonObject.optJSONObject("address");

        
        country = (addressObject != null) ? addressObject.optString("country") : "";
        session.setAttribute("username", userName);          

        } catch (IOException e) {
            out.println("Error: " + e.getMessage());
            
        }
    } else {
        
    }
%>

<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 custom-sidebar" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="index.jsp " target="_blank">
        <span class="ms-1 font-weight-bold text-white">Vehicle Service Reservation</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto  max-height-vh-100" id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-white active bg-warning" href="home.jsp">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <span style="font-family: 'Material Icons'; font-size: 24px; opacity: 10;">account_circle</span>

            </div>
            <span class="nav-link-text ms-1">Profile</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white " href="registerService.jsp">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
             	<span style="font-family: 'Material Icons'; font-size: 24px; opacity: 10;">add_box</span>
            </div>
            <span class="nav-link-text ms-1">Add Reservation</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white " href="upcomingReservation.jsp">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <span style="font-family: 'Material Icons'; font-size: 24px; opacity: 10;">upcoming</span>
            </div>
            <span class="nav-link-text ms-1">Upcoming Reservations</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white " href="viewService.jsp">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <span style="font-family: 'Material Icons'; font-size: 24px; opacity: 10;">view_list</span>
            </div>
            <span class="nav-link-text ms-1">View All Reservations</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="sidenav-footer position-absolute w-100 bottom-0 ">
      <div class="mx-3">
        <a class="btn bg-warning mt-4 w-100 text-white" href="https://api.asgardeo.io/t/sutharsi/oidc/logout" type="button">
        		Log out
        </a>
      </div>
    </div>
  </aside>

<main>
    <div class="profile-container">
        <div class="profile-card">
        	<h2>Hello  <span id="name"><%= givenName +" "+ lastName %></span>!</h2><br>
            <div class="user-profile">
                <p><strong>Email:</strong> <span id="email"><%= userName %></span></p>
                <p><strong>Name:</strong> <span id="name"><%= givenName +" "+ lastName %></span></p>
                <p><strong>Phone:</strong> <span id="phone"><%= phoneNumber %></span></p>
                <p><strong>Country:</strong> <span id="phone"><%= country %></span></p>                
            </div><br>
            <p class="w-100 text-center">Revolutionize your vehicle care routine with VehicleCareReserve!Fast, reliable, and hassle-free scheduling for all your automotive needs. Book now and enjoy a smoother ride ahead!</p>
            <div class="social d-flex text-center">
	          	<a href="registerService.jsp" class="px-2 py-2 mr-md-1 rounded">Reserve Service</a>
	        </div>
	        
        </div>
    </div>
</main>

</body>
</html>