import socket
import threading
import random

# Server code
def handle_client(client_socket, client_address, client_name, target_number):
    attempts = 0
    print(f"[NEW CONNECTION] {client_name} connected from {client_address}")

    client_socket.send(b"Welcome to the 'Guess the Number' game!\n")
    client_socket.send(b"I have picked a number between 1 and 100. Try to guess it!\n")

    while True:
        try:
            guess = client_socket.recv(1024).decode('utf-8').strip()
            if not guess:
                break

            attempts += 1
            guess = int(guess)

            if guess < target_number:
                client_socket.send(b"Too low! Try again.\n")
            elif guess > target_number:
                client_socket.send(b"Too high! Try again.\n")
            else:
                client_socket.send(f"Congratulations! You've guessed it in {attempts} attempts!\n".encode('utf-8'))
                print(f"[GAME END] {client_name} guessed the number {target_number} in {attempts} attempts.")
                break

        except ValueError:
            client_socket.send(b"Invalid input. Please enter a number.\n")
        except ConnectionResetError:
            print(f"[DISCONNECT] {client_name} disconnected abruptly.")
            break

    client_socket.close()
    print(f"[CONNECTION CLOSED] {client_name} ({client_address}) disconnected.")

def server_program():
    server_ip = "0.0.0.0"
    server_port = 5005
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((server_ip, server_port))
    server_socket.listen(5)
    print(f"[STARTING] Server is running on {server_ip}:{server_port}")

    while True:
        client_socket, client_address = server_socket.accept()
        client_socket.send(b"Enter your name: ")
        client_name = client_socket.recv(1024).decode('utf-8').strip()

        target_number = random.randint(1, 100)
        client_thread = threading.Thread(
            target=handle_client,
            args=(client_socket, client_address, client_name, target_number)
        )
        client_thread.start()

# Client code
def client_program():
    server_ip = input("Enter the server IP address: ")
    server_port = 5005

    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        client_socket.connect((server_ip, server_port))
        print(client_socket.recv(1024).decode('utf-8'))  # Welcome message
        client_socket.send(input("Enter your name: ").encode('utf-8'))

        while True:
            server_message = client_socket.recv(1024).decode('utf-8')
            print(server_message)
            if "Congratulations!" in server_message:
                break

            guess = input("Your guess: ")
            client_socket.send(guess.encode('utf-8'))

    except ConnectionRefusedError:
        print("[ERROR] Unable to connect to the server.")
    finally:
        client_socket.close()

if __name__ == "__main__":
    mode = input("Start as (server/client): ").strip().lower()
    if mode == "server":
        server_program()
    elif mode == "client":
        client_program()
    else:
        print("Invalid mode. Please choose 'server' or 'client'.")

