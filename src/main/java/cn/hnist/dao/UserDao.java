package cn.hnist.dao;

import cn.hnist.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserDao {

    /**
     * 查询所有用户
     */
    @Select("select * from user")
    List<User> findAllUser();

    /**
     * 根据用户名查询用户信息
     */
    @Select("select * from user where username=#{username}")
    User findByUsername(@Param("username") String username);

    /**
     * 保存用户
     */
    @Insert("insert into user(username,password,is_superuser,email,status,code) " +
            "values(#{username}, #{password}, #{is_superuser}, #{email}, #{status}, #{code})")
    void save(User user);

    /**
     * 根据用户激活码查询用户
     */
    @Select("select * from user where code=#{code}")
    User findByCode(String code);

    /**
     * 更新用户激活码
     */
    @Update("update user set status='Y' where id=#{id}")
    void updateStatus(User user);

    /**
     * 通过用户名和密码查询用户
     */
    @Select("select * from user where username=#{arg0} and password=#{arg1};")
    User findByNameAndPwd(@Param("arg0") String username, @Param("arg1") String password);

    /**
     * 根据用户id查询用户
     */
    @Select("select * from user where id=#{id}")
    User findById(Integer id);
}
