<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/13/17
 * Time: 8:24 AM
 */

include "../LibraryAndClasses/Student.php";
include "../LibraryAndClasses/db.php";

//$nis = "1064";
//$school_code = "4102000";

$nis = $_POST['nis'];
$school_code = $_POST['schoolCode'];

$action = new Student($db);
$action->searchPunishmentAndAppreciationData($nis, $school_code);
?>