program sorting_algorithm
    use sorting_algorithm_mod
    implicit none

    real :: r(20)
    integer :: q(20), err
    integer :: input_number_of_numbers, input_maximum_number
    integer, allocatable :: unsorted_numbers(:)
    integer, allocatable :: sorted_numbers(:)
    character :: ending_input

    ! get integers to generate the array of size input_number_of_numbers and maximum number input_maximum_number

    do 
        print *, "Please enter an integer 1 - 20 to generate an array of that many random integers."
        read (*,*, iostat = err) input_number_of_numbers ! from https://craftofcoding.wordpress.com/2021/02/02/coding-fortran-validating-input/
        if(err .ne. 0 .or. input_number_of_numbers > 20 .or. input_number_of_numbers < 1) then
            print *, "Input Error"
        else
            exit
        end if
    end do

    do
        print *, "Please enter an integer 1 - 100 to specify a maximum value for the random numbers to take."
        read (*,*,iostat = err) input_maximum_number
        if(err .ne. 0 .or. input_maximum_number > 100 .or. input_maximum_number < 1) then
            print *, "Input Error"
        else
            exit
        end if
    end do

    ! generate the array using the specified inputs

    call random_number(r) ! generate 20 random numbers between 0 and 1

    q = FLOOR(1 + (input_maximum_number) * r) ! widen the 0 to 1 interval to 1 to input_maximum_number by multiplying by that number, adding one, and rounding down

    unsorted_numbers = q(1:input_number_of_numbers) ! take the 1 - input_number_of_numbers elements of q and have that be the array that is sorted

    ! print the original 0 - 1 range of 20 elements array, the 1 - input_maximum_number range of 20 elements array, and the 1 - input_maximum_number of input_number_of_number elements array

    !print *, r

    !print *, q

    print *, "Unsorted Numbers: ", unsorted_numbers

    ! now sort the numbers (write a method or subroutine included in a module in either this file or a different file (then write a file that executes them correctly together in the terminal))

    sorted_numbers = sort_numbers(unsorted_numbers, input_number_of_numbers)
    
    print *, "Sorted Numbers: ", sorted_numbers

    read *, ending_input

end program sorting_algorithm