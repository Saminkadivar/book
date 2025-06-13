<?php


// Constants (adjust if needed)
if (!defined('SERVER_PATH')) {
    define('SERVER_PATH', $_SERVER['DOCUMENT_ROOT'] . '/');
}
if (!defined('SITE_PATH')) {
    define('SITE_PATH', 'https://samin-fe93.onrender.com/admin/'); // adjust if using live domain
}

// PostgreSQL env vars (set in Render/Hosting)
$host = getenv('DB_HOST');
$port = getenv('DB_PORT') ?: '5432';
$dbname = getenv('DB_NAME');
$user = getenv('DB_USER');
$pass = getenv('DB_PASS');

try {
    $con = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $user, $pass);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "✅ PostgreSQL connected.";
} catch (PDOException $e) {
    die("❌ Database connection failed: " . $e->getMessage());
}
?>
