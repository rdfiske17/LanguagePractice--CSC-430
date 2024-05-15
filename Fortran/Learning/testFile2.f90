program hello
    implicit none
    integer :: int_array(6)
    integer :: int_array2(2,3)
    integer, allocatable :: int_array3(:, :)
    integer :: n
    integer :: ii
    integer :: num_r, num_c
    int_array = [1,2,3,4,5,6]
    int_array2 = reshape([1,2,3,4,5,6], [2,3])
    n = 7
    num_r = 2
    num_c = 3
    allocate(int_array3(num_r,num_c))
    int_array3 = reshape([(ii, ii = 1, num_r * num_c)], shape(int_array3))
    if (n > 10) print *, "Greater than 10" ! or
    if (n > 10) then
        print *, "Greater than 10"
    else if (n > 5) then
        print *, "Greater than 5"
    else
        print *, "Not greater than 5"
    end if

    ! loops in notes

    ! arrays

    do ii = 1,6
        print *, int_array(ii)
    end do

    do ii = 1,2
        print *, int_array2(ii, :) ! print each entire row of the 2-dimensional array with 2 rows and 3 columns
    end do

    do ii = 1,2
        print *, int_array3(ii, :)
    end do

end program hello