package com.maximus.controller;

import com.maximus.model.Channel;
import com.maximus.service.BaseService;
import com.maximus.service.ChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public @ResponseBody
    String queryAllforMenu(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        List<Channel> channels = channelService.queryAll();
        model.addAttribute("channels", channels);
        return returnForAjax(request, response, channels);
    }
    @RequestMapping("insertChannel")
    public String insertChannel(Model model, HttpServletRequest request, HttpServletResponse response, Map<String, Object> context, String name) throws IOException, ParseException {
        return "message";
    }

    @RequestMapping("updateChannel")
    public String updateChannel(Model model, HttpServletRequest request, HttpServletResponse response, Map<String, Object> context, String name) throws IOException, ParseException {
        return "message";
    }

    @RequestMapping("removeall")
    public String removeall(Model model, HttpServletRequest request, HttpServletResponse response, Map<String, Object> context, String collectionname, String name) {
        return "message";
    }

    @RequestMapping("removeOne")
    public String removeOne(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false) String channelId) throws IOException, ParseException {
        return "decorator/admin";
    }
}
