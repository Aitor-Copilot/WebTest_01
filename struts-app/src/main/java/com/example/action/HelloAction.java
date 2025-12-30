package com.example.action;

import org.apache.struts2.ActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Simple Hello Action class
 */
public class HelloAction extends ActionSupport {
    
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(HelloAction.class);
    
    private String message;
    private String name;
    
    public String execute() {
        logger.info("HelloAction.execute() called");
        logger.info("Name received: '{}'", name);
        logger.debug("Name is null: {}, Name is empty: {}", 
                     name == null, 
                     name != null && name.trim().isEmpty());
        
        if (name != null && !name.trim().isEmpty()) {
            message = "Hello, " + name + "! Welcome to Struts 2.";
            logger.info("Message set to: '{}'", message);
        } else {
            message = "Hello, Struts 2!";
            logger.info("No name provided, using default message: '{}'", message);
        }
        
        return SUCCESS;
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
    
    public void setName(String name) {
        this.name = name;
    }
}

