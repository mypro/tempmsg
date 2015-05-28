package com.shiro.demo;

import com.alibaba.fastjson.JSON;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by chenweichao on 15-5-14.
 */
public class Tutorial {
    public static final Logger logger = LoggerFactory.getLogger(Tutorial.class);

    public static void main(String[] args) {
        logger.info("--------------My First Apache Shiro Application");
        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro.ini");

        SecurityManager sem = factory.getInstance();

        SecurityUtils.setSecurityManager(sem);


        Subject currentUser = SecurityUtils.getSubject();
        System.out.println(JSON.toJSONString(currentUser));
        Session session = currentUser.getSession();
        session.setAttribute("someKey", "aValue");

        if (!currentUser.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken("lonestarr", "vespa");
            token.setRememberMe(true);

            try {
                currentUser.login(token);
            } catch (UnknownAccountException e) {
                logger.info("--------------UnknownAccountException", e);
            } catch (IncorrectCredentialsException e) {
                logger.info("--------------IncorrectCredentialsException", e);
            } catch (LockedAccountException e) {
                logger.info("--------------LockedAccountException", e);
            } catch (AuthenticationException e) {
                logger.info("--------------AuthenticationException", e);
            }
        }

        logger.info(" User [" + currentUser.getPrincipal() + "]logged in Successfully!");
        if (currentUser.hasRole("schwartz")) {
            logger.info(" --------------May the schwartz be with you ！");
        } else {
            logger.info(" --------------hello mere mortal. ");
        }


        if (currentUser.isPermitted("lightsaber:weild")) {
            logger.info("You may use a lightsaber ring. Use it wisely.");
        } else {
            logger.info("Sorry , lightsaber rings are for schwartz masters only.");
        }

        if (currentUser.isPermitted("winnebago:drive:eagle5")) {
            logger.info("You are permitted to 'drive' the 'winnebago' with license plate(id) 'eagle5' , Here are the keys - hava fun!");

        }

        currentUser.logout();
        System.exit(0);
    }
}
