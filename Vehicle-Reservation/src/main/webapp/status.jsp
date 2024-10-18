<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Status</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/material-dashboard.min.css">
    <link rel="stylesheet" href="css/custom.css">
</head>

<body class="img js-fullheight" style="background-image: url(images/homebg.png);">

<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 custom-sidebar" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="index.jsp" target="_blank">
        <span class="ms-1 font-weight-bold text-white">Vehicle Service Reservation</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto  max-height-vh-100" id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-white" href="home.jsp">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <span style="font-family: 'Material Icons'; font-size: 24px; opacity: 10;">account_circle</span>

            </div>
            <span class="nav-link-text ms-1">Profile</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="registerService.jsp">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
             	<span style="font-family: 'Material Icons'; font-size: 24px; opacity: 10;">add_box</span>
            </div>
            <span class="nav-link-text ms-1">Add Reservation</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="upcomingReservation.jsp">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <span style="font-family: 'Material Icons'; font-size: 24px; opacity: 10;">upcoming</span>
            </div>
            <span class="nav-link-text ms-1">Upcoming Reservations</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="viewService.jsp.jsp">
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
  	<br>
  	<div class="text-center">
    <% 
        String status = request.getParameter("status");
        String type = request.getParameter("type");
        if (status != null && status.equals("success")) { 
    %>
        <h1>Registration Successful</h1>
        <p>Your registration has been successfully processed.</p>
        <!-- Add any other success-related content here -->
    <% } else { %>
        <h1>Registration Error</h1>
        <% 
            if (type != null && type.equals("emptyFields")) { 
        %>
            <p>Please fill in all the required fields.</p>
        <% } else { %>
            <p>An error occurred during registration.</p>
        <% } %>
    <% } %>
    </div>
   </main>
</body>
</html>
