import rpyc
from constRPYC import *
from rpyc.utils.server import ThreadedServer


class Directory(rpyc.Service):

    def exposed_register(self, server_name, ip_adress, port_number):
        sep=':'
        if(server_name in regis):
            print('erro')
        else:
            regis[server_name]=ip_adress+sep+str(port_number)
            print(regis)
            return 'registrado'

    def exposed_update_register(self, server_name, ip_adress, port_number, token):
        sep = ':'
        if(token==1234):
            regis[server_name] = ip_adress+sep+str(port_number)
        else:
            return "token invalido"

    def exposed_unregister(self, server_name):
        regis.pop(server_name,'a')
        return 'unregister'

    def exposed_lookup(self, server_name):
        if (server_name in regis):
            url=regis[server_name]
            protocolo = url[0:url.index(':')]
            ip = protocolo
            tam = len(protocolo)
            porta = url[tam + 1:]
            return ip, int(porta)


if __name__ == "__main__":
    server_dir = ThreadedServer(Directory, port=DIR_PORT)
    regis = {}
    print("Server Started. Waiting Requests")
    server_dir.start()
