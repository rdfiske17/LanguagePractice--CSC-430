program helloWorld
    use, intrinsic :: iso_fortran_env
    implicit none
    ! variable declarations go first
    
    character(len=10) :: world !length 10 character segment named world

    integer :: myInt
    integer(kind = int8) :: myInt8 ! 8 bit integer
    
    !double precision :: dp ! not as useful
    !real(kind = real64) ::dp2 ! same as dp, just newer
    
    myInt = 5
    myInt8 = 5
    world = "Mars"
    
    print *, &
        "Hello " // world // "!" ! world is length 10
    print *, &
        "Hello " // trim(world) // "!" ! no whitespace now
    
    print *, 'number is ', myInt ! allocates whitespace for maximize size the integer could take up
    print *, 'number is ', myInt8 ! it has less space since its only an 8 bit integer

    print *, &
    "Hello World!"

end program helloWorld