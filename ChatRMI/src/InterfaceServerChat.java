import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.ArrayList;

/**
* @author vinic
* @see InterfaceServerChat
* Interface responsavel por instancias as fun�oes a serem usadas na aplica��o.
*/



public interface InterfaceServerChat extends Remote {
	
	public void enviar(String mensagem) throws RemoteException;
	public ArrayList<String> Sincronia() throws RemoteException;
	
}