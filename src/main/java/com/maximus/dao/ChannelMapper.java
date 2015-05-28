package com.maximus.dao;

import com.maximus.model.Channel;

import java.util.List;

/**
 * Created by chenweichao on 15-5-28.
 */
public interface ChannelMapper {

    void insertChannel(Channel channel);

    void updateChannel(Channel channel);

    void deleteChannel(Channel channel);

    Channel findChannelById(int channelId);

    Channel findMsgByname(String channelName);

    List<Channel> queryAll();
}
