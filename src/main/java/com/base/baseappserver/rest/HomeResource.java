package com.base.baseappserver.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeResource {

    @RequestMapping("/home")
    public String home() {
        return "Hello world";
    }
}
