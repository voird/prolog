 a(ньюкасл, карлайл, 58).
a(карлайл, ньюкасл, 58).
a(карлайл, пенрит, 23).
a(пенрит, карлайл, 23).
a(дарлингтон, ньюкасл, 40).
a(ньюкасл, дарлингтон, 40).
a(пенрит, дарлингтон, 52).
a(дарлингтон, пенрит, 52).
a(уэркингтон, карлайл, 33).
a(карлайл, уэркингтон, 33).
a(уэркингтон, пенрит, 39).
a(пенрит, уэркингтон, 39).

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
