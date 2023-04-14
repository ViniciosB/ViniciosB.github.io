import socket
import rpyc

from constRPYC import *
from rpyc.utils.server import ThreadedServer


class ServerName(rpyc.Service):  # alterar serverName para o nome do servidor

    def exposed_enc(self,data, key, mode):
        MODE_ENCRYPT = 1
        MODE_DECRYPT = 0
        alphabet = 'abcdefghijklmnopqrstuvwyzàáãâéêóôõíúçABCDEFGHIJKLMNOPQRSTUVWYZÀÁÃÂÉÊÓÕÍÚÇ'
        new_data = ''
        for c in data:
            index = alphabet.find(c)
            if index == -1:
                new_data += c
            else:
                new_index = index + key if mode == MODE_ENCRYPT else index - key
                new_index = new_index % len(alphabet)
                new_data += alphabet[new_index:new_index + 1]
        return str(new_data)

if __name__ == "__main__":
    server = ThreadedServer(ServerName, port=20200)  # alterar o serverName para o nome do servidor
    conn_dir = rpyc.connect(DIR_SERVER, DIR_PORT)
    my_address = socket.gethostbyname(socket.gethostname())

    print(conn_dir.root.exposed_register("serverNamen", my_address, 20200))
    server.start()

