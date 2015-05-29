package com.maximus.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.NameFilter;
import com.alibaba.fastjson.serializer.SerializeWriter;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * json与数据化对象转换类
 *
 * @author liuyifei 使用fasterJSON作为JSON生成
 */
public class JSONHelper {
    /**
     * 名称过滤器
     */
    public void doNameFilter() {
        NameFilter filter = new NameFilter() {
            @Override
            public String process(Object source, String name, Object value) {
                if ("id".equals(name)) {
                    return "ID";
                }
                return name;
            }
        };
        SerializeWriter out = new SerializeWriter();
        JSONSerializer serializer = new JSONSerializer(out);
        serializer.getNameFilters().add(filter);
    }


    /**
     * 对象转成json串
     *
     * @param obj
     * @return
     * @throws Exception
     */
    public static String object2Json(Object obj) {
        SerializerFeature[] features = {SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullStringAsEmpty};
        return JSON.toJSONString(obj, features);
    }

    /**
     * json串转换对象
     *
     * @param json
     * @param className
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static Object json2Object(String json, Class cls) {
        return JSON.parseObject(json, cls);
    }
}
