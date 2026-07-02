
# cython: boundscheck=False, wraparound=False
import cython

from libc.stdint cimport int64_t

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

