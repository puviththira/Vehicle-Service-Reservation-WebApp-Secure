<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.services.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Records</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/material-dashboard.min.css">
    <link rel="stylesheet" href="css/custom.css">
    <style> 
        table {
            border-collapse: collapse;
           	margin-left:280px;
            margin-top: 20px;
            border: 2px solid #ddd;
           	width: 75%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        table span{
       		color: red;
       		cursor: pointer;
   		}

		 span:hover {
    		color: darkred; 
		}
       
    </style>
</head>

<body class="img js-fullheight" style="background-image: url(images/upcoming1.png);">
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
          <a class="nav-link text-white " href="registerService.jsp">
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
          <a class="nav-link text-white active bg-warning" href="viewService.jsp">
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
    <h2 style="text-align: center;">All Allocated Reservations</h2>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Date</th>
                <th>Time</th>
                <th>Location</th>
                <th>Vehicle No</th>
                <th>Mileage</th>
                <th>Message</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            DatabaseConnection dbConnection = new DatabaseConnection();
            Connection connection = dbConnection.getConnection();
            Statement statement = null;
            ResultSet resultSet = null;
            
            try {
                String obtained_username = (String) request.getSession().getAttribute("username");
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM vehicle_service WHERE username=?");
                preparedStatement.setString(1, obtained_username);
                resultSet = preparedStatement.executeQuery();
                
                while (resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getString("booking_id") %></td>
                <td><%= resultSet.getDate("date") %></td>
                <td><%= resultSet.getTime("time") %></td>
                <td><%= resultSet.getString("location") %></td>
                <td><%= resultSet.getString("vehicle_no") %></td>
                <td><%= resultSet.getInt("mileage") %></td>
                <td><%= resultSet.getString("message") %></td>
                <td>
                    <form action="deleteRecord" method="post">
                        <input type="hidden" name="deleteId" value="<%= resultSet.getString("booking_id") %>">
                        <button type="submit" class="delete-btn"><span style="font-family: 'Material Icons'; font-size: 24px; opacity: 10;">delete</span></button>
                    </form>
                </td>
            </tr>
            <% 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (statement != null) {
                        statement.close();
                    }
                    if (connection != null && !connection.isClosed()) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %>
        </tbody>
    </table>
   </main>
</body>
</html>
