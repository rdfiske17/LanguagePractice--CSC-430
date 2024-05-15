program hello;

//uses crt;

var
name1 : string;
name2 : string;
age : integer=10;
counter : integer=1;
randomint : integer;
add : integer;
height : real = 0.5;
symbol : char = 'A';

begin //the main function, if you will
    name1:='Hello World!';
    writeln(name1);
    //readln(name2);
    //writeln(name2);

    add:=3+age;
    writeln(add);

    if age > 10 then
        writeln('age > 10')
    else
        writeln('age <= 10');

    while counter < 5 do
    begin
        writeln(counter);
        counter:=counter+1;
    end;

    for randomint:=0 to 10 do
    begin
        writeln(randomint);
    end;

end.