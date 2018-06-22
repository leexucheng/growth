package com.cs.common;

public class ErrorCode {
	/**
	 * 用户不存在
	 */
	public static final String ACCOUNT_NOT_EXIST = "0001";
	/**
	 * 存在多个相同帐号用户
	 */
	public static final String ACCOUN_TDUPLICATE = "0002";
	/**
	 * 用户已被注册
	 */
	public static final String ACCOUNT_BE_USERD = "0003";
	/**
	 * 数据更新失败
	 */
	public static final String UPDATE_FAILTURE = "0004";
	/**
	 * 信息缺失
	 */
	public static final String MISS_INFO = "0005";
	/**
	 * 上传失败
	 */
	public static final String UPLOAD_FAILD = "0006";
	
	/**
	 *  保存失败
	 */
	public static final String SAVE_FAILD = "0007";
	
	/**
	 * 移动APP端TOKEN无效
	 */
	public static final String TOKEN_INVALID = "0008";
	
	/**
	 * 重复的操作
	 */
	public static final String DUPLICATE_OPERATION = "0009";
	
	/**
	 * 已被指派
	 */
	public static final String BE_ASSIGND = "0010";
	
	/**
	 * 无此数据
	 */
	public static final String DATA_NOT_FOUND = "0011";
	
	/**
	 * 超出上限
	 */
	public static final String MAX_LIMIT = "0012";
	
	
	/**
	 * 密码错误
	 */
	public static final String PASSWORD_INVALID = "0013";
	
	/**
	 * 不允许的业务逻辑
	 */
	public static final String NOT_ALLOWED_LOGIC = "0014";
	
	/**
	 * 余额不足
	 */
	public static final String BALANCE_NOT_ENOUGH = "0015";
	
	/**
	 * 验证码不正确
	 */
	public static final String CODE_INCORRECT = "0016";
	
	
}