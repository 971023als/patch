#!/bin/bash

cd /tmp
wget https://sourceforge.net/projects/rkhunter/files/rkhunter/1.4.6/rkhunter-1.4.6.tar.gz
tar zxvf rkhunter-1.4.6.tar.gz
cd rkhunter-1.4.6
sudo ./installer.sh --layout custom /usr/local --install
PATH=$PATH:/usr/local/bin
sudo /usr/local/bin/rkhunter --propupd
sudo /usr/local/bin/rkhunter --update


. function.sh

 

TMP1=./log/`SCRIPTNAME`.log

> $TMP1

 

BAR

CODE [U-16] /dev에 존재하지 않는 device 파일 점검

cat << EOF >> $RESULT

[양호]: dev에 대한 파일 점검 후 존재하지 않은 device 파일을 제거한 경우

[취약]: dev에 대한 파일 미점검, 또는, 존재하지 않은 device 파일을 방치한 경우

EOF

BAR

 

 

find /dev -type f -exec ls -l {} \; > $TMP1

 

if [ -s $TMP1 ] ; then

WARN 파일이 존재합니다. 

INFO $TMP1를 확인하십시오.

else

OK 파일이 존재하지 않습니다. 

fi

 

echo >>$RESULT

echo >>$RESULT
