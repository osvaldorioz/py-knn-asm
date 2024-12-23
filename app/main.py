from fastapi import FastAPI
import knn 
import time
from pydantic import BaseModel
from typing import List
import json

app = FastAPI()

# Definir el modelo para la matriz
class Matrix(BaseModel):
    matrix: List[List[float]]

# Definir el modelo para el vector
class VectorF(BaseModel):
    vector: List[float]

class VectorI(BaseModel):
    vector: List[int]

@app.post("/knn")
async def calculo(dataset: Matrix, labels: VectorI,
                  query_points: VectorF, k: int):
    start = time.time()

    neighbors = knn.knn(dataset.matrix, labels.vector, query_points.vector, k)
    #print("Neighbors:", neighbors)


    end = time.time()

    var1 = end - start

    j1 = {
        "Time taken in seconds": var1,
        "Neighbors": neighbors
    }
    jj = json.dumps(str(j1))

    return jj