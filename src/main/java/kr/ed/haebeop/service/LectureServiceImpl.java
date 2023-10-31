package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.persistence.LectureMapper;
import kr.ed.haebeop.util.LecturePage;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LectureServiceImpl implements LectureService{
    @Autowired
    private LectureMapper lectureMapper;

    @Override
    public List<LectureVO> lastList() throws Exception {
        return lectureMapper.lastList();
    }

    @Override
    public List<LectureVO> newList() throws Exception {
        return lectureMapper.newList();
    }

    @Override
    public List<LectureVO> lectureList(LecturePage page) throws Exception {
        return lectureMapper.lectureList(page);
    }

    @Override
    public int getCount(LecturePage page) throws Exception {
        return lectureMapper.getCount(page);
    }

    @Override
    public LectureVO lectureDetail(String lcode) throws Exception {
        return lectureMapper.lectureDetail(lcode);
    }

    @Override
    public void lectureInsert(Lecture dto) throws Exception {
        lectureMapper.lectureInsert(dto);
    }

    @Override
    public void lectureEdit(Lecture dto) throws Exception {
        lectureMapper.lectureEdit(dto);
    }

    @Override
    public int lectureCount() throws Exception {
        return lectureMapper.lectureCount();
    }

    @Override
    public List<Subject> subjects() throws Exception {
        return lectureMapper.subjects();
    }

    @Override
    public boolean comparePeriod(String lcode) throws Exception {
        return lectureMapper.comparePeriod(lcode);
    }

    @Override
    public List<LectureVO> popularLectureList() throws Exception {
        return lectureMapper.popularLectureList();
    }

    @Override
    public List<LectureVO> stateLectureList(String state) throws Exception {
        return lectureMapper.stateLectureList(state);
    }
}
