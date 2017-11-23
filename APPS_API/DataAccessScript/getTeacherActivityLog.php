<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/15/17
 * Time: 1:31 AM
 */

include "../LibraryAndClasses/Teacher.php";
include "../LibraryAndClasses/db.php";

//$nuptk = "12345678";
//$school_code = "4102000";

$nuptk = $_POST['nuptk'];
$school_code = $_POST['school_code'];

$action = new Teacher($db);
$action->searchTeacherActivityLog($nuptk, $school_code);
?>