# Fixing Struts 2 Deployment Issue

## The Problem

**Struts 2.5.31** (the latest stable version) uses **Java EE 8** with `javax.*` namespace, which is compatible with **Tomcat 9**.

If you're using **Tomcat 10+**, it uses **Jakarta EE 9+** with `jakarta.*` namespace, which Struts 2.5.31 doesn't support yet.

## Solution: Check Your Tomcat Version First

### Step 1: Determine Your Tomcat Version

```powershell
# Check Tomcat version
Get-Content "$env:CATALINA_HOME\RELEASE-NOTES" | Select-Object -First 5
```

Or check the servlet API JAR:
```powershell
Get-ChildItem "$env:CATALINA_HOME\lib\servlet-api*.jar"
```

- **Tomcat 9**: Uses `javax.servlet-api-4.0.x.jar`
- **Tomcat 10+**: Uses `jakarta.servlet-api-6.0.x.jar`

### Step 2: Apply the Correct Configuration

#### For Tomcat 9 (Recommended for Struts 2.5.31):

1. **Replace pom.xml:**
   ```powershell
   Copy-Item "pom-tomcat9.xml" "pom.xml" -Force
   ```

2. **Replace web.xml:**
   ```powershell
   Copy-Item "web-tomcat9.xml" "src\main\webapp\WEB-INF\web.xml" -Force
   ```

3. **Rebuild:**
   ```powershell
   mvn clean package
   ```

4. **Redeploy:**
   ```powershell
   Copy-Item "target\struts-app.war" "$env:CATALINA_HOME\webapps\" -Force
   ```

#### For Tomcat 10+:

Unfortunately, **Struts 2.5.31 doesn't support Jakarta EE yet**. Your options are:

1. **Downgrade to Tomcat 9** (easiest solution)
2. **Wait for Struts 7.0.0** (not yet released)
3. **Use a different framework** that supports Jakarta EE

## Why This Happens

Struts 2.5.31 was compiled against Java EE 8 APIs (`javax.servlet.*`), but Tomcat 10+ provides Jakarta EE APIs (`jakarta.servlet.*`). Even though the package names are different, the compiled Struts classes still reference `javax.*` internally, causing ClassNotFoundException or NoClassDefFoundError.

## Verification

After applying the fix, check Tomcat logs:
```powershell
Get-Content "$env:CATALINA_HOME\logs\catalina.out" -Tail 50
```

Look for:
- ✅ `INFO: Starting Servlet engine: [Apache Tomcat/9.x.x]`
- ✅ `INFO: Deployment of web application [struts-app] has finished`
- ❌ `SEVERE: Error starting application` (if still failing)

## Summary

- **Tomcat 9** + **Java EE 8** (`javax.*`) = ✅ Works with Struts 2.5.31
- **Tomcat 10+** + **Jakarta EE 9+** (`jakarta.*`) = ❌ Doesn't work with Struts 2.5.31

The current configuration in `pom.xml` is for Jakarta EE 6.0, which won't work with Struts 2.5.31. Use the Tomcat 9 configuration files provided.



