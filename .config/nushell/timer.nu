def timer [time: string, name: string] {
        [$time, "-n",  $name] | ^`D:\Desktop 2\timer\timer.exe` $in
}

def 'timer work' [] {
    timer '15m' Working
    wsl espeak "Work session over"
}

def 'timer work 1' [] {
    timer '25m' Working
    wsl espeak "Work session over"
}

def 'timer work code' [] {
    timer '60m' Working
    wsl espeak "Work session over"
}

def 'timer break' [] {
    timer '5m' Break!
    wsl espeak "Break session over"
}

def 'timer break-1' [] {
    timer '10m' Break!
    wsl espeak "Break session over"
}

def 'timer time' [session: string, time: string] {
    timer $time $session
    wsl espeak $"($session) session over"
}
