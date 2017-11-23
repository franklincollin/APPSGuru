<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/9/17
 * Time: 11:15 AM
 */

include "../LibraryAndClasses/Student.php";
include "../LibraryAndClasses/db.php";

$nis = $_POST['nis'];
$kode_sekolah = $_POST['schoolCode'];

//$nis = "1064";
//$kode_sekolah = "4102000";

$action = new Student($db);
$action->searchSpesificPunishmentData($nis, $kode_sekolah);
?>