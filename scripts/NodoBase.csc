atget id id
data p "hola" id id
send p

loop
read mens
rdata mens tipo valor1 valor2 valor3
if( tipo == "alerta")
   cprint "Alerta en: longitud" valor1 ", latitud: " valor2 ", id: " valor3
end

if(tipo =="stop")
   cprint "Nodo descargado en: longitud" valor1 ", latitud: " valor2 ", id nodo: " valor3
   data p "stop"
   send p
   wait 1000
   cprint "para nodo base"
   stop
end

wait 100