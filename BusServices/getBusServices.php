<?php
include_once 'Activity.php';
$activity = new Activity();

$fromPoint = $_REQUEST['from'];
$toPint = $_REQUEST['to'];
$date = $_REQUEST['date'];
if($fromPoint && $toPint && $date) {
    $activity->getBusServices();
} else {
    json_encode("Status:False"); 
}

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

