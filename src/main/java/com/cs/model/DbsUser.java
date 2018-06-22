package com.cs.model;

import java.util.Date;

public class DbsUser {
    private String userId;

    private String realName;

    private String nickName;

    private Date birthday;

    private String idCard;

    private String country;

    private String province;

    private String city;

    private String area;

    private String industry;

    private String favorTrade;

    private Integer score;

    private String sex;

    private String introduction;

    private String corpName;

    private String mobile;

    private String email;

    private String dbsDuty;

    private String balance;

    private Integer inviteCount;

    private String career;

    private Integer dbsCount;
    
    private Integer dbsAskCount;

	private Integer dbsValidCount;
	
	private Double dbsSucRate;

    private Integer beComplaindCount;

    private String userCode;

    private String isProfessional;

    private String isExpert;

    private String isJudger;

    private String isCorp;

    private String headImg;

    private String cost;

    private String certificateImg;

    private String cardImg1;

    private String cardImg2;

    private String corpImg;
    
    private String parentCode;
    
    private Integer favor;
    
    private Integer hate;
    
    private String isChecked;
    
    private String checkAdvice;
    
    private Date createTime;
    

	public Integer getDbsAskCount() {
		return dbsAskCount;
	}

	public void setDbsAskCount(Integer dbsAskCount) {
		this.dbsAskCount = dbsAskCount;
	}
    
	public Double getDbsSucRate() {
		return dbsSucRate;
	}

	public void setDbsSucRate(Double dbsSucRate) {
		this.dbsSucRate = dbsSucRate;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCheckAdvice() {
		return checkAdvice;
	}

	public void setCheckAdvice(String checkAdvice) {
		this.checkAdvice = checkAdvice;
	}

	public String getIsChecked() {
		return isChecked;
	}

	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}

	public Integer getFavor() {
		return favor;
	}

	public void setFavor(Integer favor) {
		this.favor = favor;
	}

	public Integer getHate() {
		return hate;
	}

	public void setHate(Integer hate) {
		this.hate = hate;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName == null ? null : nickName.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard == null ? null : idCard.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry == null ? null : industry.trim();
    }

    public String getFavorTrade() {
        return favorTrade;
    }

    public void setFavorTrade(String favorTrade) {
        this.favorTrade = favorTrade == null ? null : favorTrade.trim();
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getCorpName() {
        return corpName;
    }

    public void setCorpName(String corpName) {
        this.corpName = corpName == null ? null : corpName.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getDbsDuty() {
        return dbsDuty;
    }

    public void setDbsDuty(String dbsDuty) {
        this.dbsDuty = dbsDuty == null ? null : dbsDuty.trim();
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance == null ? null : balance.trim();
    }

    public Integer getInviteCount() {
        return inviteCount;
    }

    public void setInviteCount(Integer inviteCount) {
        this.inviteCount = inviteCount;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career == null ? null : career.trim();
    }

    public Integer getDbsCount() {
        return dbsCount;
    }

    public void setDbsCount(Integer dbsCount) {
        this.dbsCount = dbsCount;
    }

    public Integer getDbsValidCount() {
        return dbsValidCount;
    }

    public void setDbsValidCount(Integer dbsValidCount) {
        this.dbsValidCount = dbsValidCount;
    }

    public Integer getBeComplaindCount() {
        return beComplaindCount;
    }

    public void setBeComplaindCount(Integer beComplaindCount) {
        this.beComplaindCount = beComplaindCount;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode == null ? null : userCode.trim();
    }

    public String getIsProfessional() {
        return isProfessional;
    }

    public void setIsProfessional(String isProfessional) {
        this.isProfessional = isProfessional == null ? null : isProfessional.trim();
    }

    public String getIsExpert() {
        return isExpert;
    }

    public void setIsExpert(String isExpert) {
        this.isExpert = isExpert == null ? null : isExpert.trim();
    }

    public String getIsJudger() {
        return isJudger;
    }

    public void setIsJudger(String isJudger) {
        this.isJudger = isJudger == null ? null : isJudger.trim();
    }

    public String getIsCorp() {
        return isCorp;
    }

    public void setIsCorp(String isCorp) {
        this.isCorp = isCorp == null ? null : isCorp.trim();
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg == null ? null : headImg.trim();
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost == null ? null : cost.trim();
    }

    public String getCertificateImg() {
        return certificateImg;
    }

    public void setCertificateImg(String certificateImg) {
        this.certificateImg = certificateImg == null ? null : certificateImg.trim();
    }

    public String getCardImg1() {
        return cardImg1;
    }

    public void setCardImg1(String cardImg1) {
        this.cardImg1 = cardImg1 == null ? null : cardImg1.trim();
    }

    public String getCardImg2() {
        return cardImg2;
    }

    public void setCardImg2(String cardImg2) {
        this.cardImg2 = cardImg2 == null ? null : cardImg2.trim();
    }

    public String getCorpImg() {
        return corpImg;
    }

    public void setCorpImg(String corpImg) {
        this.corpImg = corpImg == null ? null : corpImg.trim();
    }
}