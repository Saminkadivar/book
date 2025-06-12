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
  
function getSafeValue($con, $value) {
    return htmlspecialchars(strip_tags(trim($value)));
}



