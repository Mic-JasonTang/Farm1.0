package com.Jason.File.Servlet;

import java.math.BigInteger;
import java.util.Random;

public class UUID {
	public static String getUUID() {
		return  System.currentTimeMillis() + new BigInteger(165,new Random()).toString(35).toUpperCase();
	}
}
