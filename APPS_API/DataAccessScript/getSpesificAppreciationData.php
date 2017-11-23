<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/12/17
 * Time: 8:22 PM
 */

include "../LibraryAndClasses/Student.php";
include "../LibraryAndClasses/db.php";

$nis = $_POST['nis'];
$kode_sekolah = $_POST['schoolCode'];

//$nis = "1064";
//$kode_sekolah = "4102000";

$action = new Student($db);
$action->searchSpesificAppreciationData($nis, $kode_sekolah);
?>