import socket
import rpyc

from constRPYC import *
from rpyc.utils.server import ThreadedServer


class ServerName(rpyc.Service):  # alterar serverName para o nome do servidor
    value = []

    def exposed_sum(self, num1, num2):
        return int(num1) + int(num2)

    def exposed_sub(self, num1, num2):
            conta = int(num1) - int(num2)
            return conta

    def exposed_div(self, num1, num2):
        conta = int(num1) / int(num2)
        return conta

    def exposed_multi(self, num1, num2):
        conta = int(num1) * int(num2)
        return conta

if __name__ == "__main__":
    server = ThreadedServer(ServerName, port=20202)  # alterar o serverName para o nome do servidor
    conn_dir = rpyc.connect(DIR_SERVER, DIR_PORT)
    my_address = socket.gethostbyname(socket.gethostname())
    print(conn_dir.root.exposed_register("serverName", my_address, 20202))
    server.start()
