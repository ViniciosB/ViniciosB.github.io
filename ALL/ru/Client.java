package ru;

import java.rmi.*;
public class Client
{
public static void main(String[] args)
    {
        int x = 15, y = 5;
        try
        {
            Calculator stub = (Calculator) Naming.lookup("rmi://localhost:5000/calculate");
            
            System.out.println("x = " + x + "| y = " + y);
            System.out.println("x + y: " + stub.add(x, y));
            System.out.println("x - y: " + stub.subtract(x, y));
            System.out.println("x * y: " + stub.multiply(x, y));
            System.out.println("x / y: " + stub.divide(x, y));
        } 
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
    }
}