#!/bin/bash

curl https://www.arqum.org/ |  grep -i "<td>" | sed 's/          <td>//' | sed 's/<\/td>//' | sed 's/ //' | sed -e "s/\r//g" > azan.txt

fajr=$(sed '2!d' azan.txt)

zuhr=$(sed '5!d' azan.txt)

asr=$(sed '8!d' azan.txt)

maghrib=$(sed '11!d' azan.txt)

isha=$(sed '14!d' azan.txt)


echo Fajr is $fajr
echo Zuhr is $zuhr
echo Asr is $asr
echo Maghrib is $maghrib
echo Isha is $isha

# Remove all at queue:
for i in `atq | awk '{print $1}'`;do atrm $i;done

at $fajr <<< "cvlc --play-and-exit /home/mad/MAD_Labs/azan\ app/azan.mp3"
at $zuhr <<< "cvlc --play-and-exit /home/mad/MAD_Labs/azan\ app/azan.mp3"
at $asr <<< "cvlc --play-and-exit /home/mad/MAD_Labs/azan\ app/azan.mp3"
at $maghrib <<< "cvlc --play-and-exit /home/mad/MAD_Labs/azan\ app/azan.mp3"
at $isha <<< "cvlc --play-and-exit /home/mad/MAD_Labs/azan\ app/azan.mp3"

#at $isha-10 minutes <<< "cvlc --play-and-exit /home/mad/MAD_Labs/azan\ app/azan.mp3"
