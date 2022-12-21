#!/bin/bash

curl -s https://www.arqum.org/ |  grep -i "<td>" | sed 's/          <td>//' | sed 's/<\/td>//' | sed 's/ //' | sed -e "s/\r//g" > <full_path>/prayer_times_azan/azan.txt

fajr=$(sed '2!d' azan.txt)

zuhr=$(sed '5!d' azan.txt)

asr=$(sed '8!d' azan.txt)

maghrib=$(sed '11!d' azan.txt)

isha=$(sed '14!d' azan.txt)

echo Fajr    $fajr
echo Zuhr    $zuhr
echo Asr     $asr
echo Maghrib $maghrib
echo Isha    $isha

# Remove all at queue:
for i in `atq | awk '{print $1}'`;do atrm $i;done

at $fajr <<< "cvlc --play-and-exit <full_path>/prayer_times_azan/azan.mp3; <full_path>/prayer_times_azan/azan.sh"
at $zuhr <<< "cvlc --play-and-exit <full_path>/prayer_times_azan/azan.mp3; <full_path>/prayer_times_azan/azan.sh"
at $asr <<< "cvlc --play-and-exit <full_path>/prayer_times_azan/azan.mp3; <full_path>/prayer_times_azan/azan.sh"
at $maghrib <<< "cvlc --play-and-exit <full_path>/prayer_times_azan/azan.mp3; <full_path>/prayer_times_azan/azan.sh"
at $isha <<< "cvlc --play-and-exit <full_path>/prayer_times_azan/azan.mp3; <full_path>/prayer_times_azan/azan.sh"

#at $isha-10 minutes <<< "cvlc --play-and-exit /home/mad/MAD_Labs/azan_app/azan.mp3"
#at now+1 minute <<< "cvlc --play-and-exit /home/mad/MAD_Labs/azan_app/moo.mp3; /home/mad/MAD_Labs/azan_app/azan.sh"
