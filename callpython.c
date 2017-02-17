#include <Python.h>
#include "pythonfunc.h"

int main(int argc,char **argv) {
  Py_Initialize();

  initpythonfunc(); // name of this function will change depending on the module that we're including

  printf("%d\n",csum(1,2));

  Py_Finalize();
}
