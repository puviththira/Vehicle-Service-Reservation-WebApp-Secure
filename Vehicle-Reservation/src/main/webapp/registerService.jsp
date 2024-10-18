<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.services.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/material-dashboard.min.css">
    <link rel="stylesheet" href="css/custom.css">
    
    <style>
        body {
            font-family: 'Lato', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding-left: 25%;
            padding-top: 5px;
            padding-right: 20px;
            justify-content: center;
            align-items: center;
        }
      
        .registration-form {
            width: 100%;
            max-width: 1500px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .registration-form h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .registration-form input[type="date"],
        .registration-form select,
        .registration-form input[type="text"],
        .registration-form input[type="number"],
        .registration-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .registration-form input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .registration-form input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

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
          <a class="nav-link text-white active bg-warning" href="registerService.jsp">
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
    <div class="registration-form">
        <h2>Register Your Vehicle</h2>
        <form action="register" method="post">
            <table>
                <tr>
                    <td>Date of the service reservation: <input type="date" name="reservationDate" min="" required></td>
                    <td></td>
                    <td>Preferred time:
                        <select name="preferredTime" required>
                            <option value="10 AM">10 AM</option>
                            <option value="11 AM">11 AM</option>
                            <option value="12 PM">12 PM</option>
                        </select><br>
                    </td>
                </tr>
            </table>
            Preferred Location: 
            <select name="preferredLocation" required>
                <option value="Colombo">Colombo</option>
                <option value="Ampara">Ampara</option>
                <option value="Anuradhapura">Anuradhapura</option>
                <option value="Badulla">Badulla</option>
                <option value="Batticaloa">Batticaloa</option>
                <option value="Galle">Galle</option>
				<option value="Gampaga">Gampaga</option>
				<option value="Hambanthota">Hambanthota</option>
				<option value="Jaffna">Jaffna</option>
				<option value="Kaluthara">Kaluthara</option>
				<option value="Kandy">Kandy</option>
				<option value="Kegalle">Kegalle</option>
				<option value="Kilinochchi">Kilinochchi</option>
				<option value="Kurunegala">Kurunegala</option>
				<option value="Mannar">Mannar</option>
				<option value="Matale">Matale</option>
				<option value="Matara">Matara</option>
				<option value="Monaragala">Monaragala</option>
				<option value="Mullaitivu">Mullaitivu</option>
				<option value="Nuwara Eliya">Nuwara Eliya</option>
				<option value="Polonnaruwa">Polonnaruwa</option>
				<option value="Puttalam">Puttalam</option>
				<option value="Ratnapura">Ratnapura</option>
				<option value="Trincomalee">Trincomalee</option>
				<option value="Vavuniya">Vavuniya</option>
            </select><br>
            Vehicle Registration Number: <input type="text" name="vehicleNo" required><br>
            Current Mileage: <input type="number" name="mileage" required><br>
            Message: <input type="text" name="message" required><br>
            <input type="submit" name="submit" value="Register">
        </form>
    </div>
    </main>
</body>
</html>
