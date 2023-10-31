package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileInfo;
import kr.ed.haebeop.persistence.FileinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileInfoServiceImpl implements FileInfoService {
    @Autowired
    private FileinfoMapper fileinfoMapper;

    @Override
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception {
        return fileinfoMapper.fileInfoDetail(articleno);
    }

    @Override
    public void fileInfoEdit(FileInfo dto) throws Exception {
        fileinfoMapper.fileInfoEdit(dto);
    }

    public List<FileInfo> fileInfoList(int articleno) throws Exception {
        return fileinfoMapper.fileInfoList(articleno);
    }
}
