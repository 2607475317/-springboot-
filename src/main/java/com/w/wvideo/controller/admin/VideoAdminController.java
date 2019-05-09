package com.w.wvideo.controller.admin;

import com.w.wvideo.domain.Video;
import com.w.wvideo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
@RestController
@RequestMapping("/admin/api/v1/video")
public class VideoAdminController {
    @Autowired
    private VideoService videoService;


    /**
     * 根据id删除视频
     * @param videoId
     * @return
     */
    @DeleteMapping("/delete_by_id")
    public Object deleteById(@RequestParam(value = "video_id",required = true) int videoId){
        return videoService.delete(videoId);
    }

    /**
     * 根据id更新对象
     * @param video
     * @return
     * //@RequestBody注解通常应用于一个对象，通常用来处理application/json类型
     */
    @PutMapping("/update_by_id")
    public Object updateById(@RequestBody Video video){

        return videoService.update(video);
    }

    /**
     * 保存视频对象
     * @param video
     * @return
     */
    @PostMapping("/save")
    public Object save(@RequestBody Video video){

        return videoService.save(video);
    }
}
