import socket

HOST = '127.0.0.1'
PORT = 8080

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
    server_socket.bind((HOST, PORT))
    server_socket.listen()
    print(f"Server listening on {HOST}:{PORT}")
    conn, addr = server_socket.accept()
    with conn:
        print(f"Connection established: {addr}")
        data = conn.recv(1024)
        if data:
            print(f"Received: {data.decode()}")
            conn.sendall("Hello, client!".encode())
