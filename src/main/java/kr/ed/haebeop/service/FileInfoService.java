package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileInfo;

import java.util.List;

public interface FileInfoService {
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception;
    public void fileInfoEdit(FileInfo dto) throws Exception;
    public List<FileInfo> fileInfoList(int articleno) throws Exception;
}
