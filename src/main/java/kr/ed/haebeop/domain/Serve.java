package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Serve {
    private int sno;
    private int pno;
    private String bcode;
    private int sprice;
    private int amount;
    private String resdate;
}
