package com.yk.user.common;

/**
 * @program: user-app
 * @description: 单条数据
 * @author: DEFAULT
 * @create: 2022-06-30 13:22
 **/
public class SingleResult<T> extends Result {
    private T data;

    public SingleResult(T data){
        this.data = data;
        this.setSuccess(true);
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
