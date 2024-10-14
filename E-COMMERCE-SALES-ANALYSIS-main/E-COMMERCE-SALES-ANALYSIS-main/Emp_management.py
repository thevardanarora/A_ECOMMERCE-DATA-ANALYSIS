import mysql.connector

# Database connection
try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="15112002",
        database="EmployeeManagement"
    )
    if conn.is_connected():
        print("Connected to MySQL database")
except mysql.connector.Error as err:
    print(f"Error: {err}")

cursor = conn.cursor()

# Define the functions first

# Function to add an employee
def add_employee():
    first_name = input("Enter first name: ")
    last_name = input("Enter last name: ")
    email = input("Enter email: ")
    phone = input("Enter phone number: ")
    position = input("Enter position: ")
    salary = input("Enter salary: ")
    department = input("Enter department: ")
    status = 'active'

    query = """
    INSERT INTO employees (first_name, last_name, email, phone_number, position, salary, hire_date, department, status)
    VALUES (%s, %s, %s, %s, %s, %s, CURDATE(), %s, %s)
    """
    values = (first_name, last_name, email, phone, position, salary, department, status)
    
    cursor.execute(query, values)
    conn.commit()
    print(f"Employee {first_name} {last_name} added successfully!\n")

# Function to remove an employee
def remove_employee():
    emp_id = input("Enter employee ID to remove: ")
    query = "DELETE FROM employees WHERE employee_id = %s"
    cursor.execute(query, (emp_id,))
    conn.commit()
    print(f"Employee with ID {emp_id} removed successfully!\n")

# Function to promote an employee
def promote_employee():
    emp_id = input("Enter employee ID to promote: ")
    new_position = input("Enter new position: ")
    new_salary = input("Enter new salary: ")

    query = "UPDATE employees SET position = %s, salary = %s WHERE employee_id = %s"
    cursor.execute(query, (new_position, new_salary, emp_id))
    conn.commit()
    print(f"Employee with ID {emp_id} promoted to {new_position} with new salary {new_salary}.\n")

4

# Function to display employees (with salary)
def display_employee():
    query = "SELECT employee_id, first_name, last_name, position, salary, department FROM employees"
    cursor.execute(query)
    result = cursor.fetchall()

    if result:
        print("Employee Details:")
        for row in result:
            print(f"ID: {row[0]}, Name: {row[1]} {row[2]}, Position: {row[3]}, Department: {row[5]}, Salary: {row[4]}")
    else:
        print("No employees found.")
    print()



# Menu function
def menu():
    while True:
        print("\nEmployee Management System")
        print("1. Add Employee")
        print("2. Remove Employee")
        print("3. Promote Employee")
        print("4. Display Employees")
        print("5. Exit")
        
        choice = input("Enter your choice (1-5): ")

        if choice == '1':
            add_employee()
        elif choice == '2':
            remove_employee()
        elif choice == '3':
            promote_employee()
        elif choice == '4':
            display_employee()
        elif choice == '5':
            print("Exiting the system.")
            cursor.close()
            conn.close()
            break
        else:
            print("Invalid choice. Please try again.")

# Run the menu after defining all functions
menu()
