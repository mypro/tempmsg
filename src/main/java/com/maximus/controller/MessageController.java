package com.maximus.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.maximus.model.Msge;
import com.maximus.service.BaseService;
import com.maximus.service.MessageService;
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
@RequestMapping("/msg")
public class MessageController extends AbstractAction {

    @Autowired
    private BaseService baseService;
    @Autowired
    private MessageService messageService;

    @RequestMapping("queryAll")
    public String queryAll(Model model, HttpServletRequest request, HttpServletResponse response, String channelId) throws UnsupportedEncodingException {
//        int channel = Integer.valueOf(channelId);
        List<Msge> msgs = messageService.queryAll(channelId);
        model.addAttribute("msgs", msgs);
        model.addAttribute("channelId", channelId);
        return "msg/msgList";
    }

    @RequestMapping("insertMsg")
    public String insertMsg(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(required = true) String name,
                            @RequestParam(required = true) String content, @RequestParam(required = true) String channelId) throws IOException, ParseException {
        Msge msg = new Msge();

        msg.setName(name);
        msg.setContent(content);
        msg.setCreateTime(System.currentTimeMillis());
        msg.setChannelId(Integer.parseInt(channelId));
        messageService.insertMessage(msg);
        return "redirect:/msg/queryAll?channelId=" + channelId;
    }

    @RequestMapping("queryMsg")
    public String searchUser(Model model, HttpServletRequest request, HttpServletResponse response, @RequestBody String json) throws IOException, ParseException {
        JSONObject obj = JSONObject.parseObject(json);
        Integer mongoId = Integer.parseInt(obj.getString("mongoId"));
        Msge msg = null;
        if (!Lang.isEmpty(mongoId)) {
            msg = messageService.findMsgById(mongoId);
        }

        return returnForAjax(request, response, msg.getContent());
    }

    @RequestMapping("removeall")
    public
    @ResponseBody
    String removeall(Model model, HttpServletRequest request, HttpServletResponse response, @RequestBody String json) {
        Map<String, String> paramMap = JSONObject.parseObject(json, Map.class);
        String mongoIds = paramMap.get("mongoIds");
        if (!Lang.isEmpty(mongoIds)) {
            String[] ids = mongoIds.split(",");
            Msge msg = new Msge();
            for (int i = 0; i < ids.length; i++) {
                msg.setId(Integer.parseInt(ids[i]));
                messageService.deleteMessage(msg);
            }
        }
        return returnForAjax(request, response, JSON.parseObject(json));
    }
}
