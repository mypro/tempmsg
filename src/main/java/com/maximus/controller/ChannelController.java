package com.maximus.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.maximus.model.Channel;
import com.maximus.service.BaseService;
import com.maximus.service.ChannelService;
import com.maximus.util.Lang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/channel")
public class ChannelController extends AbstractAction {

    @Autowired
    private BaseService baseService;
    @Autowired
    private ChannelService channelService;

    @RequestMapping("queryAll")
    public String queryAll(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        List<Channel> channels = channelService.queryAll();
        model.addAttribute("channels", channels);
        return "channel/channelList";
    }

    @RequestMapping("queryAllforMenu")
    public
    @ResponseBody
    String queryAllforMenu(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        List<Channel> channels = channelService.queryAll();
        model.addAttribute("channels", channels);
        return returnForAjax(request, response, channels);
    }

    @RequestMapping("insertChannel")
    public String insertChannel(Model model, HttpServletRequest request, HttpServletResponse response,  @RequestParam(required = true) String name, @RequestParam(required = true) String description) throws IOException, ParseException {
        Channel cl = new Channel();

        cl.setName(name);
        cl.setDescription(description);
        cl.setCreateTime(System.currentTimeMillis());
        channelService.insertChannel(cl);
        return "redirect:/channel/queryAll";
    }

    @RequestMapping("updateChannel")
    public String updateChannel(Model model, HttpServletRequest request, HttpServletResponse response, Map<String, Object> context, String name) throws IOException, ParseException {
        return "message";
    }

    @RequestMapping("removeall")
    public
    @ResponseBody
    String removeall(Model model, HttpServletRequest request, HttpServletResponse response, @RequestBody String json) {
        Map<String, String> paramMap = JSONObject.parseObject(json, Map.class);
        String mongoIds = paramMap.get("mongoIds");
        if (!Lang.isEmpty(mongoIds)) {
            String[] ids = mongoIds.split(",");
            Channel cl = new Channel();
            for (int i = 0; i < ids.length; i++) {
                cl.setId(Integer.parseInt(ids[i]));
                channelService.deleteChannel(cl);
            }
        }

        return returnForAjax(request, response, JSON.parseObject(json));
    }

    @RequestMapping("removeOne")
    public String removeOne(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false) String channelId) throws IOException, ParseException {
        return "decorator/admin";
    }
}
