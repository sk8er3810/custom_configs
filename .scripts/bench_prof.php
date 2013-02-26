<?

 require_once 'Benchmark/Profiler.php';

 $profiler = new Benchmark_Profiler();
 

 function myFunction() {

     global $profiler;

     $profiler->enterSection('myFunction');

     //do something
     //
          $profiler->leaveSection('myFunction');
     //
               return;
     //
}
     //
     //            
     //
                  $profiler->start();
     //
     //              //do something
     //
                    myFunction();
     //
     //                //do more
     //
                      $profiler->stop();
     //
                       $profiler->display();
     //
                   ?>
