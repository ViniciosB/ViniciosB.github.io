package ru;
import java.rmi.*;
import java.rmi.registry.*;
public class Server
{
    public static void main(String[] args)
    {
        try
        {
            Calculator stub = new CalculatorImpl();
            Naming.rebind("rmi://localhost:5000/calculate", stub);
        } catch (Exception e)
        {
            System.out.println(e.toString());
        }
    }
}