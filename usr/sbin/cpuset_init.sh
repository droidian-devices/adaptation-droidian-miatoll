#!/bin/bash

mkdir -p /dev/cpuset
mount none /dev/cpuset -t cpuset -o nodev,noexec,nosuid

for i in background system-background top-app foreground camera-daemon
do
    mkdir -p /dev/cpuset/$i
    echo 0-7 > /dev/cpuset/$i/cpus
    echo 0 > /dev/cpuset/$i/mems
    chgrp droidian /dev/cpuset/$i/tasks
done

exit 0
