package com.w.wvideo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
/*扫描maper包*/
@MapperScan("com.w.wvideo.mapper")
public class WvideoApplication {

    public static void main(String[] args) {
        SpringApplication.run(WvideoApplication.class, args);
    }

}
