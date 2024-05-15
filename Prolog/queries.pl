% facts
person("Nadia", woman, healthy, wealthy).
person("Javier", man, healthy, not_wealthy).

% check if someone is wealthy
is_wealthy(X) :-
    person(X, _, _, wealthy).

% check if someone is healthy
is_healthy(X) :-
    person(X, _, healthy, _).

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