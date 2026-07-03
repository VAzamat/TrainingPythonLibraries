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

from my_math import factorial
print( factorial(20) )


from my_math import dot_product
rng = np.random.default_rng()
A = rng.random(1000000)
B = rng.random(1000000)
print( dot_product(A, B) )

from my_math import integrate_trapezoidal
print( integrate_trapezoidal(-10.0, 10.0, 1000000) )

