<?php

use App\App;

require dirname(__DIR__) . '/vendor/autoload.php';

echo "<h1>" . App::getGreeting() . "!</h1>";

?>

<p>
    Proudly running:
    <ul>
        <li>PHP: <?= phpversion();?></li>
    </ul>
</p>
