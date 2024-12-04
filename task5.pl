% Основная процедура translate/2
translate((LHS --> RHS), (Head :- Body)) :-
    translate_lhs(LHS, Head),
    translate_rhs(RHS, Body).

% Преобразование левой части грамматического правила (LHS)
translate_lhs(LHS, Head) :-
    Head =.. [LHS, S1, S2].

% Преобразование правой части грамматического правила (RHS)
translate_rhs((A, B), (TranslatedA, TranslatedB)) :- % Для составных правил (A, B)
    translate_rhs(A, TranslatedA),
    translate_rhs(B, TranslatedB).
translate_rhs([Terminal], (S1 = [Terminal|S2])) :-   % Для списков терминалов ([word])
    !.
translate_rhs(NonTerminal, Call) :-                 % Для нетерминалов
    atom(NonTerminal),
    Call =.. [NonTerminal, S1, S2].

% Пример:
% translate((предложение --> группа_существительного, группа_глагола), Y).
