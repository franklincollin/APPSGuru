<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/2/17
 * Time: 12:57 PM
 */

include "../LibraryAndClasses/Student.php";
include "../LibraryAndClasses/db.php";

$nis = $_POST['nis'];
$dataID = $_POST['dataID'];
$kode_sekolah = $_POST['schoolCode'];

$action = new Student($db);
$action->punishmentDataDescription($nis, $kode_sekolah, $dataID);
?>