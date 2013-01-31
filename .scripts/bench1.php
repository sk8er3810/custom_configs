<?
$start_timestamp = time();
//...
//---your Code---
//...
usleep(20);
$end_timestamp = time();
$duration = $end_timestamp - $start_timestamp;
error_log("Execution took ".$duration." milliseconds.");
?>
