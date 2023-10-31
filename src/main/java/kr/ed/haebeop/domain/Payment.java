package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
    private int pno;
    private String title;
    private String lcode;
    private String bcode;
    private int tcode;
    private String id;
    private String method;
    private String com;
    private int price;
    private int dno;
    private String account;
    private String resdate;
}
