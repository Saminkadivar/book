<?php
// === Load PostgreSQL connection variables from environment ===
$host = getenv('DB_HOST');
$port = getenv('DB_PORT') ?: '5432';
$dbname = getenv('DB_NAME');
$user = getenv('DB_USER');
$pass = getenv('DB_PASS');

// === Connect to PostgreSQL ===
try {
    $pdo = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "<strong>✅ Connected to PostgreSQL successfully.</strong><br><br>";
} catch (PDOException $e) {
    die("❌ Connection failed: " . $e->getMessage());
}

// === Load and run SQL file ===
$sqlFile = 'mini_projects.sql';

if (!file_exists($sqlFile)) {
    die("❌ SQL file not found: <code>$sqlFile</code>");
}

$sql = file_get_contents($sqlFile);

try {
    $pdo->exec($sql);
    echo "<strong>✅ SQL file <code>$sqlFile</code> imported successfully!</strong>";
} catch (PDOException $e) {
    echo "❌ Import failed: " . $e->getMessage();
}
?>
