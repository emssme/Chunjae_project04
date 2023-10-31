package kr.ed.haebeop.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityPage extends Page{
    private String category;            // 커뮤니티 페이징 시 필요
    private int cno;                    // 댓글 페이징 시 필요
}
