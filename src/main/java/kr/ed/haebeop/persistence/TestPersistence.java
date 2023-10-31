package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Test;

import java.util.List;

public interface TestPersistence {
    public List<Test> testList() throws Exception;
}
