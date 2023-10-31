package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.util.LecturePage;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LectureMapper {
    public List<LectureVO> lastList() throws Exception;
    public List<LectureVO> newList() throws Exception;
    public List<LectureVO> lectureList(LecturePage page) throws Exception;
    public int getCount(LecturePage page) throws Exception;
    public LectureVO lectureDetail(String lcode) throws Exception;
    public void lectureInsert(Lecture dto) throws Exception;
    public void lectureEdit(Lecture dto) throws Exception;
    public int lectureCount() throws Exception;
    public List<Subject> subjects() throws Exception;
    public boolean comparePeriod(String lcode) throws Exception;
    public List<LectureVO> popularLectureList() throws Exception;
    public List<LectureVO> stateLectureList(String state) throws Exception;

}
