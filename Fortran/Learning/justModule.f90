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