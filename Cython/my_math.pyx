
# cython: boundscheck=False, wraparound=False
import cython

from libc.stdint cimport int64_t

cimport numpy as cnp



'''
define the intergration function as inline
f(x) = x^2 + 2x + 1
'''
cdef inline double f(double x) noexcept:
    # Пример интегрируемой функции: f(x) = x^2 + 2x + 1
    return x * x + 2.0 * x + 1.0

@cython.boundscheck(False)
@cython.wraparound(False)
def integrate_trapezoidal(double a, double b, int n):
    """
    Вычисляет определенный интеграл функции f(x) на отрезке [a, b]
    методом трапеций с разбиением на n отрезков.
    """
    if n <= 0:
        raise ValueError("Количество разбиений n должно быть больше нуля.")

    cdef double h = (b - a) / n  # Шаг интегрирования
    cdef double total_sum = 0.5 * (f(a) + f(b))
    cdef double x
    cdef int i

    # Сверхбыстрый C-цикл для суммирования внутренних точек
    for i in range(1, n):
        x = a + i * h
        total_sum += f(x)

    return total_sum * h



'''
implement the dot product function:
This function calculates the scalar product of two vector
'''
def dot_product(cnp.ndarray[double, ndim=1] A, cnp.ndarray[double, ndim=1] B):
    cdef int i
    cdef double result = 0
    for i in range(A.shape[0]):
        result += A[i] * B[i]
    return result




def factorial(int n):
    cdef int i
    cdef int64_t result = 1
    for i in range(1, n + 1):
        result *= i
    return result


@cython.boundscheck(False)
@cython.wraparound(False)
def sum_of_squares(double[:] arr):
    cdef double result = 0
    cdef Py_ssize_t i
    cdef Py_ssize_t n = arr.shape[0]
    for i in range(n):
        result += arr[i] * arr[i]
    return result

