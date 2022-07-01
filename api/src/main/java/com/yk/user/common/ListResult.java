package com.yk.user.common;

import java.util.List;

/**
 * @program: user-app
 * @description:
 * @author: DEFAULT
 * @create: 2022-06-30 13:24
 **/
public class ListResult<T> extends Result {
    private List<T> data;

    public ListResult(List<T> list){
        this.data = list;
        this.setSuccess(true);
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
