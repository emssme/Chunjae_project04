package kr.ed.haebeop.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//dispatcher-Servlet.xml을 대신하는 ServletContxt.java : kr.ed.haebeop.config
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"kr.ed.haebeop"})
public class ServletContext implements WebMvcConfigurer {

    //컨트롤러에서 던진 URL : /notice/noticeList
    //실제 존재하는 URL : /WEB-INF/views/notice/noticeList.jsp
    //앞(prefix)의 /WEB-INF/views, 뒤(suffix)의 .jsp
    //리졸버에 대한 접두사와 접미사 설정
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/");
        bean.setSuffix(".jsp");
        registry.viewResolver(bean);
    }
    //접근 자원에 대한 권한 설정
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler("/admin/**").addResourceLocations("/WEB-INF/views/admin");
        registry.addResourceHandler("/ajax/**").addResourceLocations("/WEB-INF/views/ajax");
        registry.addResourceHandler("/board/**").addResourceLocations("/WEB-INF/views/board");
        registry.addResourceHandler("/user/**").addResourceLocations("/WEB-INF/views/user");
        registry.addResourceHandler("/notice/**").addResourceLocations("/WEB-INF/views/notice");
        registry.addResourceHandler("/qna/**").addResourceLocations("/WEB-INF/views/qna");
        registry.addResourceHandler("/faq/**").addResourceLocations("/WEB-INF/views/faq");
        registry.addResourceHandler("/test/**").addResourceLocations("/WEB-INF/views/test");
        registry.addResourceHandler("/setting/**").addResourceLocations("/WEB-INF/views/setting");
        registry.addResourceHandler("/layout/**").addResourceLocations("/WEB-INF/views/layout");
        registry.addResourceHandler("/fileboard/**").addResourceLocations("/WEB-INF/views/fileboard");
        registry.addResourceHandler("/community/**").addResourceLocations("/WEB-INF/views/community");
        registry.addResourceHandler("/curriculum/**").addResourceLocations("/WEB-INF/views/curriculum");
        registry.addResourceHandler("/lecture/**").addResourceLocations("/WEB-INF/views/lecture");
        registry.addResourceHandler("/register/**").addResourceLocations("/WEB-INF/views/register");
    }
}
