import numpy as np
import time
from my_math import sum_of_squares

arr = np.random.randn(10000000)

# Замеряем время выполнения
start_time = time.perf_counter()
result = sum_of_squares(arr)
end_time = time.perf_counter()

print(f"Результат: {result}")
print(f"Время выполнения: {(end_time - start_time) * 1000:.3f} мс")