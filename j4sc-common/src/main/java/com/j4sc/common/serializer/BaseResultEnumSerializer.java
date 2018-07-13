package com.j4sc.common.serializer;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import com.j4sc.common.base.BaseResultEnum;

import java.io.IOException;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/28 11:40
 * @Version: 1.0
 **/
public class BaseResultEnumSerializer extends StdSerializer<BaseResultEnum>{
    public BaseResultEnumSerializer() {
        super(BaseResultEnum.class);
    }
    public BaseResultEnumSerializer(Class t) {
        super(t);
    }

    @Override
    public void serialize(BaseResultEnum value, JsonGenerator gen, SerializerProvider provider) throws IOException {
        gen.writeStartObject();
        gen.writeFieldName("status");
        gen.writeNumber(value.status);
        gen.writeFieldName("msg");
        gen.writeString(value.msg);
        gen.writeEndObject();
    }
}
