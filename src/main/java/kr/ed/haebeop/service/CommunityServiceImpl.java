package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Community;
import kr.ed.haebeop.domain.CommunityVO;
import kr.ed.haebeop.persistence.CommunityPersistence;
import kr.ed.haebeop.util.CommunityPage;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityServiceImpl implements CommunityService{
    @Autowired
    private CommunityPersistence communityPersistence;

    @Override
    public List<CommunityVO> communityList(CommunityPage page) throws Exception {
        return communityPersistence.communityList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return communityPersistence.getCount(page);
    }

    @Override
    public List<Category> categoryList() throws Exception {
        return communityPersistence.categeryList();
    }

    @Override
    public CommunityVO communityDetail(int cno) throws Exception {
        return communityPersistence.communityDetail(cno);
    }

    @Override
    public void communityInsert(Community dto) throws Exception {
        communityPersistence.communityInsert(dto);
    }

    @Override
    public void communityDelete(int cno) throws Exception {
        communityPersistence.communityDelete(cno);
    }

    @Override
    public void communityEdit(Community dto) throws Exception {
        communityPersistence.communityEdit(dto);
    }

    @Override
    public int communityCnt() throws Exception {
        return communityPersistence.communityCnt();
    }
    
}
