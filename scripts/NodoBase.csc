atget id id
data p "hola" id id
send p

loop
read mens
rdata mens tipo valor1 valor2
if( tipo == "alerta")
   cprint "Alerta en: longitud" valor1 ", latitud: " valor2
end

if(tipo =="critico")
   cprint "Nodo descargado o agotado en: longitud" valor1 ", latitud: " valor2
   data p "stop"
   send p
   wait 1000
   cprint "para nodo base"
   stop
end

wait 100