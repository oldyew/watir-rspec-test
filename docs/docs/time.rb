starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
elapsed = ending - starting

starting = Time.now
ending = Time.now
elapsed = ending - starting
