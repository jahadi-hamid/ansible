#!/bin/bash
cd $( dirname `readlink -f $0`)
if [[ $1 == "discovery" ]];
then
echo "{\"data\":[$(find /var/log/nginx/ -type f -name [a-z0-9]*.access.log|grep 'domain1\|domain2\|domain3' |awk -F'/'  '{print "{\"{#LOGPATH}\":\""$0 "\",\"{#LOGNAME}\":\""substr($NF,1,length($NF)-11)"\"},"}'  |sed '$ s/.$//' |tr '\n' ' ')]}"
exit 0
fi;
x=`tail -3000000 $1 2>/dev/null | awk -v time="$(date "+%d/%b/%Y:%R:" -d "1 mins ago")" 'NR==1{for(i=1;i<=NF;i++){if($i=="Time:"){c=i;break}}} $(c+1) ~ time { print }' | awk -f ./log.awk 2>/dev/null` ; if [[ -z $x ]] ; then  echo '{"chm":"0","chh":"0","nr":"0","rt":"0","rtt":"0","bw":"0","200":"0","204":"0","400":"0","401":"0","403":"0","404":"0","499":"0","500":"0","502":"0","504":"0"}' ; else echo "$x"; fi
