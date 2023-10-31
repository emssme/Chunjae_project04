package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.util.CommunityPage;

import java.util.List;

public interface CommentPersistence {
    public List<Comment> commentList(CommunityPage page) throws Exception;
    public int getCount(int cno) throws Exception;
    public void commentInsert(Comment dto) throws Exception;
    public void communityDelete(int comNo) throws Exception;
}
