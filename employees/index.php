<?php
session_start();
require_once('../admin/inc/essentials.php');
require_once('../admin/inc/links.php');

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['login'])) {
        // Database connection code here (replace with your actual database connection logic)
        $hname = 'localhost';
        $uname = 'root';
        $pass = '';
        $db = 'subhotel';

        // Create a connection
        $con = new mysqli($hname, $uname, $pass, $db);

        // Check connection
        if ($con->connect_error) {
            die("Connection failed: " . $con->connect_error);
        }

        // Get username and password from the form
        $username = $_POST['username'];
        $password = $_POST['password'];

        // To prevent SQL injection, use prepared statements
        $stmt = $con->prepare("SELECT * FROM employees WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            // Verify the password
            if (password_verify($password, $row['password'])) {
                // Password is correct, create sessions and redirect to dashboard
                $_SESSION['username'] = $username;
                header("Location: dashboard.php"); // Redirect to the dashboard page
                exit();
            } else {
                $_SESSION['error_message'] = "Incorrect password";
                header("Location: index.php"); // Redirect back to the login page
                exit();
            }
        } else {
            $_SESSION['error_message'] = "Username not found";
            header("Location: index.php"); // Redirect back to the login page
            exit();
        }

        $stmt->close();
        $conn->close();
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Include necessary meta tags, CSS, and jQuery if needed -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Login</title>

    <!-- CSS styles... -->
    
    <style>
        div.login-form {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
        }
    </style>
</head>

<body class="bg-light">
    <div class="login-form text-center rounded bg-white shadow overflow-hidden">
        <div id="error-message" class="error-message">
            <?php
            if (isset($_SESSION['error_message'])) {
                echo $_SESSION['error_message'];
                unset($_SESSION['error_message']);
            }
            ?>
        </div>

        <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <h4 class="bg-dark text-white py-3">EMPLOYEE LOGIN PANEL</h4>
            <div class="p-4">
                <div class="mb-3">
                    <input type="text" id="username" name="username" required class="form-control shadow-none text-center" placeholder="User name">
                </div>

                <div class="mb-4">
                    <input type="password" id="password" name="password" required class="form-control shadow-none text-center" placeholder="Password">
                </div>

                <button name="login" type="submit" class="btn text-white bg-info shadow-none">Employee Login</button>
            </div>
        </form>
    </div>
</body>

</html>
