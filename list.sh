#!/usr/bin/bash

ps -eo pid,args,comm | grep node | awk '{system("pwdx " $1); print $2 " " $3 }'
