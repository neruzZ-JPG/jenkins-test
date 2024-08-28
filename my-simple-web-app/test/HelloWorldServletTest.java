package test;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class HelloWorldServletTest {

    @Test
    public void testDoGet() throws ServletException, IOException {
        HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
        HttpServletResponse response = Mockito.mock(HttpServletResponse.class);

        HelloWorldServlet servlet = new HelloWorldServlet();

        servlet.doGet(request, response);

        verify(response, times(1)).getWriter();
        verify(response.getWriter(), times(1)).println("Hello, World!");
    }
}

