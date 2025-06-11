
  
  <?php

$host = getenv('dpg-d14lgd6uk2gs73b0rr50-a');
$port = getenv('5432');
$dbname = getenv('mini_project_i0kw');
$user = getenv('mini_project_i0kw_user');
$pass = getenv('1Sc7e6YK7bWVeadJLOByKPpQjQgrOOND');

echo "<pre>";
echo "DB_HOST: $host\n";
echo "DB_PORT: $port\n";
echo "DB_NAME: $dbname\n";
echo "DB_USER: $user\n";
echo "DB_PASS: " . ($pass ? 'SET' : 'NOT SET') . "\n";
echo "</pre>";

try {
    $con = new PDO(
        "pgsql:host=$host;port=$port;dbname=$dbname",
        $user,
        $pass
    );
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "✅ Connected to PostgreSQL!";
} catch (PDOException $e) {
    echo "❌ Database connection failed: " . $e->getMessage();
}


  define('SERVER_PATH', $_SERVER['DOCUMENT_ROOT'] . '/');
  const SITE_PATH = 'localhost//BscitMiniProject3rdSem/';
  
  
  ?>
