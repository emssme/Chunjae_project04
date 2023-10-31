package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
    private int rno;
    private String lcode;
    private String id;
    private int star;
    private String content;
    private String resdate;
}
