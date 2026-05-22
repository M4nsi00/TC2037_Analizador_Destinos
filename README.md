# TC2037_Analizador_Destinos
## Descripión y Contexto
### ----------Definición del Proyecto----------
El proyecto consiste en el diseño y la implementación de un Motor de Busqueda de Destinos Turísticos. A partir de las restricciones del usuario, definidas por variables categóricas de Clima (frio, calido, templado) y Presupuesto (alto, medio, bajo). el motor evalua un universo y discrimnia cuáles pueden adaptarse al perfil solicitado.

### ----------Contexto y utilidad----------
En desarrollo de software la POO, la resolución a este problema sería mediante estructuras de control de condicionales anidadas. Esto genera código rígido y difícil de escalar.

Este proyecto es interesante porque demuestra cómo los paradigmas declarativos (lógico y funcional) permiten separar por completo la lógica del negocio del control de flujo. Al eliminar los estados y los ciclos explícitos, se obtiene un sistema verificable, donde añadir nuevos hechos o modificar restricciones no altera la estabilidad o la arquitectura del programa principal.

## Modelos y Arquitectura
### ----------Arquitectura del Paradgima Lógigo (Solución en Prolog)----------
La solución lógica se modela abstrayendo el problema en una relación. No se crea un algortimo de búsqueda, se describen los datos y sus interconexiones:
1. Base de Conocimientos (Hechos): Estructura lineal que contiele los destinos con sus propiedades atómicas: destino(Destino, Clima, Presupuesto).
2. Motor de Inferencia (Reglas): Predicados abtractos que operan mediante unificación.

El modelo de ejecución se rige por un Árbol de Resolución por Búsqueda en Profundidad (DFS). Cuando el usuario realiza una consulta con variables libtes, el motor de Prolog recorre el árbol de arriba hacia abajo intetnando ligar los términos. Si una rama no satisface el predicado, el lenguaje ejecuta un proceso de Backtracking regresando al nodo de elección anterior para buscar la siguiente alternativa.

### ----------Arquitectura del Paradgima Funcional (Solución en Racket)----------
- Estructura de Datos: El universo se modela como una lista inmutable de listas.
- Control de flujo: Se elimina el uso de ciclos y se utiliza Recursión de Cabeza.
- Operadores: La arquitectura del programa descompone la lista utilizando first (para extraer y evaluar la cabeza de la lista) y rest (para aislar el resto de la lista y pasarla a la siguiente llamada recursiva). La reconstrucción de la lista filtrada con las coincidencias exitosas se realiza en la pila de retorno con el apoyo de un constructor puramente funcional.

## Implementación y Correr pruebas
Ambos programas estan en este repositorio con el nombre de "analizador_destinos". Ambos programas tambien cuentan con una función de pruebas, la cual arroja 20 pruebas programadas donde los primeros 12 casos son buenos y deben mostrar un destino y los últimos 8 casos no arrojan ningun destino por cosas como los filtros eran incorrectos o no hay destino específico para ese clima y presupuesto.

### ----------Correr pruebas----------
Para el proyecto resuelto en el Paradigma Lógico:
1. Escribir swipl (Si no funciona puede ser porque no tiene instalado ProLog en su computadora).
2. Cargar el archivo escribiendo ["analizador_destinos.pl"]. (Nota: es importante poner el punto del final)
3. Ejecutar la función pruebas. (Nota: es importante poner el punto del final).

Para el caso del proyecto resuelto en el Paradigma Funcional se necesita tener instalado el entorno de DrRacket:
1. Abrir el ["analizador_destinos.rkt"] dentro del IDE DrRacket (Si no abre, asegúrate de tener instalada la suite de Racket en tu computadora).
2. Hacer clic en el botón "Run" (o "Ejecutar") ubicado en la esquina superior derecha para compilar el programa y levantar la consola interactiva.
3. Ejecutar las pruebas usando la función (pruebas). (NOTA: para esta parte se debe de poner con todo y los parentesis que quede así "(pruebas)").

## Análisis Teórico y Complejidad Profunda
Para fundamentar rigurosamente la viabilidad de las soluciones implementadas, analizamos sus dimensiones temporales y sintácticas bajo las directrices clásicas de Friedrich L. Bauer en "Compiladores (Programas para Computadora)".

### ----------Complejidad del Peor Caso----------
### Paradigma funcional 
Bauer postula que un autómata que opera sobre estructuras lineales de datos mediante transiciones de estado deterministas reduce el tamaño del problema de manera estrictamente proporcional a la longitud de la entrada. En nuestra implementación en Racket, la función recursiva realiza un recorrido secuencial simple. La segmentación con el operador rest disminuye la estructura uniformemente ($N, N-1, N-2, \dots, 0$).
Dado que el predicado de evaluación condicional if ejecuta comparaciones equal? en tiempo constante $O(1)$, el peor caso (recorrer toda la lista sin encontrar coincidencias o encontrar elementos al final) obliga a visitar cada nodo exactamente una vez. Su complejidad es puramente lineal, por lo que la complejidad es de $O(N)$ donde N es la cantidad total de destinos definidos en la lista.

### Paradigma Lógico
El comportamiento temporal de Prolog se deriva de la resolución sobre un árbol de Cláusulas de Horn. En el peor escenario teórico (cuando la consulta obliga a evaluar todas las alternativas o cuando resulta en un descarte global false), el motor expande exhaustivamente cada nodo del espacio de estados.
Bauer detalla que los esquemas de emparejamiento sintáctico basados en retroceso (backtracking) sufren de penalizaciones temporales multiplicativas al cruzar múltiples metas independientes con variables libres. La complejidad matemática se define como: $O(N*M)$. Donde N es el número de hechos y M representa la cantidad de restricciones en la regla.

### Conclusión de Viabilidad
- Factibilidad en Mantenimiento y Diseño, El paradgima lógico es sumamente viable para sistemas con reglas dinámicas. Permite que con la misma regla, se puedan hacer consultas no solo de cual es el Destino que cumple con mi Clima y Presupuesto, Podemos buscar Destinos para un clima o ver las caractéristicas de un Destino. 
En Racket esto es inviable; al ser funciones puras, los parámetros de entrada estan fijos y se requeriría agregar algoritmos complementarios para invertir el sentido de la consulta.
- Factbilidad en Rendimiento y Estabilidad, Si el volumen de datos escalara de forma masiva, el enfoque funcional es superior. Su complejidad lineal es completamente determinista y predecible, lo que lo hace inmune a bucles infinitos o explosiones, cosas que el backtracking de Prolog puede provocar si los árboles de decisión crecen sin un control de cortes.

Como se puede ver se considera que ambas soluciones tienen sus puntos fuertes como sus desventajas, es por esto que se decidio implementar ambas propuestas en el proyecto. Para este caso el más factible es el diseño lógico, aunque el diseño funcional no se queda tan atrás, tiene sus ventajas cuando el enfoque es la escalabilidad y estabilidad, pero para el tamaño de proyecto que se implemento esto no afecta.
