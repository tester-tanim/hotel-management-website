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

// Delete the employee
$deleteQuery = "DELETE FROM employees WHERE id = $employeeId";
mysqli_query($con, $deleteQuery);

// Redirect back to employee_management.php after deleting
header('Location: employee_management.php');
exit;
?>
