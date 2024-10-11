<?php




$mysqli = new mysqli("localhost", "root", "", "quizziee");

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leaderboard</title>
    <script>
        function getCookie(name) {
            const value = `; ${document.cookie}`;
            const parts = value.split(`; ${name}=`);
            if (parts.length === 2) return parts.pop().split(";").shift();
        }
        if (!getCookie('token')) {
            window.location.href = "./login.html";
        }
    </script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link
        href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap"
        rel="stylesheet" />
    <style>
        body {
            font-family: 'Press Start 2P', cursive
        }
    </style>
</head>

<body class="flex flex-col items-center justify-center min-h-[100dvh] min-w-full">
    <div class="border border-[2rem] rounded-2xl border-[#5038ED] flex items-stretch overflow-hidden">
        <div class="p-10 pb-0 flex flex-col w-full">
            <div class="pb-10">
                <a href="./interface.html"><- back to Subjects</a>
            </div>
            <div class="flex flex-col items-center flex-grow">
                <p class="text-[5rem]">

<?php


if(isset($_COOKIE["latestScore"])){
    echo $_COOKIE["latestScore"];
}else{
    echo "0";
}


?>


                </p>
                <div class="bg-[#5038ED] p-10 flex-grow">
                    <p class="text-[3rem]">You</p>
                </div>
            </div>
        </div>
        <div class="p-10 text-[2rem]">
            <p>!Leaderboard!</p>
            <?php

            $stmt = $mysqli->prepare("SELECT * FROM users ORDER BY best_score DESC LIMIT 5");
            $stmt->execute();
            $result = $stmt->get_result();

            $i = 0;
            while ($row = $result->fetch_assoc()) {
                $i++;
                echo ('
                <div class=" min-w-[600px] bg-[#9181F4] flex justify-between py-2 px-10 w-full my-4 rounded">
                    <p>' . $i . '</p>
                    <p>' . $row["username"] . '</p>
                    <p>' . $row["best_score"] . '</p>
                </div>
                ');
            }


            ?>
        </div>
    </div>
    </div>
</body>

</html>