package com.cs.common;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class WeixinUtil {

	/**
	 * 统一下单URL
	 */
	public static final String UNIFIEDORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	
	/**
	 * 商户KEY
	 */
//	public static final String MCH_KEY = "wx3701bcd1ff98b73eDBS123456789AB";
	public static final String MCH_KEY = "wx3701bcd1ff98b73eDBS123456789AC";
	
	/**
	 * APP ID
	 */
 //	public static final String APP_ID = "wx3701bcd1ff98b73e";
	public static final String APP_ID = "wxdf0503f3f3aaadb2";
	
	/**
	 * 商户 号
	 */
//	public static final String PARTNER_ID = "1492843542";
	public static final String PARTNER_ID = "1496654692";
	
	/**
	 * 生成签名
	 * @param map
	 * @return
	 */
	public static String generateSign(Map<String,Object> map){
		List<String> list = new ArrayList<String>(map.keySet());
		Collections.sort(list);
		
		StringBuilder stringA = new StringBuilder("");
		for(String key:list){
			if(stringA.length() > 0){
				stringA.append("&");
			}
			stringA.append(key+"="+map.get(key));
		}
		
		String stringSignTemp = stringA + "&key="+WeixinUtil.MCH_KEY;
		
		return AppUtil.encodeMD5(stringSignTemp).toUpperCase();
		
	}
	
	 /**
     * POST请求获取数据
     */
    public static String doPost(String path,String data){
        URL url = null;
        try {
            url = new URL(path);
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("POST");// 提交模式
            // conn.setConnectTimeout(10000);//连接超时 单位毫秒
            // conn.setReadTimeout(2000);//读取超时 单位毫秒
            // 发送POST请求必须设置如下两行
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(httpURLConnection.getOutputStream(), "utf-8"));
            
            // 发送请求参数
            printWriter.write(data);//post的参数 xx=xx&yy=yy
            // flush输出流的缓冲
            printWriter.flush();
            //开始获取数据
            BufferedInputStream bis = new BufferedInputStream(httpURLConnection.getInputStream());
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            int len;
            byte[] arr = new byte[1024];
            while((len=bis.read(arr))!= -1){
                bos.write(arr,0,len);
                bos.flush();
            }
            bos.close();
            return bos.toString("utf-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    /**
     * 查找内容返回
     * @param start
     * @param end
     * @param input
     * @return
     */
    public static String matchPattern(String start,String end,String input){
		Pattern  p =Pattern.compile(start+".+"+end);
		Matcher m = p.matcher(input);
		boolean b = m.find();
		if(b){
			return m.group();
		}
		return null;
	}
    
    public static void main(String[] args) {
		/*
		String str = "<sign><![CDATA[7921E432F65EB8ED0CE9755F0E86D72F]]></sign><result_code><![CDATA[SUCCESS]]></result_code><prepay_id><![CDATA[wx201411101639507cbf6ffd8b0779950874]]></prepay_id>";
		String a = matchPattern("<prepay_id2>", "</prepay_id2>", str);
		System.out.println(a);*/
    	
    	String ab = "<xml><appid><![CDATA[wxdf0503f3f3aaadb2]]></appid><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[500]]></cash_fee><fee_type><![CDATA[CN]]></fee_type><is_subscribe><![CDATA[N]]></is_subscribe><mch_id><![CDATA[1496654692]]></mch_id><nonce_str><![CDATA[1517313164747]]></nonce_str><openid><![CDATA[oLgBl1O6kH9GUSeGfWKVbPIxIbXI]]></openid><out_trade_no><![CDATA[45-288-20180208234522]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[88F0CD8A1B2E6F57D179FF8782C3212B]]></sign><time_end><![CDATA[20180130195252]]></time_end><total_fee>500</total_fee><trade_type><![CDATA[APP]]></trade_type><transaction_id><![CDATA[4200000095201801303723214750]]></transaction_id></xml>";
    	
    	/*String m = matchPattern("<out_trade_no>", "</out_trade_no>", ab);
    	System.out.println(m.replace("<out_trade_no><![CDATA[", "").replace("]]></out_trade_no>", ""));*/
    	
    	doPost("http://localhost:8080/dbs/app/notify/weixin.do", ab);
    	
	}
}
