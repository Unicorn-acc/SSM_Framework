package com.atguigu.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author MiracloW
 * @date 2022-10-17 09:19
 */
@Controller
public class EmployeeController {

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

}
