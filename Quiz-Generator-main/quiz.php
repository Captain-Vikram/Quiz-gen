<?php
session_start(); // Start a session to keep track of user answers and score

// Database connection
$mysqli = new mysqli("localhost", "root", "", "quizziee_login");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Initialize session variables if not already set
if (!isset($_SESSION['current_question'])) {
    $_SESSION['current_question'] = 0; // Track current question index
    $_SESSION['score'] = 0; // Track user's score
}

// Set total questions for the quiz based on user's selection
$total_questions = isset($_POST['num_questions']) ? intval($_POST['num_questions']) : 10; // Default to 10 if not set

// Check if a subject has been selected, and store it in session
if (isset($_POST['subject'])) {
    $_SESSION['subject'] = $_POST['subject']; // Save subject in session
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['answer'])) {
        // Check if the answer is correct
        $correct_option = $_POST['correct_option'];
        if ($_POST['answer'] === $correct_option) {
            $_SESSION['score']++; // Increment score if answer is correct
        }
    }
    // Move to the next question or stay on the current question if skipping
    if (isset($_POST['next'])) {
        $_SESSION['current_question']++;
    } elseif (isset($_POST['back'])) {
        $_SESSION['current_question']--;
    } elseif (isset($_POST['submit'])) {
        // End the quiz if the user clicks "Submit"
        echo "<h1>Your Score: " . $_SESSION['score'] . " out of $total_questions</h1>";
        echo "<a href='interface.html' class='inline-block px-4 py-2 bg-purple-500 text-white rounded-lg'>Back to Subjects</a>";
        session_destroy(); // End the session
        exit();
    }
}

// Prevent going beyond the last question
if ($_SESSION['current_question'] >= $total_questions) {
    $_SESSION['current_question'] = $total_questions - 1;
}

// Prevent going before the first question
if ($_SESSION['current_question'] < 0) {
    $_SESSION['current_question'] = 0;
}

// Check if the subject is set in the session, if not, throw an error
if (!isset($_SESSION['subject'])) {
    die("Subject not selected.");
}

$subject = $_SESSION['subject'];
$table = null;

// Validate and map the subject to the table
$valid_subjects = ['maths', 'chemistry', 'physics', 'biology'];
if (in_array($subject, $valid_subjects)) {
    $table = $subject . '_questions'; // Assuming table names follow a consistent pattern
} else {
    die("Invalid subject selected.");
}

// Check if the table exists
$table_check = $mysqli->query("SHOW TABLES LIKE '$table'");
if ($table_check->num_rows == 0) {
    die("Table '$table' does not exist in the database.");
}

// Prepare a statement to fetch questions
$stmt = $mysqli->prepare("SELECT * FROM $table LIMIT 1 OFFSET ?");
if ($stmt === false) {
    die("Prepare failed: " . htmlspecialchars($mysqli->error)); // Display error message
}

$stmt->bind_param("i", $_SESSION['current_question']);
$stmt->execute();
$result = $stmt->get_result();

// Fetch the current question
if ($row = $result->fetch_assoc()) {
    $question = $row['question'];
    $options = [
        'a' => $row['option_a'],
        'b' => $row['option_b'],
        'c' => $row['option_c'],
        'd' => $row['option_d'],
    ];
    $correct_option = $row['correct_option'];
} else {
    // No more questions, show the score
    echo "<h1>Your Score: " . $_SESSION['score'] . " out of $total_questions</h1>";
    echo "<a href='interface.html' class='inline-block px-4 py-2 bg-purple-500 text-white rounded-lg'>Back to Subjects</a>";
    session_destroy(); // End the session
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <style>
        .option-box {
            background-color: #f9f9f9; /* Light background for options */
            border: 2px solid #e2e2e2; /* Light border */
            border-radius: 0.5rem; /* Rounded corners */
            padding: 1rem; /* Inner padding */
            margin-bottom: 1rem; /* Spacing between options */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }
        .option-box:hover {
            background-color: #e0e0e0; /* Change background on hover */
        }
    </style>
    <title>Quiz</title>

    <script>
        let timeLeft = <?php echo isset($_POST['time_limit']) ? intval($_POST['time_limit']) * 60 : 30; ?>; // Default to 5 minutes (300 seconds)

        function startTimer() {
            let timer = setInterval(function() {
                let minutes = Math.floor(timeLeft / 60);
                let seconds = timeLeft % 60;
                document.getElementById("timer").innerHTML = `Time Left: ${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
                if (timeLeft <= 0) {
                    clearInterval(timer);
                    document.getElementById("submitTest").click(); // Submit the test automatically
                }
                timeLeft--;
            }, 1000);
        }

        window.onload = startTimer;
    </script>
</head>
<body class="flex items-center justify-center min-h-screen bg-white">
    <div class="bg-white border-8 border-purple-500 rounded-3xl p-16 text-center">
        <h1 class="text-5xl font-bold mb-8" style="font-family: 'Press Start 2P', cursive;">Question <?php echo $_SESSION['current_question'] + 1; ?> of <?php echo $total_questions; ?></h1>
        <h2 class="text-2xl font-bold mb-4"><?php echo htmlspecialchars($question); ?></h2>
        <div id="timer" class="text-2xl font-bold mb-4 text-red-600"></div> <!-- Display timer -->

        <form action="quiz.php" method="POST">
            <input type="hidden" name="subject" value="<?php echo htmlspecialchars($subject); ?>">
            <input type="hidden" name="correct_option" value="<?php echo htmlspecialchars($correct_option); ?>">
            <ul class="list-disc list-inside mb-4">
                <?php foreach ($options as $key => $option): ?>
                    <li>
                        <div class="option-box">
                            <label>
                                <input type="radio" name="answer" value="<?php echo $key; ?>">
                                <?php echo htmlspecialchars($option); ?>
                            </label>
                        </div>
                    </li>
                <?php endforeach; ?>
            </ul>
            <div class="flex justify-between">
                <button type="submit" name="back" class="px-4 py-2 bg-gray-500 text-white rounded-lg">Previous Question</button>
                <button type="submit" name="next" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Next Question</button>
                <button type="submit" name="submit" id="submitTest" class="px-4 py-2 bg-red-500 text-white rounded-lg">Submit Test</button>
            </div>
        </form>
    </div>
</body>
</html>

<?php
// Close the statement and the connection
$stmt->close();
$mysqli->close();
?>
