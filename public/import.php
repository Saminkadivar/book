<?php
require 'connection.php'; // Make sure this uses PDO for PostgreSQL

$sql = file_get_contents('mini_project.sql');

try {
    $con->exec($sql);
    echo "✅ SQL file imported successfully!";
} catch (PDOException $e) {
    echo "❌ Import failed: " . $e->getMessage();
}
?>
