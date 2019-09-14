<?php

echo "<h1>Hello php world!</h1>";

// Read mysql version
$host = getenv('MYSQL_HOST');
$db = getenv('MYSQL_DATABASE');
$user = getenv('MYSQL_USER');
$passwd = getenv('MYSQL_PASSWORD');

$pdo = new PDO('mysql:host=' . $host . ';dbname=' . $db, $user, $passwd);

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
