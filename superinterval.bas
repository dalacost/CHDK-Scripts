rem solo tomara imagenes dentro de las horas indicadas
rem 

@title SuperInterval
@param a = interval (sec)
@default a 60

@default i 0
@default t 0

@default s 0
@default m 0 
@default h 0 

@default c 1

rem HORATERMINO = 20:00 desde las 00:00 horas = 60*60*20
rem HORATERMINO = 20:00 desde las 00:00 horas = 60*60*20
i = 60*60*8
t = 60*60*20

print "seteando autoiso"
set_iso AutoISO
set_prop 149 0

print "no raw"
set_raw_nr 1
set_raw 0

print "no ojos rojos"
set_prop 18 0

print "no flash"
set_prop 16 2
set_prop 143 2
set_prop 204 4

click "display"

do
    s = get_day_seconds
    m = s/60
    h = m/60
    print "hora: ", h, ":", m%60, ":", s%60, ""
    
    if s>i and s<t then
        print "foto:", c, ""
        c = c + 1
        s = get_tick_count
rem        shoot_half
rem        sleep 3000
        shoot_full
        sleep a*1000 - 2000
    else
        if s<i then
            d = i-s
            print "aun falta ", d, ""
        else
           d = 24*59*60+60-s+i
           print "aun falta ", d, ""
       endif
        
        sleep 1000
    endif
    
until ( 0 )


