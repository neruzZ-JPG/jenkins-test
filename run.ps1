# 项目名称
$projectName = "my-simple-web-app"

# 创建主项目目录
New-Item -ItemType Directory -Path $projectName -Force

# 创建 src 目录结构
New-Item -ItemType Directory -Path "$projectName\src\main\java\com\example\servlet" -Force
New-Item -ItemType Directory -Path "$projectName\src\main\resources" -Force

# 创建 webapp 目录结构
New-Item -ItemType Directory -Path "$projectName\webapp\WEB-INF\classes" -Force
New-Item -ItemType Directory -Path "$projectName\webapp\WEB-INF\lib" -Force
New-Item -ItemType Directory -Path "$projectName\webapp\static\css" -Force
New-Item -ItemType Directory -Path "$projectName\webapp\static\js" -Force

# 创建示例文件
$helloWorldServlet = @"
package com.example.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class HelloWorldServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("Hello, World!");
    }
}
"@
$helloWorldServlet | Out-File -FilePath "$projectName\src\main\java\com\example\servlet\HelloWorldServlet.java" -Encoding utf8

$indexJspContent = @"
<html>
<head>
    <title>My Simple Web App</title>
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <script src="static/js/script.js"></script>
</head>
<body>
    <h1>Welcome to My Simple Web App</h1>
</body>
</html>
"@
$indexJspContent | Out-File -FilePath "$projectName\webapp\index.jsp" -Encoding utf8

$cssContent = "/* CSS styles go here */"
$cssContent | Out-File -FilePath "$projectName\webapp\static\css\style.css" -Encoding utf8

$jsContent = "// JavaScript code goes here"
$jsContent | Out-File -FilePath "$projectName\webapp\static\js\script.js" -Encoding utf8

$webXmlContent = @"
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee 
         http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">
    <servlet>
        <servlet-name>HelloWorldServlet</servlet-name>
        <servlet-class>com.example.servlet.HelloWorldServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>HelloWorldServlet</servlet-name>
        <url-pattern>/hello</url-pattern>
    </servlet-mapping>
</web-app>
"@
$webXmlContent | Out-File -FilePath "$projectName\webapp\WEB-INF\web.xml" -Encoding utf8

$readmeContent = "# $projectName`nThis is a simple Java web application project structure."
$readmeContent | Out-File -FilePath "$projectName\README.md" -Encoding utf8

# 创建 Maven 的 pom.xml 文件 (可选)
$pomXmlContent = @"
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.example</groupId>
    <artifactId>my-simple-web-app</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>

    <dependencies>
        <!-- 添加所需的依赖项 -->
    </dependencies>

    <build>
        <plugins>
            <!-- 添加构建插件 -->
        </plugins>
    </build>
</project>
"@
$pomXmlContent | Out-File -FilePath "$projectName\pom.xml" -Encoding utf8
