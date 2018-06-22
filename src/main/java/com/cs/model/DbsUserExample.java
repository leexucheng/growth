package com.cs.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.cs.common.BaseCondition;

public class DbsUserExample extends BaseCondition{
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DbsUserExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(String value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(String value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(String value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(String value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(String value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLike(String value) {
            addCriterion("user_id like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotLike(String value) {
            addCriterion("user_id not like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<String> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<String> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(String value1, String value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(String value1, String value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andRealNameIsNull() {
            addCriterion("real_name is null");
            return (Criteria) this;
        }

        public Criteria andRealNameIsNotNull() {
            addCriterion("real_name is not null");
            return (Criteria) this;
        }

        public Criteria andRealNameEqualTo(String value) {
            addCriterion("real_name =", value, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameNotEqualTo(String value) {
            addCriterion("real_name <>", value, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameGreaterThan(String value) {
            addCriterion("real_name >", value, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameGreaterThanOrEqualTo(String value) {
            addCriterion("real_name >=", value, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameLessThan(String value) {
            addCriterion("real_name <", value, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameLessThanOrEqualTo(String value) {
            addCriterion("real_name <=", value, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameLike(String value) {
            addCriterion("real_name like", value, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameNotLike(String value) {
            addCriterion("real_name not like", value, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameIn(List<String> values) {
            addCriterion("real_name in", values, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameNotIn(List<String> values) {
            addCriterion("real_name not in", values, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameBetween(String value1, String value2) {
            addCriterion("real_name between", value1, value2, "realName");
            return (Criteria) this;
        }

        public Criteria andRealNameNotBetween(String value1, String value2) {
            addCriterion("real_name not between", value1, value2, "realName");
            return (Criteria) this;
        }

        public Criteria andNickNameIsNull() {
            addCriterion("nick_name is null");
            return (Criteria) this;
        }

        public Criteria andNickNameIsNotNull() {
            addCriterion("nick_name is not null");
            return (Criteria) this;
        }

        public Criteria andNickNameEqualTo(String value) {
            addCriterion("nick_name =", value, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameNotEqualTo(String value) {
            addCriterion("nick_name <>", value, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameGreaterThan(String value) {
            addCriterion("nick_name >", value, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameGreaterThanOrEqualTo(String value) {
            addCriterion("nick_name >=", value, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameLessThan(String value) {
            addCriterion("nick_name <", value, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameLessThanOrEqualTo(String value) {
            addCriterion("nick_name <=", value, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameLike(String value) {
            addCriterion("nick_name like", value, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameNotLike(String value) {
            addCriterion("nick_name not like", value, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameIn(List<String> values) {
            addCriterion("nick_name in", values, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameNotIn(List<String> values) {
            addCriterion("nick_name not in", values, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameBetween(String value1, String value2) {
            addCriterion("nick_name between", value1, value2, "nickName");
            return (Criteria) this;
        }

        public Criteria andNickNameNotBetween(String value1, String value2) {
            addCriterion("nick_name not between", value1, value2, "nickName");
            return (Criteria) this;
        }

        public Criteria andBirthdayIsNull() {
            addCriterion("birthday is null");
            return (Criteria) this;
        }

        public Criteria andBirthdayIsNotNull() {
            addCriterion("birthday is not null");
            return (Criteria) this;
        }

        public Criteria andBirthdayEqualTo(Date value) {
            addCriterionForJDBCDate("birthday =", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotEqualTo(Date value) {
            addCriterionForJDBCDate("birthday <>", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayGreaterThan(Date value) {
            addCriterionForJDBCDate("birthday >", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("birthday >=", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayLessThan(Date value) {
            addCriterionForJDBCDate("birthday <", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("birthday <=", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayIn(List<Date> values) {
            addCriterionForJDBCDate("birthday in", values, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotIn(List<Date> values) {
            addCriterionForJDBCDate("birthday not in", values, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("birthday between", value1, value2, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("birthday not between", value1, value2, "birthday");
            return (Criteria) this;
        }

        public Criteria andIdCardIsNull() {
            addCriterion("id_card is null");
            return (Criteria) this;
        }

        public Criteria andIdCardIsNotNull() {
            addCriterion("id_card is not null");
            return (Criteria) this;
        }

        public Criteria andIdCardEqualTo(String value) {
            addCriterion("id_card =", value, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardNotEqualTo(String value) {
            addCriterion("id_card <>", value, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardGreaterThan(String value) {
            addCriterion("id_card >", value, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardGreaterThanOrEqualTo(String value) {
            addCriterion("id_card >=", value, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardLessThan(String value) {
            addCriterion("id_card <", value, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardLessThanOrEqualTo(String value) {
            addCriterion("id_card <=", value, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardLike(String value) {
            addCriterion("id_card like", value, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardNotLike(String value) {
            addCriterion("id_card not like", value, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardIn(List<String> values) {
            addCriterion("id_card in", values, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardNotIn(List<String> values) {
            addCriterion("id_card not in", values, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardBetween(String value1, String value2) {
            addCriterion("id_card between", value1, value2, "idCard");
            return (Criteria) this;
        }

        public Criteria andIdCardNotBetween(String value1, String value2) {
            addCriterion("id_card not between", value1, value2, "idCard");
            return (Criteria) this;
        }

        public Criteria andCountryIsNull() {
            addCriterion("country is null");
            return (Criteria) this;
        }

        public Criteria andCountryIsNotNull() {
            addCriterion("country is not null");
            return (Criteria) this;
        }

        public Criteria andCountryEqualTo(String value) {
            addCriterion("country =", value, "country");
            return (Criteria) this;
        }

        public Criteria andCountryNotEqualTo(String value) {
            addCriterion("country <>", value, "country");
            return (Criteria) this;
        }

        public Criteria andCountryGreaterThan(String value) {
            addCriterion("country >", value, "country");
            return (Criteria) this;
        }

        public Criteria andCountryGreaterThanOrEqualTo(String value) {
            addCriterion("country >=", value, "country");
            return (Criteria) this;
        }

        public Criteria andCountryLessThan(String value) {
            addCriterion("country <", value, "country");
            return (Criteria) this;
        }

        public Criteria andCountryLessThanOrEqualTo(String value) {
            addCriterion("country <=", value, "country");
            return (Criteria) this;
        }

        public Criteria andCountryLike(String value) {
            addCriterion("country like", value, "country");
            return (Criteria) this;
        }

        public Criteria andCountryNotLike(String value) {
            addCriterion("country not like", value, "country");
            return (Criteria) this;
        }

        public Criteria andCountryIn(List<String> values) {
            addCriterion("country in", values, "country");
            return (Criteria) this;
        }

        public Criteria andCountryNotIn(List<String> values) {
            addCriterion("country not in", values, "country");
            return (Criteria) this;
        }

        public Criteria andCountryBetween(String value1, String value2) {
            addCriterion("country between", value1, value2, "country");
            return (Criteria) this;
        }

        public Criteria andCountryNotBetween(String value1, String value2) {
            addCriterion("country not between", value1, value2, "country");
            return (Criteria) this;
        }

        public Criteria andProvinceIsNull() {
            addCriterion("province is null");
            return (Criteria) this;
        }

        public Criteria andProvinceIsNotNull() {
            addCriterion("province is not null");
            return (Criteria) this;
        }

        public Criteria andProvinceEqualTo(String value) {
            addCriterion("province =", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceNotEqualTo(String value) {
            addCriterion("province <>", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceGreaterThan(String value) {
            addCriterion("province >", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceGreaterThanOrEqualTo(String value) {
            addCriterion("province >=", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceLessThan(String value) {
            addCriterion("province <", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceLessThanOrEqualTo(String value) {
            addCriterion("province <=", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceLike(String value) {
            addCriterion("province like", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceNotLike(String value) {
            addCriterion("province not like", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceIn(List<String> values) {
            addCriterion("province in", values, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceNotIn(List<String> values) {
            addCriterion("province not in", values, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceBetween(String value1, String value2) {
            addCriterion("province between", value1, value2, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceNotBetween(String value1, String value2) {
            addCriterion("province not between", value1, value2, "province");
            return (Criteria) this;
        }

        public Criteria andCityIsNull() {
            addCriterion("city is null");
            return (Criteria) this;
        }

        public Criteria andCityIsNotNull() {
            addCriterion("city is not null");
            return (Criteria) this;
        }

        public Criteria andCityEqualTo(String value) {
            addCriterion("city =", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotEqualTo(String value) {
            addCriterion("city <>", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityGreaterThan(String value) {
            addCriterion("city >", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityGreaterThanOrEqualTo(String value) {
            addCriterion("city >=", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLessThan(String value) {
            addCriterion("city <", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLessThanOrEqualTo(String value) {
            addCriterion("city <=", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLike(String value) {
            addCriterion("city like", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotLike(String value) {
            addCriterion("city not like", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityIn(List<String> values) {
            addCriterion("city in", values, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotIn(List<String> values) {
            addCriterion("city not in", values, "city");
            return (Criteria) this;
        }

        public Criteria andCityBetween(String value1, String value2) {
            addCriterion("city between", value1, value2, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotBetween(String value1, String value2) {
            addCriterion("city not between", value1, value2, "city");
            return (Criteria) this;
        }

        public Criteria andAreaIsNull() {
            addCriterion("area is null");
            return (Criteria) this;
        }

        public Criteria andAreaIsNotNull() {
            addCriterion("area is not null");
            return (Criteria) this;
        }

        public Criteria andAreaEqualTo(String value) {
            addCriterion("area =", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotEqualTo(String value) {
            addCriterion("area <>", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaGreaterThan(String value) {
            addCriterion("area >", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaGreaterThanOrEqualTo(String value) {
            addCriterion("area >=", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaLessThan(String value) {
            addCriterion("area <", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaLessThanOrEqualTo(String value) {
            addCriterion("area <=", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaLike(String value) {
            addCriterion("area like", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotLike(String value) {
            addCriterion("area not like", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaIn(List<String> values) {
            addCriterion("area in", values, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotIn(List<String> values) {
            addCriterion("area not in", values, "area");
            return (Criteria) this;
        }

        public Criteria andAreaBetween(String value1, String value2) {
            addCriterion("area between", value1, value2, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotBetween(String value1, String value2) {
            addCriterion("area not between", value1, value2, "area");
            return (Criteria) this;
        }

        public Criteria andIndustryIsNull() {
            addCriterion("industry is null");
            return (Criteria) this;
        }

        public Criteria andIndustryIsNotNull() {
            addCriterion("industry is not null");
            return (Criteria) this;
        }

        public Criteria andIndustryEqualTo(String value) {
            addCriterion("industry =", value, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryNotEqualTo(String value) {
            addCriterion("industry <>", value, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryGreaterThan(String value) {
            addCriterion("industry >", value, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryGreaterThanOrEqualTo(String value) {
            addCriterion("industry >=", value, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryLessThan(String value) {
            addCriterion("industry <", value, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryLessThanOrEqualTo(String value) {
            addCriterion("industry <=", value, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryLike(String value) {
            addCriterion("industry like", value, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryNotLike(String value) {
            addCriterion("industry not like", value, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryIn(List<String> values) {
            addCriterion("industry in", values, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryNotIn(List<String> values) {
            addCriterion("industry not in", values, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryBetween(String value1, String value2) {
            addCriterion("industry between", value1, value2, "industry");
            return (Criteria) this;
        }

        public Criteria andIndustryNotBetween(String value1, String value2) {
            addCriterion("industry not between", value1, value2, "industry");
            return (Criteria) this;
        }

        public Criteria andFavorTradeIsNull() {
            addCriterion("favor_trade is null");
            return (Criteria) this;
        }

        public Criteria andFavorTradeIsNotNull() {
            addCriterion("favor_trade is not null");
            return (Criteria) this;
        }

        public Criteria andFavorTradeEqualTo(String value) {
            addCriterion("favor_trade =", value, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeNotEqualTo(String value) {
            addCriterion("favor_trade <>", value, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeGreaterThan(String value) {
            addCriterion("favor_trade >", value, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeGreaterThanOrEqualTo(String value) {
            addCriterion("favor_trade >=", value, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeLessThan(String value) {
            addCriterion("favor_trade <", value, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeLessThanOrEqualTo(String value) {
            addCriterion("favor_trade <=", value, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeLike(String value) {
            addCriterion("favor_trade like", value, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeNotLike(String value) {
            addCriterion("favor_trade not like", value, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeIn(List<String> values) {
            addCriterion("favor_trade in", values, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeNotIn(List<String> values) {
            addCriterion("favor_trade not in", values, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeBetween(String value1, String value2) {
            addCriterion("favor_trade between", value1, value2, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andFavorTradeNotBetween(String value1, String value2) {
            addCriterion("favor_trade not between", value1, value2, "favorTrade");
            return (Criteria) this;
        }

        public Criteria andScoreIsNull() {
            addCriterion("score is null");
            return (Criteria) this;
        }

        public Criteria andScoreIsNotNull() {
            addCriterion("score is not null");
            return (Criteria) this;
        }

        public Criteria andScoreEqualTo(Integer value) {
            addCriterion("score =", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotEqualTo(Integer value) {
            addCriterion("score <>", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThan(Integer value) {
            addCriterion("score >", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("score >=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThan(Integer value) {
            addCriterion("score <", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThanOrEqualTo(Integer value) {
            addCriterion("score <=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreIn(List<Integer> values) {
            addCriterion("score in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotIn(List<Integer> values) {
            addCriterion("score not in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreBetween(Integer value1, Integer value2) {
            addCriterion("score between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("score not between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andSexIsNull() {
            addCriterion("sex is null");
            return (Criteria) this;
        }

        public Criteria andSexIsNotNull() {
            addCriterion("sex is not null");
            return (Criteria) this;
        }

        public Criteria andSexEqualTo(String value) {
            addCriterion("sex =", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotEqualTo(String value) {
            addCriterion("sex <>", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexGreaterThan(String value) {
            addCriterion("sex >", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexGreaterThanOrEqualTo(String value) {
            addCriterion("sex >=", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLessThan(String value) {
            addCriterion("sex <", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLessThanOrEqualTo(String value) {
            addCriterion("sex <=", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLike(String value) {
            addCriterion("sex like", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotLike(String value) {
            addCriterion("sex not like", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexIn(List<String> values) {
            addCriterion("sex in", values, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotIn(List<String> values) {
            addCriterion("sex not in", values, "sex");
            return (Criteria) this;
        }

        public Criteria andSexBetween(String value1, String value2) {
            addCriterion("sex between", value1, value2, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotBetween(String value1, String value2) {
            addCriterion("sex not between", value1, value2, "sex");
            return (Criteria) this;
        }

        public Criteria andIntroductionIsNull() {
            addCriterion("introduction is null");
            return (Criteria) this;
        }

        public Criteria andIntroductionIsNotNull() {
            addCriterion("introduction is not null");
            return (Criteria) this;
        }

        public Criteria andIntroductionEqualTo(String value) {
            addCriterion("introduction =", value, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionNotEqualTo(String value) {
            addCriterion("introduction <>", value, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionGreaterThan(String value) {
            addCriterion("introduction >", value, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionGreaterThanOrEqualTo(String value) {
            addCriterion("introduction >=", value, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionLessThan(String value) {
            addCriterion("introduction <", value, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionLessThanOrEqualTo(String value) {
            addCriterion("introduction <=", value, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionLike(String value) {
            addCriterion("introduction like", value, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionNotLike(String value) {
            addCriterion("introduction not like", value, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionIn(List<String> values) {
            addCriterion("introduction in", values, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionNotIn(List<String> values) {
            addCriterion("introduction not in", values, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionBetween(String value1, String value2) {
            addCriterion("introduction between", value1, value2, "introduction");
            return (Criteria) this;
        }

        public Criteria andIntroductionNotBetween(String value1, String value2) {
            addCriterion("introduction not between", value1, value2, "introduction");
            return (Criteria) this;
        }

        public Criteria andCorpNameIsNull() {
            addCriterion("corp_name is null");
            return (Criteria) this;
        }

        public Criteria andCorpNameIsNotNull() {
            addCriterion("corp_name is not null");
            return (Criteria) this;
        }

        public Criteria andCorpNameEqualTo(String value) {
            addCriterion("corp_name =", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameNotEqualTo(String value) {
            addCriterion("corp_name <>", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameGreaterThan(String value) {
            addCriterion("corp_name >", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameGreaterThanOrEqualTo(String value) {
            addCriterion("corp_name >=", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameLessThan(String value) {
            addCriterion("corp_name <", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameLessThanOrEqualTo(String value) {
            addCriterion("corp_name <=", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameLike(String value) {
            addCriterion("corp_name like", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameNotLike(String value) {
            addCriterion("corp_name not like", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameIn(List<String> values) {
            addCriterion("corp_name in", values, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameNotIn(List<String> values) {
            addCriterion("corp_name not in", values, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameBetween(String value1, String value2) {
            addCriterion("corp_name between", value1, value2, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameNotBetween(String value1, String value2) {
            addCriterion("corp_name not between", value1, value2, "corpName");
            return (Criteria) this;
        }

        public Criteria andMobileIsNull() {
            addCriterion("mobile is null");
            return (Criteria) this;
        }

        public Criteria andMobileIsNotNull() {
            addCriterion("mobile is not null");
            return (Criteria) this;
        }

        public Criteria andMobileEqualTo(String value) {
            addCriterion("mobile =", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotEqualTo(String value) {
            addCriterion("mobile <>", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileGreaterThan(String value) {
            addCriterion("mobile >", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileGreaterThanOrEqualTo(String value) {
            addCriterion("mobile >=", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLessThan(String value) {
            addCriterion("mobile <", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLessThanOrEqualTo(String value) {
            addCriterion("mobile <=", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLike(String value) {
            addCriterion("mobile like", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotLike(String value) {
            addCriterion("mobile not like", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileIn(List<String> values) {
            addCriterion("mobile in", values, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotIn(List<String> values) {
            addCriterion("mobile not in", values, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileBetween(String value1, String value2) {
            addCriterion("mobile between", value1, value2, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotBetween(String value1, String value2) {
            addCriterion("mobile not between", value1, value2, "mobile");
            return (Criteria) this;
        }

        public Criteria andEmailIsNull() {
            addCriterion("email is null");
            return (Criteria) this;
        }

        public Criteria andEmailIsNotNull() {
            addCriterion("email is not null");
            return (Criteria) this;
        }

        public Criteria andEmailEqualTo(String value) {
            addCriterion("email =", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotEqualTo(String value) {
            addCriterion("email <>", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThan(String value) {
            addCriterion("email >", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThanOrEqualTo(String value) {
            addCriterion("email >=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThan(String value) {
            addCriterion("email <", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThanOrEqualTo(String value) {
            addCriterion("email <=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLike(String value) {
            addCriterion("email like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotLike(String value) {
            addCriterion("email not like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailIn(List<String> values) {
            addCriterion("email in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotIn(List<String> values) {
            addCriterion("email not in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailBetween(String value1, String value2) {
            addCriterion("email between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotBetween(String value1, String value2) {
            addCriterion("email not between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andDbsDutyIsNull() {
            addCriterion("dbs_duty is null");
            return (Criteria) this;
        }

        public Criteria andDbsDutyIsNotNull() {
            addCriterion("dbs_duty is not null");
            return (Criteria) this;
        }

        public Criteria andDbsDutyEqualTo(String value) {
            addCriterion("dbs_duty =", value, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyNotEqualTo(String value) {
            addCriterion("dbs_duty <>", value, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyGreaterThan(String value) {
            addCriterion("dbs_duty >", value, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyGreaterThanOrEqualTo(String value) {
            addCriterion("dbs_duty >=", value, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyLessThan(String value) {
            addCriterion("dbs_duty <", value, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyLessThanOrEqualTo(String value) {
            addCriterion("dbs_duty <=", value, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyLike(String value) {
            addCriterion("dbs_duty like", value, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyNotLike(String value) {
            addCriterion("dbs_duty not like", value, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyIn(List<String> values) {
            addCriterion("dbs_duty in", values, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyNotIn(List<String> values) {
            addCriterion("dbs_duty not in", values, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyBetween(String value1, String value2) {
            addCriterion("dbs_duty between", value1, value2, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andDbsDutyNotBetween(String value1, String value2) {
            addCriterion("dbs_duty not between", value1, value2, "dbsDuty");
            return (Criteria) this;
        }

        public Criteria andBalanceIsNull() {
            addCriterion("balance is null");
            return (Criteria) this;
        }

        public Criteria andBalanceIsNotNull() {
            addCriterion("balance is not null");
            return (Criteria) this;
        }

        public Criteria andBalanceEqualTo(String value) {
            addCriterion("balance =", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceNotEqualTo(String value) {
            addCriterion("balance <>", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceGreaterThan(String value) {
            addCriterion("balance >", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceGreaterThanOrEqualTo(String value) {
            addCriterion("balance >=", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceLessThan(String value) {
            addCriterion("balance <", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceLessThanOrEqualTo(String value) {
            addCriterion("balance <=", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceLike(String value) {
            addCriterion("balance like", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceNotLike(String value) {
            addCriterion("balance not like", value, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceIn(List<String> values) {
            addCriterion("balance in", values, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceNotIn(List<String> values) {
            addCriterion("balance not in", values, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceBetween(String value1, String value2) {
            addCriterion("balance between", value1, value2, "balance");
            return (Criteria) this;
        }

        public Criteria andBalanceNotBetween(String value1, String value2) {
            addCriterion("balance not between", value1, value2, "balance");
            return (Criteria) this;
        }

        public Criteria andInviteCountIsNull() {
            addCriterion("invite_count is null");
            return (Criteria) this;
        }

        public Criteria andInviteCountIsNotNull() {
            addCriterion("invite_count is not null");
            return (Criteria) this;
        }

        public Criteria andInviteCountEqualTo(Integer value) {
            addCriterion("invite_count =", value, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountNotEqualTo(Integer value) {
            addCriterion("invite_count <>", value, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountGreaterThan(Integer value) {
            addCriterion("invite_count >", value, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("invite_count >=", value, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountLessThan(Integer value) {
            addCriterion("invite_count <", value, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountLessThanOrEqualTo(Integer value) {
            addCriterion("invite_count <=", value, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountIn(List<Integer> values) {
            addCriterion("invite_count in", values, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountNotIn(List<Integer> values) {
            addCriterion("invite_count not in", values, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountBetween(Integer value1, Integer value2) {
            addCriterion("invite_count between", value1, value2, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andInviteCountNotBetween(Integer value1, Integer value2) {
            addCriterion("invite_count not between", value1, value2, "inviteCount");
            return (Criteria) this;
        }

        public Criteria andCareerIsNull() {
            addCriterion("career is null");
            return (Criteria) this;
        }

        public Criteria andCareerIsNotNull() {
            addCriterion("career is not null");
            return (Criteria) this;
        }

        public Criteria andCareerEqualTo(String value) {
            addCriterion("career =", value, "career");
            return (Criteria) this;
        }

        public Criteria andCareerNotEqualTo(String value) {
            addCriterion("career <>", value, "career");
            return (Criteria) this;
        }

        public Criteria andCareerGreaterThan(String value) {
            addCriterion("career >", value, "career");
            return (Criteria) this;
        }

        public Criteria andCareerGreaterThanOrEqualTo(String value) {
            addCriterion("career >=", value, "career");
            return (Criteria) this;
        }

        public Criteria andCareerLessThan(String value) {
            addCriterion("career <", value, "career");
            return (Criteria) this;
        }

        public Criteria andCareerLessThanOrEqualTo(String value) {
            addCriterion("career <=", value, "career");
            return (Criteria) this;
        }

        public Criteria andCareerLike(String value) {
            addCriterion("career like", value, "career");
            return (Criteria) this;
        }

        public Criteria andCareerNotLike(String value) {
            addCriterion("career not like", value, "career");
            return (Criteria) this;
        }

        public Criteria andCareerIn(List<String> values) {
            addCriterion("career in", values, "career");
            return (Criteria) this;
        }

        public Criteria andCareerNotIn(List<String> values) {
            addCriterion("career not in", values, "career");
            return (Criteria) this;
        }

        public Criteria andCareerBetween(String value1, String value2) {
            addCriterion("career between", value1, value2, "career");
            return (Criteria) this;
        }

        public Criteria andCareerNotBetween(String value1, String value2) {
            addCriterion("career not between", value1, value2, "career");
            return (Criteria) this;
        }

        public Criteria andDbsCountIsNull() {
            addCriterion("dbs_count is null");
            return (Criteria) this;
        }

        public Criteria andDbsCountIsNotNull() {
            addCriterion("dbs_count is not null");
            return (Criteria) this;
        }

        public Criteria andDbsCountEqualTo(Integer value) {
            addCriterion("dbs_count =", value, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountNotEqualTo(Integer value) {
            addCriterion("dbs_count <>", value, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountGreaterThan(Integer value) {
            addCriterion("dbs_count >", value, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("dbs_count >=", value, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountLessThan(Integer value) {
            addCriterion("dbs_count <", value, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountLessThanOrEqualTo(Integer value) {
            addCriterion("dbs_count <=", value, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountIn(List<Integer> values) {
            addCriterion("dbs_count in", values, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountNotIn(List<Integer> values) {
            addCriterion("dbs_count not in", values, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountBetween(Integer value1, Integer value2) {
            addCriterion("dbs_count between", value1, value2, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsCountNotBetween(Integer value1, Integer value2) {
            addCriterion("dbs_count not between", value1, value2, "dbsCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountIsNull() {
            addCriterion("dbs_valid_count is null");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountIsNotNull() {
            addCriterion("dbs_valid_count is not null");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountEqualTo(Integer value) {
            addCriterion("dbs_valid_count =", value, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountNotEqualTo(Integer value) {
            addCriterion("dbs_valid_count <>", value, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountGreaterThan(Integer value) {
            addCriterion("dbs_valid_count >", value, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("dbs_valid_count >=", value, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountLessThan(Integer value) {
            addCriterion("dbs_valid_count <", value, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountLessThanOrEqualTo(Integer value) {
            addCriterion("dbs_valid_count <=", value, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountIn(List<Integer> values) {
            addCriterion("dbs_valid_count in", values, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountNotIn(List<Integer> values) {
            addCriterion("dbs_valid_count not in", values, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountBetween(Integer value1, Integer value2) {
            addCriterion("dbs_valid_count between", value1, value2, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andDbsValidCountNotBetween(Integer value1, Integer value2) {
            addCriterion("dbs_valid_count not between", value1, value2, "dbsValidCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountIsNull() {
            addCriterion("be_complaind_count is null");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountIsNotNull() {
            addCriterion("be_complaind_count is not null");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountEqualTo(Integer value) {
            addCriterion("be_complaind_count =", value, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountNotEqualTo(Integer value) {
            addCriterion("be_complaind_count <>", value, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountGreaterThan(Integer value) {
            addCriterion("be_complaind_count >", value, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("be_complaind_count >=", value, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountLessThan(Integer value) {
            addCriterion("be_complaind_count <", value, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountLessThanOrEqualTo(Integer value) {
            addCriterion("be_complaind_count <=", value, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountIn(List<Integer> values) {
            addCriterion("be_complaind_count in", values, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountNotIn(List<Integer> values) {
            addCriterion("be_complaind_count not in", values, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountBetween(Integer value1, Integer value2) {
            addCriterion("be_complaind_count between", value1, value2, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andBeComplaindCountNotBetween(Integer value1, Integer value2) {
            addCriterion("be_complaind_count not between", value1, value2, "beComplaindCount");
            return (Criteria) this;
        }

        public Criteria andUserCodeIsNull() {
            addCriterion("user_code is null");
            return (Criteria) this;
        }

        public Criteria andUserCodeIsNotNull() {
            addCriterion("user_code is not null");
            return (Criteria) this;
        }

        public Criteria andUserCodeEqualTo(String value) {
            addCriterion("user_code =", value, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeNotEqualTo(String value) {
            addCriterion("user_code <>", value, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeGreaterThan(String value) {
            addCriterion("user_code >", value, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeGreaterThanOrEqualTo(String value) {
            addCriterion("user_code >=", value, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeLessThan(String value) {
            addCriterion("user_code <", value, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeLessThanOrEqualTo(String value) {
            addCriterion("user_code <=", value, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeLike(String value) {
            addCriterion("user_code like", value, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeNotLike(String value) {
            addCriterion("user_code not like", value, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeIn(List<String> values) {
            addCriterion("user_code in", values, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeNotIn(List<String> values) {
            addCriterion("user_code not in", values, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeBetween(String value1, String value2) {
            addCriterion("user_code between", value1, value2, "userCode");
            return (Criteria) this;
        }

        public Criteria andUserCodeNotBetween(String value1, String value2) {
            addCriterion("user_code not between", value1, value2, "userCode");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalIsNull() {
            addCriterion("is_professional is null");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalIsNotNull() {
            addCriterion("is_professional is not null");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalEqualTo(String value) {
            addCriterion("is_professional =", value, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalNotEqualTo(String value) {
            addCriterion("is_professional <>", value, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalGreaterThan(String value) {
            addCriterion("is_professional >", value, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalGreaterThanOrEqualTo(String value) {
            addCriterion("is_professional >=", value, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalLessThan(String value) {
            addCriterion("is_professional <", value, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalLessThanOrEqualTo(String value) {
            addCriterion("is_professional <=", value, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalLike(String value) {
            addCriterion("is_professional like", value, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalNotLike(String value) {
            addCriterion("is_professional not like", value, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalIn(List<String> values) {
            addCriterion("is_professional in", values, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalNotIn(List<String> values) {
            addCriterion("is_professional not in", values, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalBetween(String value1, String value2) {
            addCriterion("is_professional between", value1, value2, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsProfessionalNotBetween(String value1, String value2) {
            addCriterion("is_professional not between", value1, value2, "isProfessional");
            return (Criteria) this;
        }

        public Criteria andIsExpertIsNull() {
            addCriterion("is_expert is null");
            return (Criteria) this;
        }

        public Criteria andIsExpertIsNotNull() {
            addCriterion("is_expert is not null");
            return (Criteria) this;
        }

        public Criteria andIsExpertEqualTo(String value) {
            addCriterion("is_expert =", value, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertNotEqualTo(String value) {
            addCriterion("is_expert <>", value, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertGreaterThan(String value) {
            addCriterion("is_expert >", value, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertGreaterThanOrEqualTo(String value) {
            addCriterion("is_expert >=", value, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertLessThan(String value) {
            addCriterion("is_expert <", value, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertLessThanOrEqualTo(String value) {
            addCriterion("is_expert <=", value, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertLike(String value) {
            addCriterion("is_expert like", value, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertNotLike(String value) {
            addCriterion("is_expert not like", value, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertIn(List<String> values) {
            addCriterion("is_expert in", values, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertNotIn(List<String> values) {
            addCriterion("is_expert not in", values, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertBetween(String value1, String value2) {
            addCriterion("is_expert between", value1, value2, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsExpertNotBetween(String value1, String value2) {
            addCriterion("is_expert not between", value1, value2, "isExpert");
            return (Criteria) this;
        }

        public Criteria andIsJudgerIsNull() {
            addCriterion("is_judger is null");
            return (Criteria) this;
        }

        public Criteria andIsJudgerIsNotNull() {
            addCriterion("is_judger is not null");
            return (Criteria) this;
        }

        public Criteria andIsJudgerEqualTo(String value) {
            addCriterion("is_judger =", value, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerNotEqualTo(String value) {
            addCriterion("is_judger <>", value, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerGreaterThan(String value) {
            addCriterion("is_judger >", value, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerGreaterThanOrEqualTo(String value) {
            addCriterion("is_judger >=", value, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerLessThan(String value) {
            addCriterion("is_judger <", value, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerLessThanOrEqualTo(String value) {
            addCriterion("is_judger <=", value, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerLike(String value) {
            addCriterion("is_judger like", value, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerNotLike(String value) {
            addCriterion("is_judger not like", value, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerIn(List<String> values) {
            addCriterion("is_judger in", values, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerNotIn(List<String> values) {
            addCriterion("is_judger not in", values, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerBetween(String value1, String value2) {
            addCriterion("is_judger between", value1, value2, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsJudgerNotBetween(String value1, String value2) {
            addCriterion("is_judger not between", value1, value2, "isJudger");
            return (Criteria) this;
        }

        public Criteria andIsCorpIsNull() {
            addCriterion("is_corp is null");
            return (Criteria) this;
        }

        public Criteria andIsCorpIsNotNull() {
            addCriterion("is_corp is not null");
            return (Criteria) this;
        }

        public Criteria andIsCorpEqualTo(String value) {
            addCriterion("is_corp =", value, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpNotEqualTo(String value) {
            addCriterion("is_corp <>", value, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpGreaterThan(String value) {
            addCriterion("is_corp >", value, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpGreaterThanOrEqualTo(String value) {
            addCriterion("is_corp >=", value, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpLessThan(String value) {
            addCriterion("is_corp <", value, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpLessThanOrEqualTo(String value) {
            addCriterion("is_corp <=", value, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpLike(String value) {
            addCriterion("is_corp like", value, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpNotLike(String value) {
            addCriterion("is_corp not like", value, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpIn(List<String> values) {
            addCriterion("is_corp in", values, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpNotIn(List<String> values) {
            addCriterion("is_corp not in", values, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpBetween(String value1, String value2) {
            addCriterion("is_corp between", value1, value2, "isCorp");
            return (Criteria) this;
        }

        public Criteria andIsCorpNotBetween(String value1, String value2) {
            addCriterion("is_corp not between", value1, value2, "isCorp");
            return (Criteria) this;
        }

        public Criteria andHeadImgIsNull() {
            addCriterion("head_img is null");
            return (Criteria) this;
        }

        public Criteria andHeadImgIsNotNull() {
            addCriterion("head_img is not null");
            return (Criteria) this;
        }

        public Criteria andHeadImgEqualTo(String value) {
            addCriterion("head_img =", value, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgNotEqualTo(String value) {
            addCriterion("head_img <>", value, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgGreaterThan(String value) {
            addCriterion("head_img >", value, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgGreaterThanOrEqualTo(String value) {
            addCriterion("head_img >=", value, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgLessThan(String value) {
            addCriterion("head_img <", value, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgLessThanOrEqualTo(String value) {
            addCriterion("head_img <=", value, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgLike(String value) {
            addCriterion("head_img like", value, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgNotLike(String value) {
            addCriterion("head_img not like", value, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgIn(List<String> values) {
            addCriterion("head_img in", values, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgNotIn(List<String> values) {
            addCriterion("head_img not in", values, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgBetween(String value1, String value2) {
            addCriterion("head_img between", value1, value2, "headImg");
            return (Criteria) this;
        }

        public Criteria andHeadImgNotBetween(String value1, String value2) {
            addCriterion("head_img not between", value1, value2, "headImg");
            return (Criteria) this;
        }

        public Criteria andCostIsNull() {
            addCriterion("cost is null");
            return (Criteria) this;
        }

        public Criteria andCostIsNotNull() {
            addCriterion("cost is not null");
            return (Criteria) this;
        }

        public Criteria andCostEqualTo(String value) {
            addCriterion("cost =", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotEqualTo(String value) {
            addCriterion("cost <>", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostGreaterThan(String value) {
            addCriterion("cost >", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostGreaterThanOrEqualTo(String value) {
            addCriterion("cost >=", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLessThan(String value) {
            addCriterion("cost <", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLessThanOrEqualTo(String value) {
            addCriterion("cost <=", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLike(String value) {
            addCriterion("cost like", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotLike(String value) {
            addCriterion("cost not like", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostIn(List<String> values) {
            addCriterion("cost in", values, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotIn(List<String> values) {
            addCriterion("cost not in", values, "cost");
            return (Criteria) this;
        }

        public Criteria andCostBetween(String value1, String value2) {
            addCriterion("cost between", value1, value2, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotBetween(String value1, String value2) {
            addCriterion("cost not between", value1, value2, "cost");
            return (Criteria) this;
        }

        public Criteria andCertificateImgIsNull() {
            addCriterion("certificate_img is null");
            return (Criteria) this;
        }

        public Criteria andCertificateImgIsNotNull() {
            addCriterion("certificate_img is not null");
            return (Criteria) this;
        }

        public Criteria andCertificateImgEqualTo(String value) {
            addCriterion("certificate_img =", value, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgNotEqualTo(String value) {
            addCriterion("certificate_img <>", value, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgGreaterThan(String value) {
            addCriterion("certificate_img >", value, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgGreaterThanOrEqualTo(String value) {
            addCriterion("certificate_img >=", value, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgLessThan(String value) {
            addCriterion("certificate_img <", value, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgLessThanOrEqualTo(String value) {
            addCriterion("certificate_img <=", value, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgLike(String value) {
            addCriterion("certificate_img like", value, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgNotLike(String value) {
            addCriterion("certificate_img not like", value, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgIn(List<String> values) {
            addCriterion("certificate_img in", values, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgNotIn(List<String> values) {
            addCriterion("certificate_img not in", values, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgBetween(String value1, String value2) {
            addCriterion("certificate_img between", value1, value2, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCertificateImgNotBetween(String value1, String value2) {
            addCriterion("certificate_img not between", value1, value2, "certificateImg");
            return (Criteria) this;
        }

        public Criteria andCardImg1IsNull() {
            addCriterion("card_img1 is null");
            return (Criteria) this;
        }

        public Criteria andCardImg1IsNotNull() {
            addCriterion("card_img1 is not null");
            return (Criteria) this;
        }

        public Criteria andCardImg1EqualTo(String value) {
            addCriterion("card_img1 =", value, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1NotEqualTo(String value) {
            addCriterion("card_img1 <>", value, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1GreaterThan(String value) {
            addCriterion("card_img1 >", value, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1GreaterThanOrEqualTo(String value) {
            addCriterion("card_img1 >=", value, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1LessThan(String value) {
            addCriterion("card_img1 <", value, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1LessThanOrEqualTo(String value) {
            addCriterion("card_img1 <=", value, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1Like(String value) {
            addCriterion("card_img1 like", value, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1NotLike(String value) {
            addCriterion("card_img1 not like", value, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1In(List<String> values) {
            addCriterion("card_img1 in", values, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1NotIn(List<String> values) {
            addCriterion("card_img1 not in", values, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1Between(String value1, String value2) {
            addCriterion("card_img1 between", value1, value2, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg1NotBetween(String value1, String value2) {
            addCriterion("card_img1 not between", value1, value2, "cardImg1");
            return (Criteria) this;
        }

        public Criteria andCardImg2IsNull() {
            addCriterion("card_img2 is null");
            return (Criteria) this;
        }

        public Criteria andCardImg2IsNotNull() {
            addCriterion("card_img2 is not null");
            return (Criteria) this;
        }

        public Criteria andCardImg2EqualTo(String value) {
            addCriterion("card_img2 =", value, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2NotEqualTo(String value) {
            addCriterion("card_img2 <>", value, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2GreaterThan(String value) {
            addCriterion("card_img2 >", value, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2GreaterThanOrEqualTo(String value) {
            addCriterion("card_img2 >=", value, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2LessThan(String value) {
            addCriterion("card_img2 <", value, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2LessThanOrEqualTo(String value) {
            addCriterion("card_img2 <=", value, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2Like(String value) {
            addCriterion("card_img2 like", value, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2NotLike(String value) {
            addCriterion("card_img2 not like", value, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2In(List<String> values) {
            addCriterion("card_img2 in", values, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2NotIn(List<String> values) {
            addCriterion("card_img2 not in", values, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2Between(String value1, String value2) {
            addCriterion("card_img2 between", value1, value2, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCardImg2NotBetween(String value1, String value2) {
            addCriterion("card_img2 not between", value1, value2, "cardImg2");
            return (Criteria) this;
        }

        public Criteria andCorpImgIsNull() {
            addCriterion("corp_img is null");
            return (Criteria) this;
        }

        public Criteria andCorpImgIsNotNull() {
            addCriterion("corp_img is not null");
            return (Criteria) this;
        }

        public Criteria andCorpImgEqualTo(String value) {
            addCriterion("corp_img =", value, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgNotEqualTo(String value) {
            addCriterion("corp_img <>", value, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgGreaterThan(String value) {
            addCriterion("corp_img >", value, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgGreaterThanOrEqualTo(String value) {
            addCriterion("corp_img >=", value, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgLessThan(String value) {
            addCriterion("corp_img <", value, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgLessThanOrEqualTo(String value) {
            addCriterion("corp_img <=", value, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgLike(String value) {
            addCriterion("corp_img like", value, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgNotLike(String value) {
            addCriterion("corp_img not like", value, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgIn(List<String> values) {
            addCriterion("corp_img in", values, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgNotIn(List<String> values) {
            addCriterion("corp_img not in", values, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgBetween(String value1, String value2) {
            addCriterion("corp_img between", value1, value2, "corpImg");
            return (Criteria) this;
        }

        public Criteria andCorpImgNotBetween(String value1, String value2) {
            addCriterion("corp_img not between", value1, value2, "corpImg");
            return (Criteria) this;
        }
        
        public Criteria andParentCodeEqualTo(String value) {
            addCriterion("parent_code =", value, "parentCode");
            return (Criteria) this;
        }
        
        public Criteria andIsCheckedEqualTo(String value) {
            addCriterion("is_checked =", value, "isChecked");
            return (Criteria) this;
        }
        
        public Criteria andIsCheckedIsNullOrEqualZero() {
        	addCriterion("(is_checked = 0 or is_checked is null)");
        	return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}