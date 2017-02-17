program main
  implicit none

  ! note that the compiler needs to support the Fortran 2003 standard
  interface
    ! note name="" since otherwise Fortran does not support capitalized function names
    subroutine py_initialize() bind(c,name="Py_Initialize")
    end subroutine py_initialize

    subroutine py_finalize() bind(c,name="Py_Finalize")
    end subroutine py_finalize

    ! name of this function will change depending on the module that we're including
    subroutine initpythonfunc() bind(c)
    end subroutine initpythonfunc

    ! this is a tricky specification... see, e.g., http://stackoverflow.com/tags/fortran-iso-c-binding/info
    integer(c_int) function csum(a,b) bind(c)
      use iso_c_binding
      ! note "value" since we're passing arguments by value, not reference
      ! omitting it would pass pointers to integer
      integer(c_int), intent(in), value :: a,b
    end function csum
  end interface

  call py_initialize()
  call initpythonfunc()

  write(*,'(I1)') csum(2,3)

  call py_finalize()

  stop
end
