package com.yk.user.mapper;

import com.yk.user.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
public interface UserMapper {

    List<User> selectList(@Param(value="username") String username);

    @Insert("insert into tbUser(username,email) values(#{user.username},#{user.email})")
    void insert(@Param(value="user") User user);

    @Delete("delete from tbUser where id=#{id}")
    void delete(@Param(value="id")Integer id);

    @Update("update tbUser set username=#{user.username},email=#{user.email} where id=#{user.id}")
    void edit(@Param(value="user")User user);
}
