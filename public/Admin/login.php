<?php
require('../connection.php');
require('../function.php');

$msg = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = getSafeValue($con, $_POST['email']);
    $password = getSafeValue($con, $_POST['password']);

    $stmt = $con->prepare("SELECT * FROM admin WHERE email = :email LIMIT 1");
    $stmt->execute(['email' => $email]);
    $admin = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($admin) {
        if (password_verify($password, $admin['password'])) {
            $_SESSION['ADMIN_LOGIN'] = 'yes';
            $_SESSION['ADMIN_EMAIL'] = $admin['email'];
            $_SESSION['ADMIN_NAME'] = $admin['name'];
            $_SESSION['ADMIN_ROLE'] = $admin['role'];

            header('Location: dashboard.php');
            exit();
        } else {
            $msg = "❌ Invalid Password!";
        }
    } else {
        $msg = "❌ Invalid Email!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Login</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .text-brown { color:#34495e; font-weight: 600; }
    .btn-brown { background-color:#34495e; color: white; border: none; }
    .btn-brown:hover { background-color:#2c3e50; }
    .card { background-color: white; border-radius: 15px; padding: 20px; }
    .input-group .form-control { border-right: none; }
    .input-group-text { background: white; border-left: none; color:#34495e; }
  </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
  <div class="card shadow-lg p-4" style="max-width: 400px;">
    <h2 class="text-center text-brown">Admin</h2>
    <h3 class="text-center text-brown">Sign In</h3>
    <form method="post">
      <div class="mb-3">
        <label class="form-label">Email</label>
        <div class="input-group">
          <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
          <span class="input-group-text"><i class="fas fa-envelope"></i></span>
        </div>
      </div>
      <div class="mb-3">
        <label class="form-label">Password</label>
        <div class="input-group">
          <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
          <span class="input-group-text"><i class="fas fa-lock"></i></span>
        </div>
      </div>
      <div class="text-danger text-center mb-2"><?php echo $msg; ?></div>
      <button type="submit" name="submit" class="btn btn-brown w-100">Login</button>
    </form>
  </div>
</div>
</body>
</html>
