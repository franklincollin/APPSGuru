<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/6/17
 * Time: 5:13 PM
 */

include "../LibraryAndClasses/TeacherInput.php";
include "../LibraryAndClasses/db.php";

$studentName = $_POST['studentName'];
$appreciation = $_POST['appreciation'];
$information = $_POST['information'];
$dateTime = $_POST['dateTime'];
$schoolCode = $_POST['schoolCode'];
$nuptk = $_POST['nuptk'];

$teacherActions = new TeacherInput($db, $dateTime, $schoolCode);

$teacherActions->inputAppreciationPoint($studentName, $appreciation, $information, $nuptk);
?>