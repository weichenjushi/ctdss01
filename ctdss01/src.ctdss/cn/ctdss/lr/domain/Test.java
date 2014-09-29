package cn.ctdss.lr.domain;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import org.apache.commons.beanutils.BeanMap;

public class Test<T> {

	
	private T name;


	
	/*public static void main(String[] args) throws ClassNotFoundException {
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

	}*/

	public T getName() {
		return name;
	}

	public void setName(T name) throws ClassNotFoundException {
		//String classname="cn.ctdss.lr.domain."+T;
		//Class newClass = Class.forName(T);
		//Class c1 = new T().getClass();
		//
		
/*		Method[] methods = newClass.getDeclaredMethods();
		for (int i = 0; i < methods.length; i++) {
			Method m = methods[i];
			String methodName = m.getName();
			if (methodName.startsWith("get")) {
				System.out.println(methodName);
				String propertyName = methodName.substring(3, 4).toLowerCase()
						+ methodName.substring(4, methodName.length());
				System.out.println(propertyName);
			}
		}*/
	}


}
