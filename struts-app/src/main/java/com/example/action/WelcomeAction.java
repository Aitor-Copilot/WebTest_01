package com.example.action;

import org.apache.struts2.ActionSupport;

/**
 * Welcome Action class
 */
public class WelcomeAction extends ActionSupport {
    
    private static final long serialVersionUID = 1L;
    private String welcomeMessage;
    
    public String execute() {
        welcomeMessage = "Welcome to your Struts 2 Application!";
        return SUCCESS;
    }
    
    public String getWelcomeMessage() {
        return welcomeMessage;
    }
    
    public void setWelcomeMessage(String welcomeMessage) {
        this.welcomeMessage = welcomeMessage;
    }
}

