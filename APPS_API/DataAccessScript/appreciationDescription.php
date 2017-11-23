<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/3/17
 * Time: 10:50 AM
 */

include "../LibraryAndClasses/Student.php";
include "../LibraryAndClasses/db.php";

$nis = $_POST['nis'];
$dataID = $_POST['dataID'];
$kode_sekolah = $_POST['schoolCode'];

//$nis = "1064";
//$dataID = "77";
//$kode_sekolah = "4102000";

$action = new Student($db);
$action->appreciationDataDescription($nis, $kode_sekolah, $dataID);
?>