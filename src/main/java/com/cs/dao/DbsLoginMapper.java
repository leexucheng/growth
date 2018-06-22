package com.cs.dao;

import com.cs.model.DbsLogin;
import com.cs.model.DbsLoginExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DbsLoginMapper {
    int countByExample(DbsLoginExample example);

    int deleteByExample(DbsLoginExample example);

    int deleteByPrimaryKey(String loginId);

    int insert(DbsLogin record);

    int insertSelective(DbsLogin record);

    List<DbsLogin> selectByExample(DbsLoginExample example);

    DbsLogin selectByPrimaryKey(String loginId);
    
    DbsLogin selectByLoginName(String loginName);
    
    DbsLogin selectUniqueSysUser(String loginName);
    
    DbsLogin selectByUserCode(Integer userCode);

    int updateByExampleSelective(@Param("record") DbsLogin record, @Param("example") DbsLoginExample example);

    int updateByExample(@Param("record") DbsLogin record, @Param("example") DbsLoginExample example);

    int updateByPrimaryKeySelective(DbsLogin record);

    int updateByPrimaryKey(DbsLogin record);
    
    List<DbsLogin> login(DbsLogin info);
    
    int onlineCount(DbsLoginExample example);
}