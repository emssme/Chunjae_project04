package kr.ed.haebeop.persistence;
import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
@Mapper
public interface NoticeMapper {
    public List<Notice> noticeList(Page page) throws Exception;
    public List<Notice> noticeListLimit() throws Exception;
    public int getCount(Page page) throws Exception;
    public Notice noticeDetail(int seq) throws Exception;
    public void noticeInsert(Notice notice) throws Exception;
    public void noticeDelete(int seq) throws Exception;
    public void noticeEdit(Notice notice) throws Exception;
    public void countUp(int seq) throws Exception;
}