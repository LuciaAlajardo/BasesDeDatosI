const prompt = require("prompt-sync")({ sigint: true });

/*function primerPunto(numero){
    for(let i=numero; i<=numero+10 ; i++){
        console.log(i);
    }
}
primerPunto(11);

function segundoPunto(){
    for(let i=5; i<=20 ; i+=3){
        console.log(i);
    }
}
segundoPunto();

function tercerPunto(){
    let suma = 0;
    let contador=1;
    while (contador<=100) {
        suma = suma + contador;
        contador=contador+1;
        
    }
    console.log(suma);
}
tercerPunto();

/* en el parámetro va el número que quiero factorial, '5'*4*3*2*1. */
/* function factorial(numero) {  
    let total=1;
    for (let i = 1; i <= numero; i++) {
    total=total*i;
    
    }
    console.log(total);
}
factorial(3);
*/
function fibo(numero) {
    
    for (let i = 2; i < numero; i++) {
        resultado=(i-2)+(i-1);
        console.log(resultado);
        
    }
}
fibo(10);
