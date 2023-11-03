#!/bin/bash
echo "started"
docmd() {
    read -p "container@ubuntu:~ " CMD
    eval "$CMD"
    echo "container@ubuntu:~ "
    docmd2
}
docmd2() {
    read -p "container@ubuntu:~ " CMD2
    eval "$CMD2"
    echo "container@ubuntu:~ "
    docmd
}
docmd