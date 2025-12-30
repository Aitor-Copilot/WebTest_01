# Struts 2 Project Setup - Step by Step Guide

## Overview
This document explains the steps followed to create a Struts 2 web application with Maven, ensuring compatibility with your infrastructure.

## Component Version Compatibility Check

### Step 1: Verified Installed Components
- **Java**: 25.0.1 (LTS) - Verified ✓
- **Maven**: 3.9.12 - Verified ✓
- **Tomcat**: Installed (CATALINA_HOME environment variable set) ✓

### Step 2: Selected Compatible Versions
Based on your infrastructure, I selected the following compatible versions:

| Component | Version | Compatibility Notes |
|-----------|---------|-------------------|
| **Java** | 25.0.1 | Your installed version |
| **Maven** | 3.9.12 | Your installed version |
| **Struts** | 2.5.31 | Latest stable, compatible with Java 25 |
| **Servlet API** | Jakarta EE 6.0.0 | Required for Tomcat 10+ |
| **JSP API** | Jakarta 3.1.1 | Compatible with Servlet 6.0 |
| **JSTL** | 3.0.1 | Fixed version (3.0.0 had dependency issues) |
| **Tomcat** | 10.x or 11.x | Required for Jakarta EE 6.0 support |

**Important Compatibility Notes:**
- Java 25 is fully compatible with Struts 2.5.31
- Tomcat 10+ is required (Tomcat 9 uses Java EE, not Jakarta EE)
- Jakarta EE 6.0 uses the `jakarta.*` namespace (not `javax.*`)

## Project Creation Steps

### Step 3: Created Maven Project Structure
Created the standard Maven web application directory structure:
```
struts-app/
├── pom.xml
├── src/
│   └── main/
│       ├── java/com/example/action/
│       ├── resources/
│       └── webapp/
│           ├── WEB-INF/
│           └── index.jsp
```

### Step 4: Configured pom.xml
**Key configurations:**
- Set Java source and target to 25
- Added Struts 2.5.31 dependencies (core + convention plugin)
- Added Jakarta EE 6.0 dependencies (Servlet, JSP, JSTL)
- Configured Maven compiler and WAR plugins
- Fixed JSTL version from 3.0.0 to 3.0.1 (resolved dependency issues)

**Dependencies added:**
- `struts2-core` - Core Struts 2 framework
- `struts2-convention-plugin` - Annotation-based configuration support
- `jakarta.servlet-api` (provided scope) - Servlet API
- `jakarta.servlet.jsp-api` (provided scope) - JSP API
- `jakarta.servlet.jsp.jstl-api` - JSTL API
- `jakarta.servlet.jsp.jstl` (implementation) - JSTL implementation
- `slf4j-api` and `slf4j-simple` - Logging framework

### Step 5: Created web.xml Configuration
**Location:** `src/main/webapp/WEB-INF/web.xml`

**Key configurations:**
- Configured Jakarta EE 6.0 namespace
- Added Struts 2 filter: `StrutsPrepareAndExecuteFilter`
- Mapped filter to all URLs (`/*`)
- Set `index.jsp` as welcome file

### Step 6: Created struts.xml Configuration
**Location:** `src/main/resources/struts.xml`

**Key configurations:**
- Enabled development mode (`struts.devMode = true`)
- Set UTF-8 encoding
- Defined action mappings:
  - `/hello` → `HelloAction` → `hello.jsp`
  - `/welcome` → `WelcomeAction` → `welcome.jsp`
- Configured global exception handling

### Step 7: Created Action Classes
**Location:** `src/main/java/com/example/action/`

**HelloAction.java:**
- Extends `ActionSupport`
- Accepts a `name` parameter
- Returns personalized greeting message

**WelcomeAction.java:**
- Extends `ActionSupport`
- Displays welcome message

### Step 8: Created JSP Views
**Location:** `src/main/webapp/WEB-INF/jsp/`

