package test;

import org.springframework.util.DigestUtils;

public class UserTest {

	public static void main(String[] args) {
		
		try {
		String a =	DigestUtils.md5DigestAsHex("a098999".getBytes("utf8"));
		
		System.out.println(a);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
