# A demonstration of calling Python from C and F90

* We want to call the pure Python function `sum`; we include it in a [Cython](http://cython.org) file `pythonfunc.pyx` that declares a function `csum` with a C interface (it's `cdef public`, and all types are specified).
* The Cython source file `pythonfunc.pyx` is compiled into `pythonfunc.c` and `pythonfunc.h`.
* By compiling `callpython.c` with `pythonfunc.c` and with `libpython2.7`, we are able to call `csum` from the C side. We need to include `pythonfunc.h`, and also to (de)initialize the Python interpreter (`Py_Initialize()`, `Py_Finalize()`) and the `pythonfunc` module (`initpythonfunc()`).
* Things are a only little harder from Fortran 90: we need to declare the C functions (`csum`, but also `Py_Initialize`, `Py_Finalize`, `initpythonfunc`) explicitly using [iso_c_binding](http://stackoverflow.com/tags/fortran-iso-c-binding/info).
