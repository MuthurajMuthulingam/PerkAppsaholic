<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Activity {
    public function __construct() {
        ;
    }
  
    public function getBusServices() {
        
        $query = "Select * from Buses";
        
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "BusServices";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT * FROM Buses";
$result = $conn->query($sql);
$resultArr = array();
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        //echo "id: " . $row["BusID"]. " - Name: " . $row["TravelsName"]. " " . $row["StartPoint"]. "<br>";
    $resultsArray['BusID'] = $row['BusID'];
    $resultsArray['TravelsName'] = $row['TravelsName'];
    $resultsArray['StartPoint'] = $row['StartPoint'];
    $resultsArray['EndPoint'] = $row['EndPoint'];
    $resultsArray['TravelDate'] = $row['TravelDate'];
    $resultsArray['PerkPoints'] = $row['PerkPoints'];
    array_push($resultArr, $resultsArray);
    }
    
    echo json_encode($resultArr);
    
} else {
    echo json_encode("");
}
$conn->close();
    }
}
