#set the parsing to new line
IFS='
'

case $1 in
"")	echo 'Usage: zap [-2] pattern' 1>&2; exit 1;;
-*) SIG=$1; shift 
esac

echo 'PID TTY      STAT   TIME COMMAND'
kill `pick $SIG \`ps aux| grep "$*"\` | awk '{print $2}'` 
