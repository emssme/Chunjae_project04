package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Fileboard;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileboardMapper {
    public void writeArticle(Fileboard fileboardDto) throws Exception;
    public void fileRegister(Fileboard fileboardDto) throws Exception;
    public List<Fileboard> fileList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public Fileboard fileDetail(int articleno) throws Exception;
    public void fileboardDelete(int articleno) throws Exception;
    public void fileboardEdit(Fileboard dto) throws Exception;
    public void visitedUpdate(int articleno) throws Exception;
    public void recUpdate(int articleno) throws Exception;
}
