<?
require_once 'Benchmark/Timer.php';
$timer = new Benchmark_Timer();
$timer->start();
sleep(2);
// Code to test here
$timer->stop();
$timer->display();
print "Time elapsed: " . $timer->timeElapsed();
?>

