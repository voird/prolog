 a(�������, �������, 58).
a(�������, �������, 58).
a(�������, ������, 23).
a(������, �������, 23).
a(����������, �������, 40).
a(�������, ����������, 40).
a(������, ����������, 52).
a(����������, ������, 52).
a(����������, �������, 33).
a(�������, ����������, 33).
a(����������, ������, 39).
a(������, ����������, 39).

path(Start, End, Path, TotalDistance) :-
  path_helper(Start, End, [Start], 0, Path, TotalDistance).


path_helper(Current, End, Visited, CurrentDistance, [End|Visited], TotalDistance) :-
  a(Current, End, Distance),
  TotalDistance is CurrentDistance + Distance.


path_helper(Current, End, Visited, CurrentDistance, Path, TotalDistance) :-
  a(Current, Next, Distance),
  \+ member(Next, Visited), % Avoid cycles
  NewDistance is CurrentDistance + Distance,
  path_helper(Next, End, [Next|Visited], NewDistance, Path, TotalDistance).


find_paths(Start, End) :-
  findall((Path, TotalDistance), path(Start, End, Path, TotalDistance), Paths),
  sort(Paths, SortedPaths), % Sort by TotalDistance
  write('Paths from '), write(Start), write(' to '), write(End), nl,
  print_paths(SortedPaths).

print_paths([]).
print_paths([(Path, TotalDistance)|Rest]) :-
  write('Path: '), write(Path), write(', Total Distance: '), write(TotalDistance), nl,
  print_paths(Rest).
