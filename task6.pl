:- use_module(library(socket)).

start_client(Host, Port) :-
    tcp_socket(Socket),
    tcp_connect(Socket, Host:Port),
    tcp_open_socket(Socket, InStream, OutStream),
    set_stream(OutStream, encoding(utf8)),
    set_stream(InStream, encoding(utf8)),
    format('���������� � �������� ~w:~w �����������.~n', [Host, Port]),
    communicate(InStream, OutStream).

communicate(InStream, OutStream) :-
    format(OutStream, '������, ������!~n', []),
    flush_output(OutStream),
    read_line_to_string(InStream, Response),
    format('����� �� �������: ~w~n', [Response]),
    close(InStream),
    close(OutStream).

% ?- start_client('localhost', 8080).
