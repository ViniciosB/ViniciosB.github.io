import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.*;

public class Server {
	private int cont=0;
	private ServerSocket serverSocket;
	private void criarServerSocket(int porta) throws IOException{
		serverSocket=new ServerSocket(porta);
	}
	private Socket esperaConexao() throws IOException{
		Socket socket = serverSocket.accept();
		return socket;
	}
	private void fechaSocket(Socket s) throws IOException{
		s.close();
	}
	private void trataConexao(Socket socket) throws IOException {
		try {
			ObjectOutputStream output=new ObjectOutputStream(socket.getOutputStream());
			ObjectInputStream input=new ObjectInputStream(socket.getInputStream());
			
			String ms=input.readUTF();
			//System.out.println("Mensagem recebida...");
			System.out.println("Mensagem: "+ms+" Recebida do IP: "+socket.getInetAddress()+" Na porta: "+socket.getLocalPort());
			output.writeUTF("Mensagem "+cont+" recebida com sucesso!");
			output.flush();
			input.close();
			output.close();
			cont++;
		}catch(IOException e) {
			System.out.println("Problema no tratamento da conexao com o cliente: "+socket.getInetAddress());
			System.out.println("ERRO: "+e.getMessage());
			
		}finally {
			fechaSocket(socket);
		}
		
	}
	

	public static void main(String[] args) {
		try {
			Server server = new Server();
			System.out.println("Aguardando conexão...");
			server.criarServerSocket(5555);
			while(true) {
				Socket socket = server.esperaConexao();
				System.out.println("Clinte conectado");
				server.trataConexao(socket);
				System.out.println("Cliente finalizado.\n\n");
			}
		}catch(IOException e) {
			System.out.println("ERRO "+e);
		}

	}

}
