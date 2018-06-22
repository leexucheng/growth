package com.cs.third;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

import org.springframework.util.DigestUtils;

public class SmsUtil {

	public static String username = "qiuzhubao";
	public static String userKey = "6ed53dc1-243f-40c5-83cf-a8b89cca88e5";
	
	//public static String url = "http://www.juhetongxun.com/sms/sendSMS.html?username=_USERNAME&phoneNo=_PHONENO&content=_CONTENT&sign=_SIGN&busiType=102003";
	public static String url = "http://www.juhetongxun.com/sms/sendSMS.html";
	public static String data = "username=_USERNAME&phoneNo=_PHONENO&content=_CONTENT&sign=_SIGN&busiType=102003";
	
	public static Integer genRandCode(){
		Random r = new Random();
		
		int rand = r.nextInt(9999-1000) + 1000;
		System.out.println(rand);
		
		return rand;
	}
	
	public static String getSign(){
		String str = "username="+username+"&userKey="+userKey;
		return DigestUtils.md5DigestAsHex(str.getBytes());
	}
	
	/**
     * POST�����ȡ����
     */
    public static String doPost(String path,String data){
        URL url = null;
        try {
            url = new URL(path);
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("POST");// �ύģʽ
            // conn.setConnectTimeout(10000);//���ӳ�ʱ ��λ����
            // conn.setReadTimeout(2000);//��ȡ��ʱ ��λ����
            // ����POST�������������������
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            // ��ȡURLConnection�����Ӧ�������
            PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(httpURLConnection.getOutputStream(), "utf-8"));
            
            // �����������
            printWriter.write(data);//post�Ĳ��� xx=xx&yy=yy
            // flush������Ļ���
            printWriter.flush();
            //��ʼ��ȡ����
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
     * ������֤��
     * @param code
     * @return
     */
    public static String sendSmsForVerifyCode(Integer code,String mobile){
    	String content = "����ע����֤���ǣ�" + code;
    	try {
    		content  = URLEncoder.encode(content, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	
    	String d = data.replace("_USERNAME", username).replace("_SIGN", getSign())
    			.replace("_PHONENO", mobile).replace("_CONTENT", content);
    	
    	return doPost(url, d);
    }
	
	public static void main(String[] args) {
		//genRandCode();
		
		/*String r = sendSmsForVerifyCode(genRandCode(),"15201251884");
		System.out.println(r);*/
		Random ran = new Random();
		System.out.println(ran.nextInt(2));
	}
}
