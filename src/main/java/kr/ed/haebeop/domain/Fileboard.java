package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Fileboard {
    private int articleno;
    private String id;
    private String title;
    private String content;
    private String regdate;
    private int visited;
    private int rec;
    private List<FileInfo> fileInfos;
}
