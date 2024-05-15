program sortingalgorithm;

uses SysUtils; // int to str conversion function

(* Sources consulted in creation of algorithm

https://www.geeksforgeeks.org/quick-sort/
https://chat.openai.com (
    asked questions about
        - using procedures vs functions for converting the java solution for quicksorting into pascal
        - function arguments for different arg data types
        - discovered can't return array in a function, so turned quicksort into a procedure
        - was using manually assigned lower and upper imbecies for the array that were causing either the top or bottom element to not be sorted, used Low() and High() to fix this problem per Chat-GPTs suggestion
)
https://www.tutorialspoint.com/pascal/pascal_arrays.htm
https://programming-idioms.org/idiom/153/concatenate-string-with-integer/1894/pascal
https://smartpascal.github.io/help/assets/random.htm

*)

// vars to be used in the "main" method
var
    numbers : array [1..10] of integer; // array of 10 elements starting at 1
    topRandomBound : LongInt = 100; // LongInt needed for Random method argument
    randomintstring : string = '';
    i : integer;

// swap index values
procedure swap(var arr : array of integer; i, j : integer); // no return for procedures, equivalent to void return in java
var 
    temp : integer;
begin
    temp := arr[i];
    arr[i] := arr[j];
    arr[j] := temp;
end;

// takes the last element as the pivot element, finds the right spot for the pivot element in the array, and places all smaller elements than the pivot to the left of it and all larger elements to the right of it
function partition(var arr : array of integer; low, high : integer): integer;
var
    pivot, i, j : integer;
begin
    pivot := arr[high];
    i := low - 1;

    for j := low to (high - 1) do
    begin
        if arr[j] < pivot then // if its smaller
        begin
        i := i + 1; // increment the index of the smaller element and swap
        swap(arr, i, j);
        end;
    end;

    swap(arr, i + 1, high);
    partition := i + 1;
end;

// main algorithm procedure, finds the partition index, then continues to execute the algorithm on both sides of the partition index after it has been strategically placed in the array
procedure quicksort(var arr : array of integer; low, high : integer);
var 
    partitionindex : integer;
begin
    if low < high then
    begin
        partitionindex := partition(arr, low, high);
        quicksort(arr, low, partitionindex - 1); // recursion on lower side of the index
        quicksort(arr, partitionindex + 1, high); // recursion on upper side of the index
    end;
end;

// create a printable string of the elements of the array
function arraytostring(var arr : array of integer): string;
var
    i : integer;
    arraystring : string = '';
begin
    for i := Low(arr) to High(arr) do
    begin
        arraystring := arraystring + ' ' + IntToStr(arr[i]);
    end;
    arraytostring := arraystring;
end;

// the "main" method finally begins
begin
    
    Randomize; // create a random number generator

    // generate 10 random numbers between 0 and 100

    for i := Low(numbers) to High(numbers) do
    begin
        numbers[i] := Random(topRandomBound) + 1;
    end;

    // print out the random numbers

    randomintstring := arraytostring(numbers);

    writeln('Random integers: ' + randomintstring);

    // run the quicksort algorithm

    quicksort(numbers, 0, Length(numbers) - 1);

    // print out the sorted numbers

    randomintstring := arraytostring(numbers);

    writeln('Sorted integers: ' + randomintstring);

    //readln(randomintstring) //uncomment to pause execution in cmd prompt

end.