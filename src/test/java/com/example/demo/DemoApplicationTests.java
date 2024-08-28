package com.example.demo;

import com.example.demo.controller.HelloWorldController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(HelloWorldController.class) // 指定测试的控制器
public class DemoApplicationTests {

	@Autowired
	private MockMvc mockMvc; // Spring MVC的Mock对象，用于模拟HTTP请求和响应

	@Test
	public void testSayHello() throws Exception {
		// 执行GET请求到根URL
		mockMvc.perform(get("/hello"))
				// 验证响应状态码为200
				.andExpect(status().isOk())
				// 验证响应体内容为"hello harry"
				.andExpect(content().string("hello harry"));
	}
}