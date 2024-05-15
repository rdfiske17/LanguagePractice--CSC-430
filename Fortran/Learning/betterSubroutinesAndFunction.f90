program hello
    implicit none
    real :: a
    a = my_cube(2.9)
    print *, a


contains
    function my_cube(n)
        implicit none
        real, intent(in) :: n
        real :: my_cube
        my_cube = n*n*n
    end function my_cube

end program hello