package com.example.demo.services;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.net.MalformedURLException;
import java.util.List;

public interface FileService {

/*
    List<String> upload(MultipartFile[] files);
*/
    String upload(MultipartFile file);
/*
    void assignImagesToEvent(List<String> images, Long id);
*/
    void assignImageToEvent(String image, Long id);

    Resource load(String filename) throws MalformedURLException;
}
