<?php
// Start session only if it's not already started
// Define constants if not already defined
if (!defined('SERVER_PATH')) {
    define('SERVER_PATH', $_SERVER['DOCUMENT_ROOT'] . '/');
}

// Use live site URL in production (change localhost if deploying)
if (!defined('SITE_PATH')) {
    define('SITE_PATH', 'https://samin-fe93.onrender.com/');
}

// Connect to PostgreSQL using PDO
$host   = trim(getenv('DB_HOST'));
$port   = trim(getenv('DB_PORT') ?: '5432');
$dbname = trim(getenv('DB_NAME'));
$user   = trim(getenv('DB_USER'));
$pass   = trim(getenv('DB_PASS'));

try {
    $con = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $user, $pass);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("❌ Database connection failed: " . $e->getMessage());
}
?>
