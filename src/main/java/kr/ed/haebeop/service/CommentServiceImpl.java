package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.persistence.CommentPersistence;
import kr.ed.haebeop.util.CommunityPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentPersistence commentPersistence;

    @Override
    public List<Comment> commentList(CommunityPage page) throws Exception {
        return commentPersistence.commentList(page);
    }

    @Override
    public int getCount(int cno) throws Exception {
        return commentPersistence.getCount(cno);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        commentPersistence.commentInsert(dto);
    }

    @Override
    public void communityDelete(int comNo) throws Exception {
        commentPersistence.communityDelete(comNo);
    }
}
