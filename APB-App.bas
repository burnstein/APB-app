REM Start of BASIC! Program
print "APB App - GPS Data Logger v. 0.1"
tone 900, 1000

REM Open GPS functions
gps.open

REM Open TTS functions
tts.init
tts.speak "This phone's GPS data has been logged and transmitted."
tts.stop

gps.latitude lat
gps.longitude long
gps.altitude alt
gps.bearing bear
gps.speed speed

text.open w, fn1, "gpsdata.txt"
text.writeln fn1, "Latitude:" + FORMAT$("##%.#####", lat)
text.writeln fn1, "Longitude:" + FORMAT$("##%.#####", long)
text.writeln fn1, "Altitude:" + FORMAT$("####%", alt) + " m"
text.writeln fn1, "Bearing:" + FORMAT$("##%.##", bear)
text.writeln fn1, "Speed:" + FORMAT$("##%.##", speed) + " m/s"
text.close fn1

text.open r, fn2, "gpsdata.txt"
do
text.readln fn2, a_line$
print a_line$
until a_line$ = "EOF"
text.close fn2


grabfile gpstext$, "gpsdata.txt"
sms.send cell_num$, gpstext$

gps.close

onerror:
end
