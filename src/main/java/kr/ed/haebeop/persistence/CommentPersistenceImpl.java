package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.util.CommunityPage;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentPersistenceImpl implements CommentPersistence{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Comment> commentList(CommunityPage page) throws Exception {
        return sqlSession.selectList("comment.commentList", page);
    }

    @Override
    public int getCount(int cno) throws Exception {
        return sqlSession.selectOne("comment.getCount", cno);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        sqlSession.insert("comment.commentInsert", dto);
    }

    @Override
    public void communityDelete(int comNo) throws Exception {
        sqlSession.delete("comment.commentDelete", comNo);
    }
}
