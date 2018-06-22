package com.cs.dao;

import com.cs.model.DbsUser;
import com.cs.model.DbsUserExample;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

public interface DbsUserMapper {
    int countByExample(DbsUserExample example);

    int deleteByExample(DbsUserExample example);

    int deleteByPrimaryKey(String userId);

    int insert(DbsUser record);

    int insertSelective(DbsUser record);

    List<DbsUser> selectByExample(DbsUserExample example);

    DbsUser selectByPrimaryKey(String userId);
    
    DbsUser selectByUserCode(String userCode);

    int updateByExampleSelective(@Param("record") DbsUser record, @Param("example") DbsUserExample example);

    int updateByExample(@Param("record") DbsUser record, @Param("example") DbsUserExample example);

    int updateByPrimaryKeySelective(DbsUser record);

    int updateByPrimaryKey(DbsUser record);
    
    List<Map<String,Object>> selectUserListByPager(Map<String,Object> map);
    
    Map<String,Object> selectParentsByUserCode(String userCode);
    
    DbsUser selectParentDataByUserCode(String userCode);
    
    Map<String,Object> selectUserScoreRank(String userCode);
    
    List<String> selectUserCode(DbsUserExample example);
    
    List<DbsUser> selectByCondition(Map<String,Object> map);
    
    Integer countByCondition(Map<String,Object> map);
    
    //���˴���, �񽱴���, ��������, ���˳ɹ���, ��������
    List<Map<String, Object>> topTen(Map<String,Object> map);
    
    //��ԵȦ����
    List<Map<String, Object>> topTenPop();
    
    //�ͽ�����
    List<Map<String, Object>> topTenWealth();
    
    //�����˴���, �񽱴���, ��������, ���˳ɹ���, ����ȡ����
    Integer ranking(Map<String, Object> map);
    
    //�˾�Ȧ����
    Integer rankingPop(String userCode);
    
    //׬ȡӶ������
    Integer rankingWealth(String userCode);
}