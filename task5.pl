% �������� ��������� translate/2
translate((LHS --> RHS), (Head :- Body)) :-
    translate_lhs(LHS, Head),
    translate_rhs(RHS, Body).

% �������������� ����� ����� ��������������� ������� (LHS)
translate_lhs(LHS, Head) :-
    Head =.. [LHS, S1, S2].

% �������������� ������ ����� ��������������� ������� (RHS)
translate_rhs((A, B), (TranslatedA, TranslatedB)) :- % ��� ��������� ������ (A, B)
    translate_rhs(A, TranslatedA),
    translate_rhs(B, TranslatedB).
translate_rhs([Terminal], (S1 = [Terminal|S2])) :-   % ��� ������� ���������� ([word])
    !.
translate_rhs(NonTerminal, Call) :-                 % ��� ������������
    atom(NonTerminal),
    Call =.. [NonTerminal, S1, S2].

% ������:
% translate((����������� --> ������_����������������, ������_�������), Y).
