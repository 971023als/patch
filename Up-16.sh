#!/bin/bash
cd /tmp
wget https://sourceforge.net/projects/rkhunter/files/rkhunter/1.4.6/rkhunter-1.4.6.tar.gz
tar zxvf rkhunter-1.4.6.tar.gz
cd rkhunter-1.4.6
./installer.sh --layout /usr/local --install
PATH=$PATH:/usr/local/bin
/usr/local/bin/rkhunter --propupd
/usr/local/bin/rkhunter --update