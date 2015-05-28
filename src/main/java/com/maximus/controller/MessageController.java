package com.maximus.controller;

import com.maximus.service.BaseService;
import com.maximus.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.Map;

@Controller
@RequestMapping("/msg")
public class MessageController {

    @Autowired
    private BaseService baseService;
    @Autowired
    private MessageService messageService;

    @RequestMapping("queryAll")
    public String queryAll(Model model, HttpServletRequest request, HttpServletResponse response,  String channelId) throws UnsupportedEncodingException {
        return "";
    }

    @RequestMapping("queryMsg")
    public String searchUser(Model model, HttpServletRequest request, HttpServletResponse response, Map<String, Object> context, String name) throws IOException, ParseException {
        return "message";
    }

    @RequestMapping("removeall")
    public String removeall(Model model, HttpServletRequest request, HttpServletResponse response, Map<String, Object> context, String collectionname, String name) {
        return "redirect:/msg/queryMsg.do?name=" + name;
    }
}
