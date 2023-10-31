package kr.ed.haebeop.service;



import kr.ed.haebeop.domain.Fileboard;
import kr.ed.haebeop.persistence.FileboardMapper;
import kr.ed.haebeop.persistence.FileinfoMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FileboardServiceImpl implements FileboardService {
    @Autowired
    private FileboardMapper fileboardMapper;
    @Autowired
    private FileinfoMapper fileinfoMapper;

    @Override
    @Transactional
    public void writeArticle(Fileboard fileboardDto) throws Exception {
        if(fileboardDto.getTitle() == null || fileboardDto.getContent() == null) {
            throw new Exception();
        }
        fileboardMapper.writeArticle(fileboardDto);
        fileboardMapper.fileRegister(fileboardDto);
    }

    @Override
    public void fileRegister(Fileboard fileboardDto) throws Exception {
        fileboardMapper.fileRegister(fileboardDto );
    }

    @Override
    public List<Fileboard> fileList(Page page) throws Exception {
        return  fileboardMapper.fileList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return fileboardMapper.getCount(page);
    }

    @Override
    @Transactional
    public Fileboard fileDetail(int articleno) throws Exception {
        fileboardMapper.visitedUpdate(articleno);
        return  fileboardMapper.fileDetail(articleno);
    }

    @Override
    public void fileboardDelete(int articleno) throws Exception {
        fileboardMapper.fileboardDelete(articleno);
    }

    @Transactional
    @Override
    public void fileboardEdit(Fileboard dto) throws Exception {
        fileboardMapper.fileboardEdit(dto);
        if(dto.getFileInfos().get(0).getSaveFolder() != null) {
            fileinfoMapper.fileInfoDelete(dto.getArticleno());
            fileinfoMapper.fileInfoInsert(dto);
        }
    }

    @Override
    public int recUpdate(int articeno) throws Exception {
        fileboardMapper.recUpdate(articeno);
        return articeno;
    }
}