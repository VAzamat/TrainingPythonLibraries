start: build
	python main.py

build: my_math.pyx
	python setup.py build_ext --inplace

clean:
	rm -fR build
	rm -f my_math.c my_math.cpython*.so 