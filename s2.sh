#!/bin/bash

+at now+2minutes -f ./s1.bash

tail -n 0 -f ~/report.tmp
