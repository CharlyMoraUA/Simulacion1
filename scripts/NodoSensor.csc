set ant 999
set ite 0 

atget id id
getpos2 lonSen latSen

loop
wait 1
read mens
rdata mens tipo valor

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
if (ite>4)
   stop
end