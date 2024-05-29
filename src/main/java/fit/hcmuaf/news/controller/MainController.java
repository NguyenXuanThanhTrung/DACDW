package fit.hcmuaf.news.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.Article;
import javax.servlet.ServletContext;

@Controller
public class MainController {
    @Autowired
    private ServletContext servletContext;
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "index";
    }

    @RequestMapping(value = {"about"}, method = RequestMethod.GET)
    public String about(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "about";
    }

    @RequestMapping(value = {"blog"}, method = RequestMethod.GET)
    public String blog(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "blog";
    }

    @RequestMapping(value = {"blog_details"}, method = RequestMethod.GET)
    public String blog_details(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "blog_details";
    }

    @RequestMapping(value = {"single-blog"}, method = RequestMethod.GET)
    public String singleBlog(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "single-blog";
    }

    @RequestMapping(value = {"categori"}, method = RequestMethod.GET)
    public String categori(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "category";
    }

    @RequestMapping(value = {"contact"}, method = RequestMethod.GET)
    public String contact(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "contact";
    }

    @RequestMapping(value = {"elements"}, method = RequestMethod.GET)
    public String elements(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "elements";
    }

    @RequestMapping(value = {"latest_news"}, method = RequestMethod.GET)
    public String latest_news(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "latest_news";
    }

    @RequestMapping(value = {"main"}, method = RequestMethod.GET)
    public String main(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "main";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "login";
    }
    @RequestMapping("/signUp")
    public String signUp(Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        return "signUp";
    }
}
