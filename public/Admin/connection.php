
<?php
// Start session only if it's not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Define constants if not already defined
// Define constants only if they haven't been defined already
if (!defined('SERVER_PATH')) {
    define('SERVER_PATH', $_SERVER['DOCUMENT_ROOT'] . '/');
}

if (!defined('SITE_PATH')) {
    define('SITE_PATH', 'http://localhost/BscitMiniProject3rdSem/');
}


// Connect to PostgreSQL using PDO
$host = getenv('DB_HOST');
$port = getenv('DB_PORT') ?: '5432';
$dbname = getenv('DB_NAME');
$user = getenv('DB_USER');
$pass = getenv('DB_PASS');

try {
    $con = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $user, $pass);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("❌ Database connection failed: " . $e->getMessage());
}
?>
