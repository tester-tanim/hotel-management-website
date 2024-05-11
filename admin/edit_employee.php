<?php
require('inc/essentials.php');
require('inc/db_config.php');
adminLogin();

// Check if an employee ID is provided
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    // Redirect to employee_management.php if no valid ID is provided
    header('Location: employee_management.php');
    exit;
}

$employeeId = mysqli_real_escape_string($con, $_GET['id']);

// Fetch employee details
$employeeQuery = "SELECT id, username, role FROM employees WHERE id = $employeeId";
$employeeResult = mysqli_query($con, $employeeQuery);
$employee = mysqli_fetch_assoc($employeeResult);

// Handle form submission for editing
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $newUsername = mysqli_real_escape_string($con, $_POST['new_username']);
    $newRole = $_POST['new_role'];

    $updateQuery = "UPDATE employees SET username = '$newUsername', role = '$newRole' WHERE id = $employeeId";
    mysqli_query($con, $updateQuery);

    // Redirect back to employee_management.php after editing
    header('Location: employee_management.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
    <?php require('inc/links.php'); ?>
</head>

<body class="bg-light">

    <?php require('inc/header.php'); ?>

    <div class="container-fluid" id="main-content">
        <div class="row">
            <div class="col-lg-6 ms-auto p-4 overflow-hidden">
                <h3>Edit Employee</h3>

                <!-- Form to edit employee details -->
                <form method="post" action="">
                    <label for="new_username">New Username:</label>
                    <input type="text" name="new_username" value="<?= $employee['username'] ?>" required>

                    <label for="new_role">New Role:</label>
                    <select name="new_role" required>
                        
                        <option value="employee" <?= ($employee['role'] == 'employee') ? 'selected' : '' ?>>Employee</option>
                    </select>

                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
        </div>
    </div>

    <?php require('inc/scripts.php') ?>
</body>

</html>
