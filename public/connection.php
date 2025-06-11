<?php
try {
    $conn = new PDO("pgsql:host=" . getenv('DB_HOST') . ";port=" . getenv('DB_PORT') . ";dbname=" . getenv('DB_NAME'), getenv('DB_USER'), getenv('DB_PASS'));
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Database connection failed: " . $e->getMessage();
}

  
  
  define('SERVER_PATH', $_SERVER['DOCUMENT_ROOT'] . '/');
  const SITE_PATH = 'localhost//BscitMiniProject3rdSem/';
  
  
  ?>
