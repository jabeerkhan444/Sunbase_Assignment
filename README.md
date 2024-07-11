# Sunbase_Assignment
## Database Setup:
- Create a database named `student_db`.
- Create a table named `students` with the following schema:

CREATE TABLE students ( <br/>
  id INT PRIMARY KEY AUTO_INCREMENT,<br/>
name VARCHAR(50),<br/>
email VARCHAR(50),<br/>
age INT<br/>
);<br/>

## How to Run

1. Clone the repository: `git clone <repository-link>`
2. Import the project into your IDE as a Dynamic Web Project.
3. Configure the project to use Apache Tomcat.
4. Update the database connection details in `JDBC_Connection.java`.
5. Deploy the project on the server.
6. Access the application at `http://localhost:8080/StudentCRUDApp/`.

## CRUD Operations

- Add a new student: `/add.jsp`

  ![Screenshot 2024-07-11 180132](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/61cf6cde-c1da-4a3c-8140-d3c713d12878)

- View student list: `/list`

  ![Screenshot 2024-07-11 181618](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/14dc246c-3770-4bfa-bff2-9a2b09ffb494)
  
- Update a student: `/update.jsp?id=<student-id>`
  
  ![Screenshot 2024-07-11 181811](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/fcb41d0f-ea3a-4a76-812a-68c33ce93a81)

  Before Updating
  
  ![Screenshot 2024-07-11 181618](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/14dc246c-3770-4bfa-bff2-9a2b09ffb494)
  
  After Updating
  
  ![Screenshot 2024-07-11 181852](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/22342021-1b1f-4a44-a2db-cb0692b0aa11)

- Delete a student: `/delete?id=<student-id>`
  
  Before Deleting

  ![Screenshot 2024-07-11 181618](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/14dc246c-3770-4bfa-bff2-9a2b09ffb494)

  After Deleting

  ![Screenshot 2024-07-11 181947](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/20b18b02-14e1-4d15-a879-91f6ed154f0d)

- Search a student: `/search?search=j`
  
  Searched for 'John Doe'
  
  ![Screenshot 2024-07-11 181618](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/28812b33-d46e-43d6-b234-d73621bb2947)

  Searched Result

  ![Screenshot 2024-07-11 181643](https://github.com/jabeerkhan444/Sunbase_Assignment/assets/78999289/3e87d331-bbec-4865-b50e-7d39b70fc8c4)

