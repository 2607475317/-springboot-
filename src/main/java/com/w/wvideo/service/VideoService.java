package com.w.wvideo.service;

import com.w.wvideo.domain.Video;


import java.util.List;

public interface VideoService {

    List<Video> findAll();


    Video findById(int id);
    int  update(Video video);
    int  delete(int id);
    int save(Video video);
}
