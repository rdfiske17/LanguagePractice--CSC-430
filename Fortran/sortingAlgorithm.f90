
! module that contains the function that sorts numbers in ascending numeric order
module sorting_algorithm_mod
    implicit none

    contains
        ! sorts an array of integers in ascending order
        function sort_numbers(unsorted_numbers, input_number_of_numbers) result(sorted_numbers)
            implicit none

            integer :: ticker, innerticker, currentElement, currentInnerElement, leftElement, input_number_of_numbers ! instatiate these variables as integers
            integer, allocatable :: unsorted_numbers(:), sorted_numbers(:) ! instatiate these variables as arrays of integers that can be assigned variable lengths

            allocate(sorted_numbers(1:input_number_of_numbers)) ! make sorted_numbers of the same size as unsorted_numbers with blank elements
            
            !print *, sorted_numbers ! elements 1 - 4 still have values for some reason, so set all element values to 0 before beginning to write elements from unsorted_numbers into sorted_numbers

            ticker = 1 ! incremental variable that is used to walk through every element of an array
            do
                sorted_numbers(ticker) = 0 ! set all values of the new array to 0 before beginning to insert elements to account for any leakage (which I did find occasionally happens)
                if (ticker .eq. size(unsorted_numbers)) exit ! exit the do loop once you have traversed every element
                ticker = ticker + 1
            end do
            ticker = 1 ! reset incrementer to 1 for the next time it is used
                
            !print *, sorted_numbers ! there, now all elements have value 0

            ticker = 1 ! just in case!
            do
                currentElement = unsorted_numbers(ticker) ! grab next element to sort from unsorted numbers
                innerticker = 1 ! same incrementation idea, just using a second ticker to keep track of 2 things
                
                ! place the currentElement at the current end of the sorted numbers array
                do 
                    currentInnerElement = sorted_numbers(innerticker)
                    if(currentInnerElement .eq. 0) then
                        sorted_numbers(innerticker) = currentElement ! assign the value to the first 0 it finds
                        exit
                    else
                        innerticker = innerticker + 1 ! keep going if no 0
                    end if
                    if(innerticker .gt. input_number_of_numbers) then
                        sorted_numbers(innerticker) = currentElement ! catch clause to place it at the end
                        exit
                    end if
                end do
                
                !print *, "Placed the ", innerticker, "th element"
                
                ! now shift the current number down until the next left value is less than or equal to the current number
                if(innerticker .gt. 1) then
                    do
                        leftElement = sorted_numbers(innerticker - 1) ! can use the previously established innerticker value to get the position of the end of the array, then move one to the left
                        if(leftElement .gt. currentElement) then
                            sorted_numbers(innerticker) = leftElement ! move the left element up if it is greater than the currentElement
                            sorted_numbers(innerticker - 1) = currentElement ! and move the currentElement down to the left element's position
                            if(innerticker .eq. 2) then
                                exit ! subtracting one and sending it through the loop again would make the left element be invalid, so leave the array as is
                            else
                                innerticker = innerticker - 1 ! keep travering the array
                            end if
                        else
                            exit
                        end if
                    end do
                end if
                if(ticker .ge. input_number_of_numbers) exit ! exit once all elements have been traversed
                ticker = ticker + 1
                !print *, sorted_numbers
            end do
            ticker = 1

        end function sort_numbers

end module sorting_algorithm_mod