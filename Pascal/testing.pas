program QuickSort;

var
  arr: array of Integer;

procedure Swap(var arr: array of Integer; i, j: Integer);
var
  temp: Integer;
begin
  temp := arr[i];
  arr[i] := arr[j];
  arr[j] := temp;
end;

function Partition(var arr: array of Integer; low, high: Integer): Integer;
var
  pivot, i, j: Integer;
begin
  pivot := arr[high];
  i := low - 1;

  for j := low to high - 1 do
  begin
    if arr[j] < pivot then
    begin
      i := i + 1;
      Swap(arr, i, j);
    end;
  end;

  Swap(arr, i + 1, high);
  Partition := i + 1;
end;

procedure QuickSort(var arr: array of Integer; low, high: Integer);
var
  pi: Integer;
begin
  if low < high then
  begin
    pi := Partition(arr, low, high);
    QuickSort(arr, low, pi - 1);
    QuickSort(arr, pi + 1, high);
  end;
end;

procedure PrintArr(var arr: array of Integer);
var
  i: Integer;
begin
  for i := 0 to Length(arr) - 1 do
    Write(arr[i], ' ');
end;

var
  N, i: Integer;

begin
  N := 6; { Number of elements in the array }
  SetLength(arr, N);

  { Initializing the array }
  arr[0] := 10;
  arr[1] := 7;
  arr[2] := 8;
  arr[3] := 9;
  arr[4] := 1;
  arr[5] := 5;

  WriteLn('Unsorted array:');
  PrintArr(arr);
  WriteLn('');

  { Function call }
  QuickSort(arr, 0, N - 1);

  { Printing the sorted array }
  WriteLn('Sorted array:');
  PrintArr(arr);
end.
