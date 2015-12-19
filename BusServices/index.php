<!DOCTYPE html>

<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        include_once 'Activity.php';
        $activity = new Activity();
        $activity->getBusServices();
        // put
        //  your code here
        ?>
    </body>
</html>
