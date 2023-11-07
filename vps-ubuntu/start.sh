#!/bin/bash
echo "started"
docmd() {
    read -p "container@ubuntu:~ " CMD
    eval "$CMD"
    echo "container@ubuntu:~ "
    docmd
}
docmd