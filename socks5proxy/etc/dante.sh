#!/usr/bin/env bash

useradd $USERNAME && echo "$USERNAME:$PASSWORD" | chpasswd

danted -f $CFGFILE -p $PIDFILE -N $WORKERS