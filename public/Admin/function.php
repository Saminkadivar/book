<?php
  function pr($arr)
  {
    echo '<pre>';
    print_r($arr);
  }
  
  function prx($arr)
  {
    echo '<pre>';
    print_r($arr);
    die();
  }
  
function getSafeValue($str) {
    return trim(strip_tags($str));
}
?>



