ALL: callpython fcallpython

pythonfunc.c pythonfunc.h: pythonfunc.pyx
	cython pythonfunc.pyx

pythoninc := $(shell python -c 'import distutils.sysconfig; print distutils.sysconfig.get_python_inc()')
pythonlib := $(shell python -c 'import distutils.sysconfig; print distutils.sysconfig.get_config_var("LIBDIR")')

pythonfunc.o: pythonfunc.c pythonfunc.h
	gcc -c -I$(pythoninc) callpython.c pythonfunc.c

callpython: callpython.c pythonfunc.o
	gcc -I$(pythoninc) -L$(pythonlib) -lpython2.7 callpython.c pythonfunc.o -o callpython

fcallpython: callpython.f90
	gfortran -L$(pythonlib) -lpython2.7 callpython.f90 pythonfunc.o -o fcallpython
