package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Community;
import kr.ed.haebeop.domain.CommunityVO;
import kr.ed.haebeop.util.CommunityPage;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface CommunityService {
    public List<CommunityVO> communityList(CommunityPage page) throws Exception;
    public List<Category> categoryList() throws Exception;
    public int getCount(Page page) throws Exception;
    public CommunityVO communityDetail(int cno) throws Exception;
    public void communityInsert(Community dto) throws Exception;
    public void communityDelete(int cno) throws Exception;
    public void communityEdit(Community dto) throws Exception;
    public int communityCnt() throws Exception;
}
