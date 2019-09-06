package cn.yl.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ssm.controller.online.YOnLineExamController;

/**
 * desc
 * @Date 2019年9月6日
 * @Author YL
 */
public class TestInterface {
	
	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("classpath:com/ssm/config/spring-*.xml");
		YOnLineExamController line = ioc.getBean(YOnLineExamController.class);
		System.out.println(line.onLineTaskList(1));
		
	}
	
	
}
