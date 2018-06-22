package com.cs.test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * ����hashmap �ڴ�������� 
 * hashmap ���ֱ�����ʽ��ʱ���
 * key value ����Ϊnullֵ ��ͬkeyֻ�ᱣ�����һ��ֵ
 * @author Administrator
 *
 */
public class TestHashmap
{
    public static void main(String[] args)
    {
        try
        {
            /**HashMap���100������¼�����ڴ�*/
              Integer a = 1;
              long start = 0;
              long end = 0;
              // ����������
              System.gc();
              start = Runtime.getRuntime().freeMemory();
              System.out.println("freeMemory1:"+Runtime.getRuntime().freeMemory());
              HashMap map1 = new HashMap();
              for (int i = 0; i < 100000; i++) {
                  map1.put(i, a);
              }
              // ��Ҫ�����ʱ,������һ��
              System.gc();
              System.out.println("freeMemory2:"+Runtime.getRuntime().freeMemory());
              
              end = Runtime.getRuntime().freeMemory();
              System.out.println("һ��HashMap����ռ�ڴ�:" + (end - start)/1024/1024+"M");
              
              start = Runtime.getRuntime().freeMemory(); 
              System.out.println("freeMemory3:"+Runtime.getRuntime().freeMemory());
            Map<String,String> map = new HashMap<String,String>();
            for(long i=0;i<1000000;i++)
            {
                map.put("key"+i, "value"+i);    
            }
            //������ʽһ��ʼʱ��
            long startdate = System.currentTimeMillis();
            System.out.println("��ʼʱ��1:"+startdate);
            Set set1 = map.keySet();
            for(Iterator iter = set1.iterator();iter.hasNext();){
                String key = iter.next().toString();
//                System.out.println("key::"+key);
                String value = map.get(key);
//                System.out.println("value:"+value);
            }
          //������ʽһ��ֹʱ��
            long enddate = System.currentTimeMillis();
            System.out.println("��ֹʱ��1:"+enddate);
            long hs1 =enddate - startdate;
            System.out.println("�ܺ�ʱ1:"+hs1);
            
            //������ʽ����ʼʱ��
            System.out.println("��ʼʱ��2:"+System.currentTimeMillis());
            startdate = System.currentTimeMillis();
            Set set2 = map.entrySet();
            for(Iterator iter = set2.iterator();iter.hasNext();){
                Map.Entry entry = (Map.Entry)iter.next();
                String key = entry.getKey().toString();
//                System.out.println("key::"+key);
                String value = entry.getValue().toString();
//                System.out.println("value:"+value);
            }
          //������ʽ����ֹʱ��
            enddate =System.currentTimeMillis();
            System.out.println("��ֹʱ��2:"+enddate);
            long hs2 = enddate -startdate;
            System.out.println("�ܺ�ʱ2:"+hs2);
            System.out.println("ʱ���:"+(hs2-hs1));
            //������ʽ3��ʼʱ��
            System.out.println("��ʼʱ��3:"+System.currentTimeMillis());
            startdate = System.currentTimeMillis();
            for(Map.Entry entry:map.entrySet()){
            	String key = entry.getKey().toString();
//                System.out.println("key::"+key);
            	String value = entry.getValue().toString();
//                System.out.println("value:"+value);
            }
            //������ʽ3��ֹʱ��
            enddate =System.currentTimeMillis();
            long hs3 = enddate -startdate;
            System.out.println("��ֹʱ��3:"+enddate);
            System.out.println("�ܺ�ʱ3:"+hs3);
            
            System.out.println("ʱ���:"+(hs3-hs2));
            
            // ��Ҫ�����ʱ,������һ��
            System.gc();
            end = Runtime.getRuntime().freeMemory();
            System.out.println("freeMemory4:"+Runtime.getRuntime().freeMemory());
            System.out.println("һ��HashMap����ռ�ڴ�2:" + (end - start)/1024/1024+"M");
           
        }
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
