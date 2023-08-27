set ant 999
set ite 0 
set batCritial 4
set messagesLimit 999
battery set 100

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
   print "ite: "ite
   set ant valor
   data mens tipo id
   send mens * valor
end
battery bat
if((tipo=="alerta") && (bat>=batCritial) && (ite<messagesLimit))
   inc ite
   print "ite: "ite
   send mens ant
end
delay 10

if (ite==messagesLimit)
   inc ite
   cprint "Nodo agotado id: " id
   data mens "criticoM" lonSen latSen id
   send mens ant
end


if(bat==batCritial)
   cprint "Nodo sin bateria id: " id
   data mens "criticoB" lonSen latSen id
   send mens ant
end

areadsensor tempSen
rdata tempSen SensTipo idSens temp
if( (temp>30) && (bat>batCritial) && (ite<messagesLimit))
   inc ite
   print "ite: "ite
   data mens "alerta" lonSen latSen id
   send mens ant
end