% facts
is_woman("Nadia").
is_man("Javier").
is_healthy("Javier").
is_healthy("Nadia").
is_wealthy("Nadia").

% travelers must be both healthy and wealthy
is_traveler(X) :-
    is_healthy(X),
    is_wealthy(X).

% find travelers
can_travel(X) :-
    is_traveler(X).

% run upon opening

% list travelers
?- findall(X, can_travel(X), Travelers),
   writeln('List of Individuals who can Travel:'),
   writeln(Travelers),
   nl.

% list wealthy
?- findall(X, is_wealthy(X), Wealthy),
   writeln('List of Wealthy Individuals:'),
   writeln(Wealthy),
   nl.

% list healthy
?- findall(X, is_healthy(X), Healthy),
   writeln('List of Healthy Individuals:'),
   writeln(Healthy),
   nl.