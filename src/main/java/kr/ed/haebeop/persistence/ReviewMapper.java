package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.domain.ReviewVO;
import kr.ed.haebeop.util.LecturePage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReviewMapper {

    public List<Review> reviewList(LecturePage page) throws Exception;
    public int starAvg(String lcode) throws Exception;
    public void reviewInsert(Review review) throws Exception;
    public int getCount(LecturePage page) throws Exception;
    public List<ReviewVO> randomReview() throws Exception;

}