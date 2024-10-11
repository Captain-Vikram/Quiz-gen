<?php
// Start the session
session_start();

// Connect to MySQL database
$mysqli = new mysqli("localhost", "root", "", "quizziee");

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Initialize an empty error message
$error_message = "";

// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get username, email, and password from the form
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error_message = "Invalid email format.";
    } else {
        // Check if username or email already exists
        $check_query = "SELECT * FROM users WHERE username = ? OR email = ?";
        $check_stmt = $mysqli->prepare($check_query);
        $check_stmt->bind_param("ss", $username, $email);
        $check_stmt->execute();
        $check_result = $check_stmt->get_result();

        if ($check_result->num_rows > 0) {
            $error_message = "Username or email already exists.";
        } else {
            // Prepare and execute the query to insert the new user
            $query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            $stmt = $mysqli->prepare($query);

            if ($stmt === false) {
                die("Prepare failed: " . htmlspecialchars($mysqli->error));
            }

            // Store password as plain text
            $stmt->bind_param("sss", $username, $email, $password);

            if (!$stmt->execute()) {
                $error_message = "Error creating account: " . $stmt->error;
            } else {
                // Redirect to a success page or login page
                header("Location: login.html");
                exit;
            }

            $stmt->close();
        }
        $check_stmt->close();
    }
}

$mysqli->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Account - Quizziee</title>
    <link rel="icon" href="img/logo.jpg" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body class="bg-white flex items-center justify-center min-h-screen">
    <div class="flex w-full max-w-4xl rounded-lg overflow-hidden shadow-lg">
        <!-- Left Side -->
        <div class="w-1/2 bg-white flex flex-col items-center justify-center p-8">
            <h1 class="text-3xl font-bold mb-8">Create Your Account</h1>
            <form action="acc_creation.php" method="POST" class="w-full flex flex-col items-center">
                <div class="w-full mb-4">
                    <div class="flex items-center bg-gray-100 rounded-full p-4 mb-4">
                        <i class="fas fa-user text-gray-400 mr-4"></i>
                        <input type="text" id="username" name="username" required placeholder="New Username" class="bg-transparent outline-none w-full">
                    </div>
                    <div class="flex items-center bg-gray-100 rounded-full p-4 mb-4">
                        <i class="fas fa-envelope text-gray-400 mr-4"></i>
                        <input type="email" id="email" name="email" required placeholder="Enter your Email" class="bg-transparent outline-none w-full">
                    </div>
                    <div class="flex items-center bg-gray-100 rounded-full p-4">
                        <i class="fas fa-lock text-gray-400 mr-4"></i>
                        <input type="password" id="password" name="password" required placeholder="Set Password" class="bg-transparent outline-none w-full">
                    </div>
                </div>
                <button type="submit" class="bg-green-500 text-white font-bold py-2 px-8 rounded-full shadow-lg mb-4">Create Account</button>
                
                <?php if (!empty($error_message)): ?>
                    <div class="text-red-500 mb-4"><?php echo $error_message; ?></div>
                <?php endif; ?>
            </form>
            
            <a href="login.html" class="bg-blue-500 text-white font-bold py-2 px-8 rounded-full shadow-lg">Go to Login</a>
        </div>
        <!-- Right Side -->
        <div class="w-1/2 bg-purple-600 flex items-center justify-center relative">
            <div class="absolute top-0 left-0 w-full h-full bg-purple-700 opacity-50"></div>
            <div class="relative z-10 text-center text-white p-8">
                <h2 class="text-4xl font-bold mb-4">Already have an account?</h2>
                <p class="text-lg mb-4">Login now to test your knowledge and challenge yourself!</p>
                <div class="flex items-center justify-center mt-8">
                    <div class="bg-white rounded-full p-4 shadow-lg">
                        <i class="fas fa-bolt text-yellow-500 text-2xl"></i>
                    </div>
                </div>
                <div class="mt-8">
                    <div class="bg-purple-800 rounded-lg p-8 shadow-lg">
                        <h1 class="text-9xl font-bold text-orange-400">Q</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
