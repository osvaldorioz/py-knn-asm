#include <vector>
#include <cmath>
#include <queue>
#include <tuple>
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

namespace py = pybind11;

// Declaración de la función ensamblador
extern "C" double euclidean_distance(const double* point1, const double* point2, size_t dimension);

std::vector<int> knn(
    const std::vector<std::vector<double>>& dataset,
    const std::vector<int>& labels,
    const std::vector<double>& query_point,
    int k
) {
    using Neighbor = std::pair<double, int>; // {distance, label}
    std::priority_queue<Neighbor> max_heap;

    for (size_t i = 0; i < dataset.size(); ++i) {
        double distance = euclidean_distance(dataset[i].data(), query_point.data(), query_point.size());
        max_heap.push({distance, labels[i]});
        if (max_heap.size() > static_cast<size_t>(k)) {
            max_heap.pop();
        }
    }

    std::vector<int> neighbors;
    while (!max_heap.empty()) {
        neighbors.push_back(max_heap.top().second);
        max_heap.pop();
    }

    return neighbors;
}

PYBIND11_MODULE(knn, m) {
    m.def("knn", &knn, py::arg("dataset"), py::arg("labels"), py::arg("query_point"), py::arg("k"),
          "K-Nearest Neighbors algorithm.");
}