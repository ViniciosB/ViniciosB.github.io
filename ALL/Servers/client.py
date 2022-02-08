import rpyc
from constRPYC import *

class Client:
    conn_directory = rpyc.connect(DIR_SERVER, DIR_PORT)
    (address, port) = conn_directory.root.exposed_lookup("serverName")
    print (address, port)
	
    conn_server = rpyc.connect(address , port)
    print("soma: ", conn_server.root.exposed_sum(2, 4))
    print("subtracao: ",  conn_server.root.exposed_sub(2, 5))
    print("divisao: ", conn_server.root.exposed_div(2, 3))
    print("multiplicacao: ", conn_server.root.exposed_multi(5, 4))
