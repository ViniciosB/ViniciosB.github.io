import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.ArrayList;

/**
* @author vinic
* @see InterfaceServerChat
* Interface responsavel por instancias as funcoes a serem usadas na aplicacao.
*/



public interface InterfaceServerChat extends Remote {
	
	public void enviar(String mensagem) throws RemoteException;
	public ArrayList<String> Sincronia() throws RemoteException;
	
}
