package kr.ed.haebeop.config;

import kr.ed.haebeop.persistence.*;
import kr.ed.haebeop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//컨트롤러나 서비스, 매퍼, 레포지토리에서 사용할 Bean을 등록
@Configuration
@ComponentScan(basePackages = "kr.ed.haebeop")
public class ApplicationConfig {
    @Bean
    public TestService testService() {
        return new TestServiceImpl();
    }

    @Bean
    public TestPersistence testPersistence() {
        return new TestPersistenceImpl();
    }
    @Bean
    public UserService userService() {
        return new UserServiceImpl();
    }
    @Bean
    public NoticeService noticeService() {
        return new NoticeServiceImpl();
    }
    @Bean
    public CommunityService communityService() {
        return new CommunityServiceImpl();
    }

    @Bean
    public CommunityPersistence communityPersistence() {
        return new CommunityPersistenceImpl();
    }
    @Bean
    public CommentService commentService() {
        return new CommentServiceImpl();
    }

    @Bean
    public CommentPersistence commentPersistence() {
        return new CommentPersistenceImpl();
    }
    @Bean
    public LectureService lectureService(){ return new LectureServiceImpl();}
}
