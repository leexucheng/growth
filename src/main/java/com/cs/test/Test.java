package com.cs.test;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Random;

import com.cs.common.AppUtil;

public class Test {
	
	public static void test1(){
		BigDecimal pecent80 = new BigDecimal("0.8");
		BigDecimal pecent6 = new BigDecimal("0.06");
		BigDecimal pecent1 = new BigDecimal("0.01");
		
		BigDecimal reward = new BigDecimal("88.8").setScale(2,RoundingMode.HALF_DOWN);
		BigDecimal payForPartB = reward.multiply(pecent80).setScale(2,RoundingMode.HALF_DOWN);
		BigDecimal payForPartAparent = reward.multiply(pecent6).setScale(2,RoundingMode.HALF_DOWN);
		BigDecimal payForPartAgrandpa = reward.multiply(pecent1).setScale(2,RoundingMode.HALF_DOWN);
		BigDecimal payForPartBparent = payForPartB.multiply(pecent6).setScale(2,RoundingMode.HALF_DOWN);
		BigDecimal payForPartBgrandpa = payForPartB.multiply(pecent1).setScale(2,RoundingMode.HALF_DOWN);
		
		BigDecimal payForPlatform = reward.subtract(payForPartB).subtract(payForPartAparent)
				.subtract(payForPartAgrandpa).subtract(payForPartBparent).subtract(payForPartBgrandpa);
		
		System.out.println(reward);
		System.out.println(payForPartB);
		System.out.println(payForPartAparent);
		System.out.println(payForPartAgrandpa);
		System.out.println(payForPartBparent);
		System.out.println(payForPartBgrandpa);
		System.out.println(payForPlatform);
		
	}

	public static void main(String[] args) {
		/*BigDecimal reward = new BigDecimal("505.5654").setScale(3,RoundingMode.HALF_DOWN);
		System.out.println(reward);
		*/
		/*BigDecimal ba = new BigDecimal("52");
		BigDecimal reward = new BigDecimal("34");
		System.out.println(ba.subtract(reward));*/
		
		//System.out.println("100".hashCode() > "101".hashCode());
//		String a = null;
//		System.out.println(a.hashCode());
		
		/*BigDecimal reward = new BigDecimal("8");
		System.out.println(reward.negate());*/
		
		//System.out.println("10".hashCode() < "10".hashCode());
		
		/*BigDecimal reward = new BigDecimal("505").setScale(3,RoundingMode.DOWN);
		
		reward = reward.add(new BigDecimal("5"));
		System.out.println(reward);*/
		
		Long total =0l;
		Long pages = total/20 + (total%20==0?0:1);
		System.out.println(pages.intValue());
		
		Random ran = new Random();
		int p = ran.nextInt(pages.intValue());
	}
}
