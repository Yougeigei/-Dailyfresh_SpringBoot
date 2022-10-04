package cn.hnist;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan(basePackages = "cn.hnist.dao")
/*@EnableTransactionManagement //开启事务管理*/
public class Springboot21Application {

    public static void main(String[] args) {
        SpringApplication.run(Springboot21Application.class, args);
    }

}
