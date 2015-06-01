package com.maximus.service.impl;

import com.maximus.dao.MessageMapper;
import com.maximus.model.Msge;
import com.maximus.service.BaseService;
import com.maximus.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by chenweichao on 15-5-28.
 */
@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    BaseService baseService;
    @Autowired
    MessageMapper messageDao;

    public void insertMessage(Msge msg) {
        msg.setId(baseService.getNextId("msgnum"));
        messageDao.insertMessage(msg);
    }

    public void updateMessage(Msge msg) {
        messageDao.updateMessage(msg);
    }

    public void deleteMessage(Msge msg) {
        messageDao.deleteMessage(msg);
    }

    public Msge findMsgById(String msgid) {
        Msge msge =  messageDao.findMsgById(msgid);
        return msge;
    }

    public Msge findMsgByname(String msgName) {
        Msge msge =  messageDao.findMsgByname(msgName);
        return msge;
    }

    public List<Msge> queryAll(String channelId) {
        List<Msge>  msges =  messageDao.queryAll(channelId);
        return msges;
    }

}
