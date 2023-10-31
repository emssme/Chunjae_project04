package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudyInfo {
    private int scode;
    private int ccode;
    private String id;
    private Double studyTime;
    private Boolean completed;
}
