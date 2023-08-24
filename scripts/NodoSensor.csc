set ant 999
set ite 0 
set batCritial 9
set messagesLimit 999
battery set 10

atget id id
getpos2 lonSen latSen

loop
wait 1
read mens
rdata mens tipo valor
if(tipo=="stop")
   data mens "stop"
   send mens * valor
   cprint "para sensor: " id
   wait 1000
   stop
end

if((tipo=="hola") && (ant == 999))
   inc ite
   print ite
   set ant valor
   data mens tipo id
   send mens * valor
end

if(tipo=="alerta")
   inc ite
   print ite
   send mens ant
end
delay 10

areadsensor tempSen
rdata tempSen SensTipo idSens temp
if( temp>30)
   inc ite
   print ite
   data mens "alerta" lonSen latSen
   send mens ant
end
if (ite>messagesLimit)
   data mens "critico" lonSen latSen
   send mens ant
end

battery bat
if(bat<batCritial)
   data mens "critico" lonSen latSen
   send mens ant
end