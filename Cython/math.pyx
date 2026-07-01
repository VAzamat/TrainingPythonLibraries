import cython

@cython.boundscheck(False)
@cython.wraparound(False)
def sum_of_squares(double[:] arr):
    cdef double result = 0
    cdef Py_ssize_t i
    cdef Py_ssize_t n = arr.shape[0]
    for i in range(n):
        result += arr[i] * arr[i]
    return result