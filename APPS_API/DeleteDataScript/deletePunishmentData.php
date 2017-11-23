<?php
/**
 * Created by PhpStorm.
 * User: blackmask
 * Date: 11/6/17
 * Time: 2:45 PM
 */

include "../LibraryAndClasses/db.php";
include "../LibraryAndClasses/DeleteData.php";

$dataID = $_POST['dataID'];

$action = new DeleteData($db, $db);

$action->deletePunishmentData($dataID);
?>