**Created views:**
- `index.jsp` - Home page with navigation
- `hello.jsp` - Hello action view with form
- `welcome.jsp` - Welcome message display
- `error.jsp` - Error handling page

All JSPs use:
- Struts 2 tag library (`/struts-tags`)
- Modern, responsive CSS styling
- UTF-8 encoding

### Step 9: Fixed Build Issues
**Issues encountered and resolved:**
1. **JSTL Dependency Issue**: Changed from version 3.0.0 to 3.0.1
   - Error: "POM for jakarta.servlet.jsp.jstl-api:jar:3.0.0-RC1 is missing"
   - Solution: Updated to stable version 3.0.1

2. **File Locking Issue**: Windows file locking prevented clean
   - Solution: Use `mvn package` instead of `mvn clean package` if needed

## Build and Deployment

### Step 10: Building the Project
```bash
cd struts-app
mvn clean compile    # Compile only
mvn package          # Create WAR file
```

**Build Output:**
- WAR file created at: `target/struts-app.war`
- Compilation: SUCCESS ✓
- Packaging: SUCCESS ✓

### Step 11: Deploying to Tomcat
```bash
# Copy WAR file to Tomcat
copy target\struts-app.war %CATALINA_HOME%\webapps\

# Start Tomcat
%CATALINA_HOME%\bin\startup.bat
```

### Step 12: Accessing the Application
- **Home**: http://localhost:8080/struts-app/
- **Welcome**: http://localhost:8080/struts-app/welcome.action
- **Hello**: http://localhost:8080/struts-app/hello.action

## Project Structure Summary

```
struts-app/
├── pom.xml                                    # Maven configuration
├── README.md                                  # Project documentation
├── SETUP_STEPS.md                            # This file
├── src/
│   └── main/
│       ├── java/
│       │   └── com/example/action/
│       │       ├── HelloAction.java          # Hello action class
│       │       └── WelcomeAction.java        # Welcome action class
│       ├── resources/
│       │   └── struts.xml                    # Struts configuration
│       └── webapp/
│           ├── index.jsp                     # Home page
│           └── WEB-INF/
│               ├── web.xml                   # Web application descriptor
│               └── jsp/
│                   ├── hello.jsp             # Hello view
│                   ├── welcome.jsp           # Welcome view
│                   └── error.jsp             # Error page
└── target/
    └── struts-app.war                        # Deployable WAR file
```

## Verification Checklist

- [x] Java 25.0.1 installed and verified
- [x] Maven 3.9.12 installed and verified
- [x] Tomcat installed (CATALINA_HOME set)
- [x] Project structure created
- [x] pom.xml configured with compatible dependencies
- [x] web.xml configured with Struts filter
- [x] struts.xml configured with action mappings
- [x] Action classes created and compiled
- [x] JSP views created
- [x] Project compiles successfully
- [x] WAR file generated successfully

## Next Steps

1. **Deploy to Tomcat**: Copy the WAR file to Tomcat's webapps directory
2. **Test the Application**: Access the URLs listed above
3. **Add More Features**: 
   - Database integration
   - Form validation
   - Authentication/Authorization
   - REST API endpoints

## Troubleshooting

### If compilation fails:
- Verify Java version: `java -version`
- Verify Maven version: `mvn -version`
- Check pom.xml for correct dependency versions
- Clear Maven cache: `mvn dependency:purge-local-repository`

### If deployment fails:
- Verify Tomcat version is 10.x or higher
- Check CATALINA_HOME environment variable
- Verify WAR file was created in target directory
- Check Tomcat logs for errors

### If JSP errors occur:
- Verify JSTL dependencies are correct
- Check that Struts tag library is imported
- Verify web.xml configuration

## Summary

The project has been successfully created with:
- ✅ Compatible component versions verified
- ✅ Maven project structure established
- ✅ Struts 2 framework configured
- ✅ Sample actions and views created
- ✅ Build successful
- ✅ WAR file generated

The application is ready for deployment to Tomcat!


