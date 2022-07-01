package com.yk.user.common;

/**
 * @program: user-app
 * @description: 返回結果封裝
 * @author: DEFAULT
 * @create: 2022-06-30 13:19
 **/
public class Result {
    private int code;
    private String message;
    private Boolean success;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }
}
