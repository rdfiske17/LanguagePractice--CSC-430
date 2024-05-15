module my_mod
    implicit none
    integer :: my_int
contains
    function my_cube(n)
        implicit none
        real, intent(in) :: n
        real :: my_cube
        my_cube = n*n*n
    end function my_cube

end module my_mod

program hello
    use my_mod
    implicit none
    real :: a
    a = my_cube(3.7)
    print *,a

    my_int = 16
    print *, my_int
    

end program hello
