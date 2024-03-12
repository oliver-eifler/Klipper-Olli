#!/bin/bash

ls -lR /dev/ | grep -v "\->\s../tty" | grep -v ttyprintk | grep -e "tty[[:alpha:]]" -e serial
