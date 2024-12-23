from setuptools import setup
from pybind11.setup_helpers import Pybind11Extension, build_ext

ext_modules = [
    Pybind11Extension(
        "knn",
        ["knn.cpp"],
        extra_objects=["distance.o"],  # Archivo ensamblador ya compilado
        extra_compile_args=["-std=c++20"]
    ),
]

setup(
    name="knn",
    ext_modules=ext_modules,
    cmdclass={"build_ext": build_ext},
)