package com.example.action;

import org.apache.struts2.ActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.struts2.action.ServletRequestAware;

/**
 * Simple Hello Action class
 */
public class HelloAction extends ActionSupport implements ServletRequestAware {
    
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(HelloAction.class);
    
    private HttpServletRequest request;
    private String message;
    private String name;
    
    @Override
    public void withServletRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    public String execute() {
        logger.info("HelloAction.execute() called");
        
        // Try to get name from request parameters if not set via setter
        if (name == null && request != null) {
            String nameParam = request.getParameter("name");
            logger.info("Name from request parameter: '{}'", nameParam);
            if (nameParam != null && !nameParam.trim().isEmpty()) {
                this.name = nameParam;
            }
        }
        
        logger.info("Name received: '{}'", name);
        logger.info("Name is null: {}", name == null);
        logger.info("Name equals 'null' string: {}", "null".equals(name));
        
        // Check if name is null or the string "null"
        if (name != null && !name.equals("null") && !name.trim().isEmpty()) {
            message = "Hello, " + name + "! Welcome to Struts 2.";
            logger.info("Message set to: '{}'", message);
        } else {
            message = "Hello, Struts 2!";
            logger.info("No name provided, using default message: '{}'", message);
        }
        
        return SUCCESS;
    }
    
    public void setName(String name) {
        logger.info("setName called with value: '{}'", name);
        this.name = name;
        logger.info("Name field set to: '{}'", this.name);
    }
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    
    public String getName() {
        return name;
    }
}

