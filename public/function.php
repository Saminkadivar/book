<?php
//  to get data from form
  
// Use this function to safely sanitize input (for display or storage)
function getSafeValue($str) {
    return htmlspecialchars(trim($str), ENT_QUOTES, 'UTF-8');
}

function getProduct($con, $limit = 4, $cat_id = '', $book_id = '', $order_by = 'id DESC') {
    $query = "SELECT * FROM books WHERE status = 1";
    if ($cat_id !== '') {
        $query .= " AND category_id = :cat_id";
    }
    if ($book_id !== '') {
        $query .= " AND id = :book_id";
    }
    $query .= " ORDER BY $order_by LIMIT :limit";

    $stmt = $con->prepare($query);

    if ($cat_id !== '') $stmt->bindValue(':cat_id', $cat_id, PDO::PARAM_INT);
    if ($book_id !== '') $stmt->bindValue(':book_id', $book_id, PDO::PARAM_INT);
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
