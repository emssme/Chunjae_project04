package kr.ed.haebeop.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LecturePage extends Page{
    private String scode;
    private String lcode;
    private String id;
}
