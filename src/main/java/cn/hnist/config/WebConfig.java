package cn.hnist.config;


import cn.hnist.interceptor.AdminInterceptor;
import cn.hnist.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author
 * @date 2022年10月18日 10:42
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    /**
     * 添加Web项目的拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 对所有访问路径，都通过MyInterceptor类型的拦截器进行拦截
        registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/user/**")
                .excludePathPatterns("/images/**", "/js/**", "/fonts/**","/css/**");
        //放行登录页，登陆操作，静态资源
        registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin/**")
                .excludePathPatterns("/images/**", "/js/**", "/fonts/**","/css/**");
    }
}
