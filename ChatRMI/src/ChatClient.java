import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.rmi.*;
import java.util.*;
import java.rmi.RemoteException;

public class ChatClient {

	public static void main(String args[]) {
		String conect = null; // string de conexao.
		String nome; // responsavel por armazenar o nome do usuario.

		// verifica se foram passados dois parametros para o programa em caso verdadeiro
		// monta a sting de conexao.
		// caso falso imprime avisos para o cliente e fecha o programa.
		if (args.length == 2) {
			conect = "rmi://" + args[0].toString() + ":" + args[1].toString() + "/ServidorChat";
			System.out.println("Iniciando cliente");
		} else {
			System.err.println("Uma ou mais informacoes foram omitidas nos argumento");
			System.err.println("Verifique e tente novamente");
			System.err.println("Fechando Aplicacao");
			System.exit(0);
		}

		try {

			// passa endereco para conexao com o servidor
			final InterfaceServerChat chat = (InterfaceServerChat) Naming.lookup(conect);
			System.out.println("conexao estabelecida com sucesso");

			// coleta o nome do usuario
			@SuppressWarnings("resource")
			Scanner scanner = new Scanner(System.in);
			System.out.println("Digite seu nome: ");
			nome = scanner.nextLine();
			chat.enviar(nome + ": conecou-se ao chat");

			// thread de sincronia de mensaens
			Thread thread = new Thread(new Runnable() {
				int cont = chat.Sincronia().size();

				public void run() {
					try {
						while (true) {
							if (chat.Sincronia().size() > cont) {
								String msg = chat.Sincronia().get(chat.Sincronia().size() - 1);
								if (msg.indexOf(nome + ":") == -1) {
									System.out.println(chat.Sincronia().get(chat.Sincronia().size() - 1));
								}
								//System.out.println("cont" + cont);
								cont++;
							}

						}
					} catch (RemoteException e) {
						// e.printStackTrace();
					}
				}
			});
			thread.start();

			// thread responsavel pelo envio de mensagens

			Thread thread2 = new Thread(new Runnable() {
				String msg;

				public void run() {
					while (msg != "exit") {
						DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
						String time = "[" + dtf.format(LocalDateTime.now()) + "]";
						msg = scanner.nextLine();
						try {
							chat.enviar(time + nome + ": " + msg);
						} catch (RemoteException e) {
							// e.printStackTrace();
						}

					}
				}
			});
			thread2.start();

		} catch (ConnectException ce) {
			System.err.println("Nao foi possivel estabelecer uma conexao com o servidor");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
