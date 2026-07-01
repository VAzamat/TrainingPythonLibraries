from numba import jit
import numpy as np
import time

#обязательно декоратор, чтобы скомпилировалось в быстрый выполняемый код
@jit(nopython=True)
def sum_of_squares(arr):
    result = 0.0
    for x in arr:
        result += x * x
    return result




arr = np.random.randn(10000000)


#компиляция при запуске, чтобы не считалась
_ = sum_of_squares(arr[:10])


# Замеряем время выполнения
start_time = time.perf_counter()
result = sum_of_squares(arr)
end_time = time.perf_counter()

print(f"Результат: {result}")
print(f"Время выполнения: {(end_time - start_time) * 1000:.3f} мс")
