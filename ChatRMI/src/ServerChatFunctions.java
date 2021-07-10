import java.rmi.*;
import java.util.ArrayList;
/**
 * 
 *@see ServerChatFunctions
 *Clase responsavel por implentar os metodos que seram usados no ChatServer.
 */

@SuppressWarnings("serial")
public class ServerChatFunctions extends java.rmi.server.UnicastRemoteObject implements InterfaceServerChat {
	
	ArrayList<String> mensagens;
	
	/**
	* @see ServerChatFunctions
	* Metodo resposavel por realizar o construtor da classe.
	* 
	* @return não retorna nada.
	*/
	
	public ServerChatFunctions() throws RemoteException {
		super();
		this.mensagens = new ArrayList<String>();
	}
	
	/**
	* @see enviar
	* Metodo resposavel por receber a mensagem digitada pelo usuario e enviada ao servidor, adicionar ao arraylis e imprimir no servidor o conteudo.
	* @param mensagem uma mensagem digitada pelo usuario e enviada ao servidor em formato de string.
	* @return não retorna nada.
	*/
	
	public void enviar(String mensagem) throws RemoteException {
		mensagens.add(mensagem);
		System.out.println(mensagem);
	}
	
	/**
	* @see Sincronia
	* Metodo resposavel por devolver a a mensagem digitada por um usuario qualquer do servidor para a aplicação de outro usuario, podemos descrever como uma sincronia de mensagens.
	* @param mensagens Mensagens trocadas sao armazenadas no arraylist de Strings.
	* @return um arraylist de mensagens.
	*/
	
	public ArrayList<String> Sincronia() throws RemoteException {
		return mensagens;
	}

}