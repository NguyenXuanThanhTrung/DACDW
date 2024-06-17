package fit.hcmuaf.news.api.admin;

import fit.hcmuaf.news.entity.News;
import fit.hcmuaf.news.entity.Newsgroup;
import fit.hcmuaf.news.entity.Users;
import fit.hcmuaf.news.service.NewsService;
import fit.hcmuaf.news.service.NewsgroupService;
import fit.hcmuaf.news.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController("newAPIOfAdmin")
@RequestMapping("/api/new")
public class NewAPI {

    private static final Logger logger = LoggerFactory.getLogger(NewAPI.class);

    @Autowired
    private NewsService newService;
    @Autowired
    private NewsgroupService newsgroupService;
    @Autowired
    private UsersService userService;

    @Value("${file.upload-dir}")
    private String uploadDir;

    @PostMapping
    public News createNew(@ModelAttribute News news,
                          @RequestParam("imageFile") MultipartFile file,
                          @RequestParam("imageDirectory") String directory,
                          @RequestParam(name = "idNewsgroup", required = false) Long idNewsgroup,
                          @RequestParam(name = "idUser", required = false) Long idUser) {
        logger.info("Received request to create news with idNewsgroup: {}, idUser: {}", idNewsgroup, idUser);

        // Validate idNewsgroup and idUser
        if (idNewsgroup == null) {
            logger.error("idNewsgroup is null. Cannot create news.");
            throw new IllegalArgumentException("idNewsgroup cannot be null");
        }
        if (idUser == null) {
            logger.error("idUser is null. Cannot create news.");
            throw new IllegalArgumentException("idUser cannot be null");
        }

        try {
            // Lưu tệp vào thư mục
            String fileName = file.getOriginalFilename();
            Path path = Paths.get(uploadDir + "/" + directory);
            if (!Files.exists(path)) {
                Files.createDirectories(path);
            }
            Path filePath = path.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);

            // Lưu đường dẫn vào thuộc tính image của news
            String thumbnail = "/assets/img/" + directory + "/" + fileName;
            news.setImage(thumbnail);

            // Thiết lập các giá trị mặc định nếu chưa có
            if (news.getCreateDay() == null) {
                news.setCreateDay(LocalDateTime.now());
            }
            if (news.getNumberofreads() == 0) {
                news.setNumberofreads(0);
            }
            // Thiết lập idNewsgroup và idUser
            Newsgroup newsgroup = newsgroupService.findById(idNewsgroup);
            if (newsgroup == null) {
                throw new IllegalArgumentException("Invalid idNewsgroup: " + idNewsgroup);
            }
            news.setNewsgroup(newsgroup);

            Users user = userService.findById(idUser);
            if (user == null) {
                throw new IllegalArgumentException("Invalid idUser: " + idUser);
            }
            news.setUser(user);

            // Lưu bài viết vào cơ sở dữ liệu
            News savedNews = newService.save(news);
            logger.info("News created successfully with id: {}", savedNews.getIdNews());
            return savedNews;
        } catch (IOException e) {
            logger.error("Error saving image file", e);
            throw new RuntimeException("Lỗi khi lưu tệp ảnh", e);
        }
    }

    @PutMapping("/{id}")
    public News updateNew(@PathVariable Long id,
                          @ModelAttribute News updateNew,
                          @RequestParam("imageFile") MultipartFile file,
                          @RequestParam("imageDirectory") String directory,
                          @RequestParam(name = "idNewsgroup", required = false) Long idNewsgroup,
                          @RequestParam(name = "idUser", required = false) Long idUser) {
        logger.info("Received request to update news with id: {}, idNewsgroup: {}, idUser: {}", id, idNewsgroup, idUser);
        try {
            // Lưu tệp vào thư mục
            String fileName = file.getOriginalFilename();
            Path path = Paths.get(uploadDir + "/" + directory);
            if (!Files.exists(path)) {
                Files.createDirectories(path);
            }
            Path filePath = path.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);

            // Lưu đường dẫn vào thuộc tính image của news
            String thumbnail = "/assets/img/" + directory + "/" + fileName;
            updateNew.setImage(thumbnail);

            // Thiết lập các giá trị mặc định nếu chưa có
            if (updateNew.getCreateDay() == null) {
                updateNew.setCreateDay(LocalDateTime.now());
            }
            if (updateNew.getNumberofreads() == 0) {
                updateNew.setNumberofreads(0);
            }
            // Thiết lập idNewsgroup và idUser
            if (idNewsgroup != null) {
                Newsgroup newsgroup = newsgroupService.findById(idNewsgroup);
                updateNew.setNewsgroup(newsgroup);
            }
            if (idUser != null) {
                Users user = userService.findById(idUser);
                updateNew.setUser(user);
            }
            // Cập nhật bài viết trong cơ sở dữ liệu
            News savedNews = newService.save(updateNew);
            logger.info("News updated successfully with id: {}", savedNews.getIdNews());
            return savedNews;
        } catch (IOException e) {
            logger.error("Error saving image file", e);
            throw new RuntimeException("Lỗi khi lưu tệp ảnh", e);
        }
    }

    @DeleteMapping("/{id}")
    public void deleteNew(@PathVariable long id) {
        logger.info("Received request to delete news with id: {}", id);
        newService.deleteById(id);
        logger.info("News deleted successfully with id: {}", id);
    }
}
