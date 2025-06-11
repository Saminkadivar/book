<?php
try {
    $conn = new PDO("pgsql:host=" . getenv('dpg-d14lgd6uk2gs73b0rr50-a') . ";port=" . getenv('5432') . ";dbname=" . getenv('mini_project_i0kw'), getenv('mini_project_i0kw_user'), getenv('1Sc7e6YK7bWVeadJLOByKPpQjQgrOOND'));
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Database connection failed: " . $e->getMessage();
}

  
  
  define('SERVER_PATH', $_SERVER['DOCUMENT_ROOT'] . '/');
  const SITE_PATH = 'localhost//BscitMiniProject3rdSem/';
  
  
  ?>
