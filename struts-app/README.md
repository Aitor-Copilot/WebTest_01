# Struts 2 Web Application

A simple Struts 2 web application built with Maven and Java 25.

## Component Versions

This project has been configured with the following compatible versions:

- **Java**: 25.0.1 (LTS)
- **Maven**: 3.9.12
- **Struts**: 2.5.31 (latest stable version)
- **Servlet API**: Jakarta EE 6.0.0
- **JSP API**: Jakarta 3.1.1
- **JSTL**: 3.0.0
- **Tomcat**: 10.x or 11.x (supports Jakarta EE 6.0)

## Compatibility Notes

- **Java 25** is compatible with Struts 2.5.31
- **Tomcat 10+** is required for Jakarta EE 6.0 support (Tomcat 9 uses Java EE, not Jakarta EE)
- **Maven 3.9.12** works with all Java versions including Java 25

## Project Structure

```
struts-app/
├── pom.xml                          # Maven configuration
├── src/
│   └── main/
│       ├── java/
│       │   └── com/example/action/  # Action classes
│       │       ├── HelloAction.java
│       │       └── WelcomeAction.java
│       ├── resources/
│       │   └── struts.xml           # Struts configuration
│       └── webapp/
│           ├── index.jsp            # Home page
│           └── WEB-INF/
│               ├── web.xml          # Web application descriptor
│               └── jsp/             # JSP views
│                   ├── hello.jsp
│                   ├── welcome.jsp
│                   └── error.jsp
```

## Building the Project

1. Navigate to the project directory:
   ```bash
   cd struts-app
   ```

2. Build the project:
   ```bash
   mvn clean package
   ```

   This will create a WAR file in the `target` directory: `struts-app.war`

## Deploying to Tomcat

1. Copy the WAR file to Tomcat's webapps directory:
   ```bash
   copy target\struts-app.war %CATALINA_HOME%\webapps\
   ```

2. Start Tomcat:
   ```bash
   %CATALINA_HOME%\bin\startup.bat
   ```

3. Access the application:
   - Home: http://localhost:8080/struts-app/
   - Welcome Action: http://localhost:8080/struts-app/welcome.action
   - Hello Action: http://localhost:8080/struts-app/hello.action

## Development

### Running in Development Mode

The `struts.xml` is configured with `struts.devMode = true` for easier debugging.

### Available Actions

- **WelcomeAction**: Displays a welcome message
- **HelloAction**: Accepts a name parameter and displays a personalized greeting

### Testing

You can test the application by:
1. Accessing the home page at `/struts-app/`
2. Clicking the action links
3. Using the Hello form to submit a name

## Configuration Files Explained

### pom.xml
- Defines Maven project structure
- Configures dependencies (Struts 2, Jakarta EE APIs, JSTL)
- Sets Java 25 as source and target version
- Configures WAR plugin for packaging

### web.xml
- Configures Struts 2 filter (`StrutsPrepareAndExecuteFilter`)
- Maps all URLs (`/*`) to the Struts filter
- Sets welcome file to `index.jsp`

### struts.xml
- Defines action mappings
- Configures results (JSP pages)
- Sets development mode
- Configures global exception handling

## Troubleshooting

### Common Issues

1. **ClassNotFoundException**: Ensure Tomcat version is 10.x or higher
2. **Servlet API errors**: Verify Jakarta EE dependencies are correct
3. **404 errors**: Check that the WAR file is deployed correctly
4. **Compilation errors**: Verify Java 25 is properly installed and configured

### Verifying Installation

- Check Java version: `java -version`
- Check Maven version: `mvn -version`
- Check Tomcat: `%CATALINA_HOME%\bin\version.bat`

## Next Steps

- Add more actions and business logic
- Integrate with a database (Hibernate, MyBatis)
- Add validation using Struts 2 validation framework
- Implement authentication and authorization
- Add REST API support

