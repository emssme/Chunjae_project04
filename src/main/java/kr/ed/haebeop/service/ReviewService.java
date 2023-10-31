package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.domain.ReviewVO;
import kr.ed.haebeop.util.LecturePage;

import java.util.List;

public interface ReviewService {

    public List<Review> reviewList(LecturePage page) throws Exception;
    public int starAvg(String lcode) throws Exception;
    public void reviewInsert(Review review) throws Exception;
    public int getCount(LecturePage page) throws Exception;
    public List<ReviewVO> randomReview() throws Exception;
}