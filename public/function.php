<?php
//  to get data from form
  
// Use this function to safely sanitize input (for display or storage)
function getSafeValue($str) {
    return htmlspecialchars(trim($str), ENT_QUOTES, 'UTF-8');
}


function getProducts($con, $limit = 10, $search = '', $orderBy = 'id DESC') {
    try {
        $query = "SELECT * FROM books";
        $params = [];

        if (!empty($search)) {
            $query .= " WHERE name ILIKE :search OR author ILIKE :search";
            $params['search'] = '%' . $search . '%';
        }

        $query .= " ORDER BY $orderBy LIMIT :limit";
        $stmt = $con->prepare($query);
        foreach ($params as $key => &$val) {
            $stmt->bindParam(':' . $key, $val, PDO::PARAM_STR);
        }
        $stmt->bindValue(':limit', (int)$limit, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "❌ Query Error: " . $e->getMessage();
        return [];
    }
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
