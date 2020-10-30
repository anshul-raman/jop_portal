# Job Portal

A job portal build using Spring Boot. (Spring MVC, Spring Security, Spring JDBC).
Currently configured to work with Postgress, 'application.properties' needs to configured to work with MySql. See spring documentation for configuration.  

## Setup
Install and Setup Postgress

Edit src/main/resources/application.properties to match your database settings  

Use src/main/resources/db.sql to create Tables



## Running
Linux/MAcOS:
```
./mvnw spring-boot:run
```

Windows:
```
mvnw spring-boot:run
```



Use username 'admin' and password 'admin' to login with admin role

