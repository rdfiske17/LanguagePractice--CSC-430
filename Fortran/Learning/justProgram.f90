program hello
    use my_mod !, only: my_cube
    implicit none
    real :: a
    a = my_cube(3.7)
    print *,a

    my_int = 16
    print *, my_int
    

end program hello

! PS C:\Users\riley\OneDrive\Concordia\2023_2 Fall\CSC-430\Fortran> gfortran -o hello justModule.f90 justProgram.f90
! PS C:\Users\riley\OneDrive\Concordia\2023_2 Fall\CSC-430\Fortran> ./hello
! correct output here...