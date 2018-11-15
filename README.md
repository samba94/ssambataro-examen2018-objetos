# ssambataro-examen2018-objetos
Repo del examen de la capacitación de POO

1)Se aplicó polimorfismo para calcular el costo de cada tipo de cerveza, el método "costo()" aparece en cada una de las 3 clases de cerveza(clásica, lager, porter) que heredan de un superclase Cerveza.
2)Utilicé herencia para las cervezas, ya que todas comparten ciertos métodos y variables, de esta manera evitamos repetir código. Hice lo mismo con los tipos de distribuidoras. Elegí usar sólo clases y no objetos ya que me parece lo más prolijo, a la hora de realizar los tests instancié cada clase con un new.
3)Se puede ver un caso de delegación al final, para calcular los costos de un pedido. Si bien el costo total lo calcula la distribuidora, el costo del lote lo calcula la clase pedido, ya que ella es quien lo contiene. Podemos ver que cada parte hace su cálculo parcial y luego se "unen" al final, para realizar el cálculo final.
