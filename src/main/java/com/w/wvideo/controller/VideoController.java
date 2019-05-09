package com.w.wvideo.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.w.wvideo.domain.Video;
import com.w.wvideo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/video")
public class VideoController {
    @Autowired
    private VideoService videoService;

    /**
     * 分页接口
     * @param page 第几页，默认1
     * @param size 每页显示数，默认10
     * @return
     */
    @GetMapping("/page")
    public Object pageVideo(@RequestParam(value = "page",defaultValue = "1") int page,
                            @RequestParam(value = "size",defaultValue = "10") int size){

        PageHelper.startPage(page,size);

        List<Video> list = videoService.findAll();
        PageInfo<Video> pageInfo = new PageInfo<>(list);
        Map<String,Object> data = new HashMap<>();
        data.put("total_size",pageInfo.getTotal());//总条数
        data.put("total_page",pageInfo.getPages());//总页数
        data.put("current_page",page);//当前页
        data.put("data",pageInfo.getList());//数据

        return data;
    }

    /**
     * 根据id找视频
     * @param videoId
     * @return
     * //required表示必填
     */
    @GetMapping("/find_by_id")
    public Object findById(@RequestParam(value = "video_id",required = true) int videoId){
        return videoService.findById(videoId);
    }
}
