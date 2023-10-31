package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Fileboard;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface FileboardService {
    public void writeArticle(Fileboard FileboardDto) throws Exception;
    public void fileRegister(Fileboard FileboardDto) throws Exception;
    public List<Fileboard> fileList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public Fileboard fileDetail(int articleno) throws Exception;

    public void fileboardDelete(int articleno) throws Exception;
    public void fileboardEdit(Fileboard dto) throws Exception;
    public int recUpdate(int articeno) throws Exception;
}
