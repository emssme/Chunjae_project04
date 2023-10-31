package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.domain.ReviewVO;
import kr.ed.haebeop.persistence.ReviewMapper;
import kr.ed.haebeop.util.LecturePage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public List<Review> reviewList(LecturePage page) throws Exception {
        return reviewMapper.reviewList(page);
    }

    @Override
    public int starAvg(String lcode) throws Exception {
        return reviewMapper.starAvg(lcode);
    }

    @Override
    public void reviewInsert(Review review) throws Exception {
        reviewMapper.reviewInsert(review);
    }

    @Override
    public int getCount(LecturePage page) throws Exception {
        return reviewMapper.getCount(page);
    }

    @Override
    public List<ReviewVO> randomReview() throws Exception {
        return reviewMapper.randomReview();
    }
}