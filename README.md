Este programa implementa el algoritmo K-Nearest Neighbors (KNN) utilizando tres componentes principales:

    C++: La lógica principal del algoritmo KNN, que incluye:
        Cálculo de distancias entre puntos de datos y un punto de consulta.
        Selección de los k vecinos más cercanos utilizando una cola de prioridad para manejar las distancias.
        Retorno de las etiquetas de los k vecinos más cercanos.

    Ensamblador: Una implementación optimizada del cálculo de la distancia Euclidiana para maximizar el rendimiento. Esta función realiza los siguientes pasos:
        Resta cada coordenada del punto de consulta con la correspondiente coordenada de un punto del dataset.
        Eleva la diferencia al cuadrado.
        Suma los cuadrados y calcula la raíz cuadrada para obtener la distancia.

    Pybind11: Un puente entre C++ y Python que expone el algoritmo KNN como una función Python. Esto permite al usuario ejecutar el algoritmo desde Python con datasets y parámetros personalizados.
