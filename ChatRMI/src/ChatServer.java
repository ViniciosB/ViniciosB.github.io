import java.rmi.*;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class ChatServer {
	@SuppressWarnings("unused")
	public ChatServer() {
		try {
			//cria uma string com a porta de conexao 
			final String porta="1098";
			System.out.println("Iniciando Servidor...");
			//reistra a porta para conexao
			Registry registry = LocateRegistry.createRegistry(Integer.parseInt(porta));
			//cria um objeto para a clase de metodos do servidor
			InterfaceServerChat server = new ServerChatFunctions();
			//cria a o servidor
			Naming.rebind("rmi://127.0.0.1:"+porta+"/ServidorChat", server);
			System.out.println("Servidor iniciado");
		}
		catch (Exception cee) {
			System.out.println("Nao foi possive iniciar o servidor");
		}
	}
	public static void main(String args[]) {
		new ChatServer();
	}
}