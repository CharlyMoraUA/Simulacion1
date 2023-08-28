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
rdata mens tipo val1 val2 val3
if(tipo=="stop")
   send mens * val3
   cprint "para sensor: " id
   wait 1000
   stop
end

if((tipo=="hola") && (ant == 999))
   inc ite
   print "ite: "ite
   set ant val1
   data mens tipo id
   send mens * val1
end

battery bat
if((tipo=="alerta") && (bat>batCritial) && (ite<messagesLimit))
   inc ite
   print "ite: "ite
   send mens ant
end

if (ite>=messagesLimit)
   cprint "************************* Nodo agotado id: " id "*************************"
   data p "stop" lonSen latSen id
   send p
   wait 1000
   cprint "para nodo " id
   stop
end


if(bat<=batCritial)
   cprint "+++++++++++++++++++ Nodo sin bateria id: " id "En iteracion: " ite " +++++++++++++++++++"
   data p "stop" lonSen latSen id
   send p
   wait 1000
   stop
end

delay 10

areadsensor tempSen
rdata tempSen SensTipo idSens temp
if( (temp>30) && (bat>batCritial) && (ite<messagesLimit))
   inc ite
   print "ite: "ite
   data mens "alerta" lonSen latSen id
   send mens ant
end