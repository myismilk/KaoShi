package com.wangkaiping.util;

import javax.mail.MessagingException;

public class MailTest {
    public static void main(String[] args) {
        try {
            MailUtils.sendMail("1424684376@qq.com","<a href='https://www.baidu.com'>点击跳转激活页面</a>");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
