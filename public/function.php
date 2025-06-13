<?php
//  to get data from form
  
// Use this function to safely sanitize input (for display or storage)
function getSafeValue($str) {
    return htmlspecialchars(trim($str), ENT_QUOTES, 'UTF-8');
}

function getProduct($con, $limit = 4, $category = '', $search = '', $orderBy = 'id desc') {
    $sql = "SELECT * FROM books WHERE status = 1";
    if ($category !== '') {
        $sql .= " AND category = :category";
    }
    if ($search !== '') {
        $sql .= " AND name ILIKE :search";
    }
    $sql .= " ORDER BY $orderBy LIMIT :limit";

    $stmt = $con->prepare($sql);
    if ($category !== '') {
        $stmt->bindValue(':category', $category);
    }
    if ($search !== '') {
        $stmt->bindValue(':search', '%' . $search . '%');
    }
    $stmt->bindValue(':limit', (int)$limit, PDO::PARAM_INT);

    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


//To update the user data
  function updateProfile($con, $changeName = '', $changeEmail = '', $changeMobile = '', $changePassword = '')
  {
    $sql = "UPDATE user Set";
    
    if ($changeName != '') {
      $sql .= " name=$changeName";
    }
    
    if ($changeEmail != '') {
      $sql .= " and email=$changeEmail";
    }
    
    if ($changeMobile != '') {
      $sql .= " and mobile=$changeMobile";
    }
    
    if ($changePassword != '') {
      $sql .= " and password=$changePassword";
    }
  }
