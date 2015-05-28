package com.maximus.dao;

import com.maximus.model.Msge;

import java.util.List;


/**
 * Created by chenweichao on 15-5-28.
 */
public interface MessageMapper {
    void  insertMessage(Msge msg);

    void updateMessage(Msge msg);

    void deleteMessage(Msge msg);

    Msge findMsgById(String msgid);

    Msge findMsgByname(String msgName);

    List<Msge> queryAll(String channelId);
}
