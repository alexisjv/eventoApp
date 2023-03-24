package com.example.demo.services;

import com.example.demo.models.Image;
import com.example.demo.repositories.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class FileServiceImpl implements FileService{

    @Autowired
    private FileRepository fileRepository;
      public static String uploadDirectory = System.getProperty("user.dir")+"/src/main/webapp/uploads";
   /* @Override
    public List<String> upload(MultipartFile[] files) {

        List<String> filenames = new ArrayList<>();
        for (MultipartFile file : files) {
            String uniqueFilename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

            Path fileNameAndPath = Paths.get(uploadDirectory, uniqueFilename);
            filenames.add(uniqueFilename);
            try {
                Files.write(fileNameAndPath, file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        System.out.println(filenames);

        return filenames;
    }*/

    @Override
    public String upload(MultipartFile file) {
        String imagePath = UUID.randomUUID().toString() + "_" + file.getName();

        Path fileNameAndPath = Paths.get(uploadDirectory, imagePath);
        try {
            byte[] bytes = file.getBytes();
            Files.write(fileNameAndPath, bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return imagePath;

    }

    @Override
    public void assignImageToEvent(String image, Long id) {
        Image coverImage = new Image();
        coverImage.setName(image);
        coverImage.setEvent_id(id);
        fileRepository.save(coverImage);
    }

    /*@Override
    public void assignImagesToEvent(List<String> images, Long event_id) {
        for (String img: images) {

            Image image = new Image();
            image.setName(img);
            image.setEvent_id(event_id);
            fileRepository.save(image);
        }
    }*/

    @Override
    public Resource load(String filename) throws MalformedURLException {

        Path pathFoto = getPath(filename);

        Resource recurso =  new UrlResource(pathFoto.toUri());

        if (!recurso.exists() || !recurso.isReadable()) {
            throw new RuntimeException("Error: no se puede cargar la imagen: " + pathFoto.toString());
        }
        return recurso;
    }

    public Path getPath(String file) {
        return Paths.get(uploadDirectory).resolve(file).toAbsolutePath();
    }

}
