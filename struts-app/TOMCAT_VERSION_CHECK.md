# Tomcat Version Compatibility Guide

## The Issue
Struts 2.5.31 uses **Java EE 8** (`javax.*` namespace), which is compatible with **Tomcat 9**.
For **Tomcat 10+**, you need **Jakarta EE 9+** (`jakarta.*` namespace), but Struts 2.5.31 doesn't support it yet.

## Check Your Tomcat Version

Run one of these commands:
```powershell
# Option 1: Check RELEASE-NOTES
Get-Content "$env:CATALINA_HOME\RELEASE-NOTES" | Select-Object -First 5

# Option 2: Run version script
& "$env:CATALINA_HOME\bin\version.bat"

# Option 3: Check the lib directory
Get-ChildItem "$env:CATALINA_HOME\lib\servlet-api*.jar"
```

## Solutions

### If you have Tomcat 9:
- Use Java EE 8 (javax.* namespace)
- Configuration provided in: `pom-tomcat9.xml`

### If you have Tomcat 10+:
- Option A: Downgrade to Tomcat 9 (recommended for Struts 2.5.31)
- Option B: Wait for Struts 7.0.0 (not yet released)
- Option C: Use a compatibility layer (complex)

## Current Configuration
The current `pom.xml` is configured for **Jakarta EE 6.0** (Tomcat 10+), which may not work with Struts 2.5.31.



