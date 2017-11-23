<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/6/17
 * Time: 5:12 PM
 */

include "../LibraryAndClasses/TeacherInput.php";
include "../LibraryAndClasses/db.php";

$studentName = $_POST['studentName'];
$punishment = $_POST['punishment'];
$information = $_POST['information'];
$dateTime = $_POST['dateTime'];
$schoolCode = $_POST['schoolCode'];
$nuptk = $_POST['nuptk'];

$teacherActions = new TeacherInput($db, $dateTime, $schoolCode);

$teacherActions->inputPunishmentPoint($studentName, $punishment, $information, $nuptk);
?>