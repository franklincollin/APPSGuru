<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/3/17
 * Time: 10:49 AM
 */

include "../LibraryAndClasses/Student.php";
include "../LibraryAndClasses/db.php";

$nis = $_POST['nis'];
$school_code = $_POST['school_code'];

//$nis = "1064";
//$school_code = "4102000";

$search = new Student($db);

if(isset($nis)) {
    if(isset($school_code)){
        $search->searchAppreciationData($nis, $school_code);
    }
    else {
        echo "Error";
    }
}
?>