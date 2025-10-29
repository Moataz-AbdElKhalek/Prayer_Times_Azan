#!/bin/bash


# Get the absolute path to the script directory:
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# CSV file containing schedule
PRAYER_TIMES_FILE="$SCRIPT_DIR/times.csv"

# Get today's date in YYYY-MM-DD format
TODAY_DATE=$(date +%m/%d/%Y)

while IFS=',' read -r date time1 time2 time3 time4 time5; do
    if [ "$date" = "$TODAY_DATE" ]; then
        fajr=$time1
        zuhr=$time2
        asr=$time3
        maghrib=$time4
        isha=$time5
    fi
done < "$PRAYER_TIMES_FILE"

echo "Fajr    $fajr"
echo "Zuhr    $zuhr"
echo "Asr     $asr"
echo "Maghrib $maghrib"
echo "Isha    $isha"

# Remove all at queue:
for i in `atq | awk '{print $1}'`;do atrm $i;done

at $fajr <<< "ffplay -hide_banner -nodisp -autoexit $SCRIPT_DIR/Fajr_Azan.mp3"
at $zuhr <<< "ffplay -hide_banner -nodisp -autoexit $SCRIPT_DIR/All_Azan.mp3"
at $asr <<< "ffplay -hide_banner -nodisp -autoexit $SCRIPT_DIR/All_Azan.mp3"
at $maghrib <<< "ffplay -hide_banner -nodisp -autoexit $SCRIPT_DIR/All_Azan.mp3"
at $isha <<< "ffplay -hide_banner -nodisp -autoexit $SCRIPT_DIR/All_Azan.mp3"
at 01:00AM <<< "$SCRIPT_DIR/azan.sh"
