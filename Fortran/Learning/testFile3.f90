subroutine write_with_underline(text, ltext)
    implicit none
    integer, intent(in) :: ltext
    character(len=ltext), intent(in) :: text
    character(len=ltext) :: line
    integer :: ii

    do ii=1, ltext
        line(ii:ii) = "="
    end do
    print *, text
    print *, line
end subroutine write_with_underline

function my_cube(n)
    implicit none
    real, intent(in) :: n
    real :: my_cube
    my_cube = n*n*n
end function my_cube


program hello
    implicit none
    character(len=20) :: some_text
    real :: a
    real :: my_cube
    call write_with_underline("Hello World", 11)
    some_text = "Blah Blah Blah"
    call write_with_underline(some_text, len_trim(some_text))
    a = my_cube(2.7)
    print *, a

end program hello