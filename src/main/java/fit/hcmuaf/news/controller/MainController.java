package fit.hcmuaf.news.controller;

import fit.hcmuaf.news.entity.Category;
import fit.hcmuaf.news.entity.ContactForm;
import fit.hcmuaf.news.entity.News;
import fit.hcmuaf.news.repository.ContactFormRepository;
import fit.hcmuaf.news.service.CategoryService;
import fit.hcmuaf.news.service.CommentService;
import fit.hcmuaf.news.service.NewsService;
import fit.hcmuaf.news.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.ServletContext;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class MainController {
    @Autowired
    private ServletContext servletContext;

    @Autowired
    private NewsService newsService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private UsersService userService;
    @Autowired
    private ContactFormRepository contactFormRepository;
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        String contextPath = servletContext.getContextPath();
        List<Category> categories = categoryService.findAll();
        List<News> lifestyle  = newsService.findByCategoryIdCategory(1l);
        List<News> mostrecent = newsService.findByNewsgroupIdNewsgroup(1l);
        List<News> mostpopular = newsService.findByNewsgroupIdNewsgroup(2l);
        List<News> trendingnews = newsService.findByNewsgroupIdNewsgroup(3l);
        List<News> crossbar = newsService.findByNewsgroupIdNewsgroup(4l);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("categories", categories);
        model.addAttribute("lifestyle", lifestyle);
        model.addAttribute("mostrecent", mostrecent);
        model.addAttribute("mostpopular", mostpopular);
        model.addAttribute("trendingnews", trendingnews);
        model.addAttribute("crossbar", crossbar);
        model.addAttribute("popularpost", popularpost);
        model.addAttribute("contextPath", contextPath);
        return "index";
    }


    @RequestMapping(value = {"about"}, method = RequestMethod.GET)
    public String about(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "about";
    }

    @RequestMapping(value = {"blog"}, method = RequestMethod.GET)
    public String blog(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "blog";
    }

    @RequestMapping(value = {"blog_details"}, method = RequestMethod.GET)
    public String blog_details(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "blog_details";
    }

    @RequestMapping(value = {"single-blog"}, method = RequestMethod.GET)
    public String singleBlog(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "single-blog";
    }

    @RequestMapping(value = {"categori"}, method = RequestMethod.GET)
    public String categori(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "category";
    }

    @RequestMapping(value = {"contact"}, method = RequestMethod.GET)
    public String contact(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "contact";
    }

    @RequestMapping(value = {"elements"}, method = RequestMethod.GET)
    public String elements(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "elements";
    }

    @RequestMapping(value = {"latest_news"}, method = RequestMethod.GET)
    public String latest_news(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "latest_news";
    }

    @RequestMapping(value = {"main"}, method = RequestMethod.GET)
    public String main(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        List<News> popularpost = newsService.findByNewsgroupIdNewsgroup(5l);
        model.addAttribute("popularpost", popularpost);
        return "main";
    }
    @RequestMapping("/api/latest_news")
    public ResponseEntity<List<News>> getLatestNews() {
        List<News> latestNews = newsService.findByNewsgroupIdNewsgroup(1L); // Thay 1L bằng ID tương ứng
        return ResponseEntity.ok(latestNews);
    }
    @PostMapping("/api/contact")
    @ResponseBody
    public ResponseEntity<String> handleContactFormSubmission(@RequestBody ContactForm contactForm) {
        // Kiểm tra các trường dữ liệu
        if (contactForm.getName() == null || contactForm.getName().trim().isEmpty() ||
                contactForm.getEmail() == null || contactForm.getEmail().trim().isEmpty() ||
                contactForm.getSubject() == null || contactForm.getSubject().trim().isEmpty() ||
                contactForm.getMessage() == null || contactForm.getMessage().trim().isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("All fields are required");
        }

        // Kiểm tra định dạng email
        String emailRegex = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(contactForm.getEmail());
        if (!matcher.matches()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid email format");
        }

        try {
            contactFormRepository.save(contactForm);
            System.out.println("Contact form saved to database.");
            return ResponseEntity.ok("Success");
        } catch (Exception ex) {
            System.err.println("Failed to save contact form to database: " + ex.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save contact form");
        }
    }
}
