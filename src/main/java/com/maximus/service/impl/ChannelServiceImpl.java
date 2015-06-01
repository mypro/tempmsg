package com.maximus.service.impl;

import com.maximus.dao.ChannelMapper;
import com.maximus.model.Channel;
import com.maximus.service.BaseService;
import com.maximus.service.ChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by chenweichao on 15-5-28.
 */
@Service
public class ChannelServiceImpl implements ChannelService {
    @Autowired
    BaseService baseService;
    @Autowired
    ChannelMapper channelDao;

    public  void insertChannel(Channel channel) {
        channel.setId(baseService.getNextId("msgnum"));
        channelDao.insertChannel(channel);
    }

    public void updateChannel(Channel channel){
        channelDao.updateChannel(channel);
    }

    public void deleteChannel(Channel channel){
        channelDao.deleteChannel(channel);
    }

    public Channel findChannelById(int channelid){
        Channel channel =  channelDao.findChannelById(channelid);
        return channel;
    }

    public  Channel findMsgByname(String channelName){
        Channel channel = channelDao.findMsgByname(channelName);
        return channel;
    }

    public List<Channel> queryAll(){
        List<Channel>  channels =  channelDao.queryAll();
       return channels;
    }
}
