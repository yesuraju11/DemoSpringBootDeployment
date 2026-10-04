package com.bigbridz.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin("*")
public class DemoApi {

    @GetMapping("/demoapi")
    public String getDemo()
    {
        return "Hello Demo project...";
    }
}
