#!/bin/bash

./script7dop.bash&

while true

do

read line

case $line in

"term")

kill -SIGTERM $(cat mypid)

exit

;;

"+")

kill -USR1 $(cat mypid)

;;

"*")

kill -USR2 $(cat mypid)

;;

esac

done

Дополнительный файл:

#!/bin/bash

echo $$ > mypid

i=1

mode="+"

sigterm()

{

echo "STOP"

exit

}

user1()

{

mode="+"

}

user2()

{

mode="*"

}

trap 'sigterm' SIGTERM

trap 'user1' USR1

trap 'user2' USR2

while true

do

case $mode in

"+")

let i=$i+2

;;

"*")

+let i=$i*2

;;

esac

echo $i

sleep 1

done
