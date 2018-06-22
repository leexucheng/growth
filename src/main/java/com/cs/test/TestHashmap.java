package com.cs.test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * 测试hashmap 内存消耗情况 
 * hashmap 两种遍历方式耗时情况
 * key value 允许为null值 相同key只会保留最后一个值
 * @author Administrator
 *
 */
public class TestHashmap
{
    public static void main(String[] args)
    {
        try
        {
            /**HashMap添加100万条记录消耗内存*/
              Integer a = 1;
              long start = 0;
              long end = 0;
              // 先垃圾回收
              System.gc();
              start = Runtime.getRuntime().freeMemory();
              System.out.println("freeMemory1:"+Runtime.getRuntime().freeMemory());
              HashMap map1 = new HashMap();
              for (int i = 0; i < 100000; i++) {
                  map1.put(i, a);
              }
              // 快要计算的时,再清理一次
              System.gc();
              System.out.println("freeMemory2:"+Runtime.getRuntime().freeMemory());
              
              end = Runtime.getRuntime().freeMemory();
              System.out.println("一个HashMap对象占内存:" + (end - start)/1024/1024+"M");
              
              start = Runtime.getRuntime().freeMemory(); 
              System.out.println("freeMemory3:"+Runtime.getRuntime().freeMemory());
            Map<String,String> map = new HashMap<String,String>();
            for(long i=0;i<1000000;i++)
            {
                map.put("key"+i, "value"+i);    
            }
            //遍历方式一开始时间
            long startdate = System.currentTimeMillis();
            System.out.println("开始时间1:"+startdate);
            Set set1 = map.keySet();
            for(Iterator iter = set1.iterator();iter.hasNext();){
                String key = iter.next().toString();
//                System.out.println("key::"+key);
                String value = map.get(key);
//                System.out.println("value:"+value);
            }
          //遍历方式一截止时间
            long enddate = System.currentTimeMillis();
            System.out.println("截止时间1:"+enddate);
            long hs1 =enddate - startdate;
            System.out.println("总耗时1:"+hs1);
            
            //遍历方式二开始时间
            System.out.println("开始时间2:"+System.currentTimeMillis());
            startdate = System.currentTimeMillis();
            Set set2 = map.entrySet();
            for(Iterator iter = set2.iterator();iter.hasNext();){
                Map.Entry entry = (Map.Entry)iter.next();
                String key = entry.getKey().toString();
//                System.out.println("key::"+key);
                String value = entry.getValue().toString();
//                System.out.println("value:"+value);
            }
          //遍历方式二截止时间
            enddate =System.currentTimeMillis();
            System.out.println("截止时间2:"+enddate);
            long hs2 = enddate -startdate;
            System.out.println("总耗时2:"+hs2);
            System.out.println("时间差:"+(hs2-hs1));
            //遍历方式3开始时间
            System.out.println("开始时间3:"+System.currentTimeMillis());
            startdate = System.currentTimeMillis();
            for(Map.Entry entry:map.entrySet()){
            	String key = entry.getKey().toString();
//                System.out.println("key::"+key);
            	String value = entry.getValue().toString();
//                System.out.println("value:"+value);
            }
            //遍历方式3截止时间
            enddate =System.currentTimeMillis();
            long hs3 = enddate -startdate;
            System.out.println("截止时间3:"+enddate);
            System.out.println("总耗时3:"+hs3);
            
            System.out.println("时间差:"+(hs3-hs2));
            
            // 快要计算的时,再清理一次
            System.gc();
            end = Runtime.getRuntime().freeMemory();
            System.out.println("freeMemory4:"+Runtime.getRuntime().freeMemory());
            System.out.println("一个HashMap对象占内存2:" + (end - start)/1024/1024+"M");
           
        }
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
