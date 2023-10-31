package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.FileInfo;
import kr.ed.haebeop.domain.Fileboard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileinfoMapper {
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception;
    public void fileInfoEdit(FileInfo dto) throws Exception;
    public List<FileInfo> fileInfoList(int articleno) throws Exception;
    public void fileInfoInsert(Fileboard fileboard) throws Exception;
    public void fileInfoDelete(int articleno) throws Exception;
}
