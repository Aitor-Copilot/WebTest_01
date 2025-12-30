package com.example.action;

import org.apache.struts2.ActionSupport;

/**
 * Simple Hello Action class
 */
public class HelloAction extends ActionSupport {
    
    private static final long serialVersionUID = 1L;
    private String message;
    private String name;
    
    public String execute() {
        if (name != null && !name.trim().isEmpty()) {
            message = "Hello, " + name + "! Welcome to Struts 2.";
        } else {
            message = "Hello, Struts 2!";
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

