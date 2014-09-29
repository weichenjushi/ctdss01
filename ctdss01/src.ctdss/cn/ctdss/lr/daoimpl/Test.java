package cn.ctdss.lr.daoimpl;

import java.lang.reflect.Method;

public class Test {
	public static void main(String[] args) throws ClassNotFoundException {
		Class newClass = Class.forName("cn.ctdss.lr.domain.User");
		Method[] methods = newClass.getDeclaredMethods();
		for (int i = 0; i < methods.length; i++) {

			Method m = methods[i];

			String methodName = m.getName();

			if (methodName.startsWith("get")) {
				System.out.println(methodName);
				String propertyName = methodName.substring(3, 4).toLowerCase()
						+ methodName.substring(4, methodName.length());
				System.out.println(propertyName);

			}
		}
	}
}
