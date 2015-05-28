package com.maximus.service;

import com.maximus.model.Channel;

import java.util.List;

/**
 * Created by chenweichao on 15-5-28.
 */
public interface ChannelService {

    void insertChannel(Channel channel);

    void updateChannel(Channel channel);

    void deleteChannel(Channel channel);

    Channel findChannelById(int channelid);

    Channel findMsgByname(String channelName);

    List<Channel> queryAll();
}
