<?php
require('inc/essentials.php');
require('inc/db_config.php');
adminLogin();

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];

    // Password strength check (example: minimum length of 8 characters)
    if (strlen($password) < 5) {
        echo "Password must be at least 5 characters long.";
    } else {
        $hashedPassword = md5($password);

        // Use prepared statement to prevent SQL injection
        $stmt = $con->prepare("INSERT INTO employees (username, password,role) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $username, $hashedPassword, $role);

        if ($stmt->execute()) {
            // Success message or redirect
            echo "Employee added successfully!";
        } else {
            echo "Error: " . $stmt->error;
        }

        $stmt->close();
    }
}

// Fetch existing employees
$employeesQuery = "SELECT id, username, role FROM employees";
$employeesResult = mysqli_query($con, $employeesQuery);
$employees = mysqli_fetch_all($employeesResult, MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
    <?php require('inc/links.php'); ?>
</head>

<body class="bg-light">

    <?php require('inc/header.php'); ?>

    <div class="container-fluid" id="main-content">
        <div class="row">
            <div class="col-lg-10 ms-auto p-4 overflow-hidden">
                <h3>Employee Management</h3>

                <!-- Form to add new employees -->
                <form method="post" action="">
                    <label for="username">Username:</label>
                    <input type="text" name="username" required>
                    <label for="password">Password:</label>
                    <input type="password" name="password" required>
                    <label for="role">Role:</label>
                    <select name="role" required>
                        <!-- <option value="Admin">Admin</option> -->
                        <!-- <option value="Manager">Manager</option> -->
                        <option value="Employee">Employee</option>
                        <!-- Add other roles as needed -->
                    </select>

                    <button type="submit" class="btn btn-success">Add Employee</button>
                </form>

                <!-- Display existing employees -->
                <h4 class="mt-4">Existing Employees</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($employees as $employee) : ?>
                            <tr>
                                <td><?= $employee['id'] ?></td>
                                <td><?= $employee['username'] ?></td>
                                <td><?= $employee['role'] ?></td>
                                <td>
                                    <!-- Add buttons for editing and deleting employees -->
                                    <a href="edit_employee.php?id=<?= $employee['id'] ?>" class="btn btn-warning">Edit</a>
                                    <a href="delete_employee.php?id=<?= $employee['id'] ?>" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <?php require('inc/scripts.php') ?>
</body>

</html>
