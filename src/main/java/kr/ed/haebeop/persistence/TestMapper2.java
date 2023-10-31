package kr.ed.haebeop.persistence;
import kr.ed.haebeop.domain.Test;
import org.apache.ibatis.annotations.*;
import java.util.List;
//Mapper 인터페이스 + QueryDSL(쿼리 어노테이션)
//해당 SQL명령에 맞는 어노테이션이 있어야 하며, ApplicationConfig에 Bean 등록 하지 안함.
@Mapper
public interface TestMapper2 {
    @Select("SELECT * FROM test")
    public List<Test> TestList3();
}