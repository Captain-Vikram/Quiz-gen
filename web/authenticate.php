<?php

function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';

    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[random_int(0, $charactersLength - 1)];
    }

    return $randomString;
}

// Connect to MySQL database
$mysqli = new mysqli("localhost", "root", "", "quizziee");

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Check if POST variables are set
if (!isset($_POST['username']) || !isset($_POST['password'])) {
    die("Username or password not set.");
}

$username = trim($_POST['username']); // Trim whitespace
$password = $_POST['password'];

// Debugging: Output the username
// var_dump($username);

// Prepare and execute the query to check for user credentials
$query = "SELECT * FROM users WHERE username = ?";
$stmt = $mysqli->prepare($query);
if ($stmt === false) {
    die("Prepare failed: " . htmlspecialchars($mysqli->error));
}

$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    
    // Direct comparison for plain text
    if ($password === $user['password']) {
        // Successful authentication logic here
        // Redirect or set session
        $token = generateRandomString(100);
        $stmt = $mysqli->prepare('UPDATE users SET token = ? WHERE username = ?');
        $stmt->bind_param("ss", $token, $username);
        $result = $stmt->execute();
        if($result){
            header("Location: interface.html");
            setcookie("token", $token, time() + (86400 * 30), "/");
            exit;
        }else{
            echo "Failed to save token";
            exit;
        }
        
    } else {
        echo "Invalid password!";
        exit;
    }
} else {
    echo "User not found!";
    exit;
}

$stmt->close();
$mysqli->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quizziee - Authenticating</title>
    <link rel="icon" href="img/logo.jpg" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>

<body class="bg-white flex items-center justify-center min-h-screen">
    <div class="flex flex-col items-center justify-center bg-gray-100 rounded-lg p-8 shadow-lg max-w-md">
        <h3 class="text-2xl font-bold text-gray-800 mb-4">Authenticating...</h3>
        <p class="text-lg text-gray-600 mb-8">Please wait while we verify your credentials.</p>
        
        <!-- Loading Spinner -->
        <div class="flex items-center justify-center mb-8">
            <div class="spinner-border animate-spin inline-block w-10 h-10 border-4 rounded-full text-purple-500 border-t-transparent"></div>
        </div>

        <!-- Continue Button -->
        <button class="bg-purple-600 text-white font-bold py-2 px-8 rounded-full shadow-lg" onclick="window.location.href='interface.html'">
            Continue to Quiz
        </button>
    </div>

    <!-- Tailwind Spinner Animation -->
    <style>
        .spinner-border {
            border-top-color: transparent;
        }
    </style>
</body>

</html>
