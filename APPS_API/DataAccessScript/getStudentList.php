<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/16/17
 * Time: 8:17 PM
 */

include "../LibraryAndClasses/Student.php";
include "../LibraryAndClasses/db.php";

$school_code = $_POST['school_code'];
$name = $_POST['name'];

// $school_code = "4102000";
// $name = "f";

$action = new Student($db);
$action->searchStudent($school_code, $name);
?>