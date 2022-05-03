/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.vinic.ordenacao;

// Java Program implementing
// binary insertion sort

import java.util.Arrays;
public class BinaryInsertionSortClass{

	public static void main(String[] args)
	{
		final int[] arr = { 37, 23, 0, 17, 12, 72,
							31, 46, 100, 88, 54 };

		new BinaryInsertionSortClass().sort(arr);

		for (int i = 0; i < arr.length; i++)
			System.out.print(arr[i] + " ");
	}

	// Driver Code
	public void sort(int array[])
	{
		for (int i = 1; i < array.length; i++)
		{
			int x = array[i];

			// Find location to insert
			// using binary search
			int j = Math.abs(
				Arrays.binarySearch(array, 0,
									i, x) + 1);

			// Shifting array to one
			// location right
			System.arraycopy(array, j,
							array, j + 1, i - j);

			// Placing element at its
			// correct location
			array[j] = x;
		}
	}
}



