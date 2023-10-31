package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Community;
import kr.ed.haebeop.domain.CommunityVO;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface CommunityPersistence {
    public List<CommunityVO> communityList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public List<Category> categeryList() throws Exception;
    public CommunityVO communityDetail(int cno) throws Exception;
    public void communityInsert(Community dto) throws Exception;
    public void communityDelete(int cno) throws Exception;
    public void communityEdit(Community dto) throws Exception;
    public int communityCnt() throws Exception;
}
