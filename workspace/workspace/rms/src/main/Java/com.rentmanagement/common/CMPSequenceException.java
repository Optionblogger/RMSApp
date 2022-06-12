package com.rentmanagement.common;

public class CMPSequenceException extends Exception {
    private static final long serialVersionUID = -3139914224061009627L;
    private String message;
    private Throwable throwable;
    public CMPSequenceException(String message){
        this.message = message;
    }
    public CMPSequenceException(String message,Throwable throwable){
        this.message = message;
        this.throwable = throwable;
    }
    public String getMessage() {
        return message;
    }
    public Throwable getThrowable() {
        return throwable;
    }

}
