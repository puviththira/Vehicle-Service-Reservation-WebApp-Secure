# Vehicle Service Reservation Web App - Secure

A traditional web application for vehicle service reservation with a focus on security, authentication, and access control. This web application is designed to mitigate the OWASP Top 10 vulnerabilities, primarily addressing Broken Access Control, SQL Injection, and Cross-Site Scripting (XSS). User authentication and access control have been implemented using OIDC protocols with a cloud-based Identity Provider (IDP), Asgardeo.


### Roadmap to Deploy

1. **Download the project as a ZIP**:
   - [Download ZIP](https://github.com/puviththira/Vehicle-Service-Reservation-WebApp-Secure/archive/refs/heads/main.zip)

2. **Extract it to your workspace**.

3. **Open the project using an IDE** that supports dynamic web application development, such as Eclipse.

4. **Update the credentials**:
   - Go to `src/main/webapp/WEB-INF/authorization.properties` and update it with your credentials. (You must have an Asgardeo account with an application and at least one user.)

5. **Check for required JARs**:
   - Ensure that the required JARs are available in the `lib` folder (`mysql-connector-j-8.1.0` and `org.json` JARs).
   - If not, download them and configure them in the project.

6. **Run the application**:
   - Run `index.jsp` as the entry point on the Tomcat server.

### Reference

You can find the blog article about VehicleCareReservation here(https://puviththira.medium.com/building-a-secure-vehicle-service-reservation-platform-leveraging-oidc-and-mitigating-owasp-d8c1d0abe4ff?source=user_profile_page---------0-------------8b3a98daf1f---------------).
