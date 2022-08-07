package com.example.demo.services;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.net.MalformedURLException;
import java.util.List;

public interface FileService {

    List<String> upload(MultipartFile[] files);

    void assignImagesToEvent(List<String> images, Long id);

    Resource load(String filename) throws MalformedURLException;
}
