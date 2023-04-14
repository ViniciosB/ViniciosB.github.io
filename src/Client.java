import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.*;

public class Client { 
	public static void main(String[] args) {
		try {
			System.out.println("Estabelecendo conexão...");
			Socket socket=new Socket("localhost",5555);
			System.out.println("conexão estabelecida.");
			ObjectOutputStream output = new ObjectOutputStream(socket.getOutputStream());
			ObjectInputStream input = new ObjectInputStream(socket.getInputStream());
			System.out.println("enviando mensagem...");
			String msg="SD é muito interessante!";
			output.writeUTF(msg);
			output.flush();
			System.out.println("Mensagem "+msg+" Enviada.");
			msg=input.readUTF();
			System.out.println("Resposta: "+msg);
			input.close();
			output.close();
			socket.close();
		}catch(IOException e) {
			System.out.println("Erro no cliente: "+e);
		}
	}
}
