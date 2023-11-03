#!/bin/bash
echo "started"
docmd() {
    read -p "user@ubuntu:~ " CMD
    eval "$CMD"
    echo "user@ubuntu:~ "
    docmd2
}
docmd2() {
    read -p "user@ubuntu:~ " CMD2
    eval "$CMD2"
    echo "user@ubuntu:~ "
    docmd
}
docmd