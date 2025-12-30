package com.example.action;

import org.apache.struts2.ActionSupport;

/**
 * Index Action class - handles the home page
 */
public class IndexAction extends ActionSupport {
    
    private static final long serialVersionUID = 1L;
    
    public String execute() {
        return SUCCESS;
    }
}

