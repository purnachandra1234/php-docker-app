<?php

use App\App;

require dirname(__DIR__) . '/vendor/autoload.php';

echo "<h1>" . App::getGreeting() . "!</h1>";

// Read mysql version
$db = getenv('MYSQL_DATABASE');
$user = getenv('MYSQL_USER');
$passwd = getenv('MYSQL_PASSWORD');

$pdo = new PDO('mysql:host=db;dbname=' . $db, $user, $passwd);

$stm = $pdo->query("SELECT VERSION()");
list($mysqlVersion) = $stm->fetch();

?>

<p>
    Proudly running:
    <ul>
        <li>PHP: <?= phpversion();?></li>
        <li>MySQL: <?= $mysqlVersion;?></li>
    </ul>
</p>
