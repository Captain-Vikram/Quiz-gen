<?php
session_start(); // Start a session to keep track of user answers and score

// Database connection
$mysqli = new mysqli("localhost", "root", "", "quizziee");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Initialize session variables if not already set
if (!isset($_SESSION['current_question'])) {
    $_SESSION['current_question'] = 0; // Track current question index
    $_SESSION['score'] = 0; // Track user's score
    $_SESSION['answered_count'] = 0; // Count of answered questions
    $_SESSION['unanswered'] = []; // Track unanswered questions
    $_SESSION['asked_questions'] = []; // Track all appeared questions
    $_SESSION['answered_questions'] = []; // Track answered questions
    $_SESSION['quiz_start_time'] = time(); // Start time of the quiz
}

// Set total questions for the quiz based on user's selection
if (!isset($_SESSION['total_questions'])) {
    $_SESSION['total_questions'] = isset($_POST['num_questions']) ? intval($_POST['num_questions']) : 10; // Set total questions
}
$total_questions = $_SESSION['total_questions'];

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
        $_SESSION['answered_count']++; // Increment answered question count
        $_SESSION['answered_questions'][] = $_SESSION['current_question']; // Track answered question
    } elseif (isset($_POST['skip'])) {
        $_SESSION['unanswered'][] = $_SESSION['current_question']; // Track skipped question
    }

    // Handle navigation between questions
    if (isset($_POST['next'])) {
        $_SESSION['current_question']++;
    } elseif (isset($_POST['back'])) {
        $_SESSION['current_question']--;
    } elseif (isset($_POST['skip'])) {
        // Skip to the next question
        $_SESSION['current_question']++;
    } elseif (isset($_POST['submit'])) {
        // Check for unanswered questions before submitting
        if (!empty($_SESSION['unanswered'])) {
            echo "<script>
                alert('You have unanswered questions. Please answer them before submitting.');
                window.location.href = 'quiz.php';
            </script>";
            // Redirect to the first unanswered question
            $_SESSION['current_question'] = $_SESSION['unanswered'][0];
            exit();
        }
        submitQuiz($mysqli);
    }
}

// Prevent going beyond the last question
if ($_SESSION['current_question'] >= $_SESSION['total_questions']) {
    $_SESSION['current_question'] = $_SESSION['total_questions'] - 1;
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
do {
    // Get a random question offset
    $random_offset = rand(0, $total_questions - 1);
    // Check if we have exhausted all unique questions
    if (count($_SESSION['asked_questions']) >= $total_questions) {
        // Handle case where all questions have been asked
        submitQuiz($mysqli);
        exit(); // Exit after submitting
    }
} while (in_array($random_offset, $_SESSION['asked_questions']));

$_SESSION['asked_questions'][] = $random_offset; // Track the appeared question index
$stmt = $mysqli->prepare("SELECT * FROM $table LIMIT 1 OFFSET ?");
$stmt->bind_param("i", $random_offset);
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

    // Randomize the options
    $keys = array_keys($options);
    shuffle($keys);
    
    $shuffled_options = [];
    foreach ($keys as $key) {
        $shuffled_options[$key] = $options[$key];
    }

    $options = $shuffled_options; // Update to shuffled options
} else {
    submitQuiz($mysqli);
}

function submitQuiz($mysqli) {
    $score = (int)$_SESSION['score'];
    $stmt = $mysqli->prepare("SELECT * FROM users WHERE token = ?");
    $stmt->bind_param("s", $_COOKIE["token"]);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result) {
        $row = $result->fetch_assoc();
        if ($row["best_score"] < $score) {
            $stmt = $mysqli->prepare("UPDATE users SET best_score = ? WHERE token = ?");
            $stmt->bind_param("is", $score, $_COOKIE["token"]);
            $stmt->execute();
        }
        echo "<script>window.location.href='./score.php'</script>";
        echo "<h1>Your Score: " . $_SESSION['score'] . " out of " . $_SESSION['total_questions'] . "</h1>";
        echo "<a href='interface.html' class='inline-block px-4 py-2 bg-purple-500 text-white rounded-lg'>Back to Subjects</a>";
        session_destroy(); // End the session
        setcookie("latestScore", $score, time() + (86400 * 30), "/");
        exit();
    } else {
        echo "Failed to get your details";
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <script>
        function getCookie(name) {
            const value = `; ${document.cookie}`;
            const parts = value.split(`; ${name}=`); 
            if (parts.length === 2) return parts.pop().split(";").shift();
        }
        if (!getCookie('token')) {
            window.location.href = "/login.html";
        }

        // Timer logic (300 seconds = 5 minutes)
        let timeLeft = <?php echo time() - $_SESSION['quiz_start_time']; ?>;
        let maxTime = 300; // 5 minutes = 300 seconds
        function startTimer() {
            let timer = setInterval(function () {
                let remainingTime = maxTime - timeLeft;
                if (remainingTime <= 0) {
                    clearInterval(timer);
                    alert("Time's up! Redirecting to leaderboard.");
                    window.location.href = "leaderboard.php?score=<?php echo $_SESSION['score']; ?>";
                } else {
                    let minutes = Math.floor(remainingTime / 60);
                    let seconds = remainingTime % 60;
                    document.getElementById("timer").innerHTML = `Time Left: ${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
                }
                timeLeft++;
            }, 1000);
        }
        window.onload = startTimer;
    </script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet" />
    <style>
        .option-box {
            background-color: #f9f9f9; /* Light background for options */
            border: 2px solid #e2e2e2; /* Light border */
            border-radius: 0.5rem; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }

        .option-box:hover {
            background-color: #e0e0e0; /* Change background on hover */
        }

        label:has(input[type="radio"]:checked) {
            background-color: #e0e0e0;
            border: 1px solid #000;
        }
    </style>
    <title>Quiz</title>
</head>
<body class="flex items-center justify-center min-h-screen bg-white">
    <div class="bg-white border-8 border-purple-500 rounded-3xl p-16 text-center">
        <h1 class="text-5xl font-bold mb-8" style="font-family: 'Press Start 2P', cursive;">Question <?php echo $_SESSION['current_question'] + 1; ?> of <?php echo $total_questions; ?></h1>
        <h2 class="text-2xl font-bold mb-4"><?php echo htmlspecialchars($question); ?></h2>
        <div id="timer" class="text-2xl font-bold mb-4 text-red-600"></div> <!-- Display timer -->

        <form action="quiz.php" method="POST">
            <input type="hidden" name="subject" value="<?php echo htmlspecialchars($subject); ?>">
            <input type="hidden" name="correct_option" value="<?php echo htmlspecialchars($correct_option); ?>">
            <ul class="list-style-none list-inside mb-4">
                <?php foreach ($options as $key => $option): ?>
                    <li>
                        <label class="option-box p-4 mb-2 block">
                            <input type="radio" name="answer" value="<?php echo $key; ?>" class="mr-2"><?php echo htmlspecialchars($option); ?>
                        </label>
                    </li>
                <?php endforeach; ?>
            </ul>
            <div class="flex space-x-4 justify-center">
                <button type="submit" name="back" class="px-6 py-3 text-white bg-gray-500 hover:bg-gray-600 rounded-md">Back</button>
                <button type="submit" name="skip" class="px-6 py-3 text-white bg-yellow-500 hover:bg-yellow-600 rounded-md">Skip</button>
                <button type="submit" name="next" class="px-6 py-3 text-white bg-blue-500 hover:bg-blue-600 rounded-md">Next</button>
            </div>
        </form>
    </div>
</body>
</html>
