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

    @GetMapping("/trending")
    public String showTrending(Model model) {
        // Simulate fetching trending articles from a database or another source
        List<Article> articles = getTrendingArticles();

        // Add articles to the model
        model.addAttribute("trendingArticles", articles);

        // Return the view name
        return "trending";
    }

    private List<Article> getTrendingArticles() {
        // Simulated list of trending articles
        List<Article> articles = new ArrayList<>();

        // Add some sample articles
        articles.add(new Article("Anna Lora Stuns In White At Her Australian Premiere", "Alice Cloe", "Jun 19, 2020"));
        articles.add(new Article("Secretart for Economic Airplane that looks like", "Alice Cloe", "Jun 19, 2020"));
        return articles;
    }

    @GetMapping("/weekly-news")
    public String showWeeklyNews(Model model) {
        // Simulate fetching articles from a database or another source
        List<Article> articles = getArticles();

        // Add articles to the model
        model.addAttribute("articles", articles);

        // Return the view name
        return "weekly-news";
    }

    private List<Article> getArticles() {
        // Simulated list of articles
        List<Article> articles = new ArrayList<>();
        // Add some sample articles
        articles.add(new Article("Scarlett’s disappointment at latest accolade", "Jhon", "2 hours ago"));
        articles.add(new Article("Another headline here", "Jane", "3 hours ago"));
        return articles;
    }
    @GetMapping("/getWhatsNew")
    @ResponseBody
    public List<Article> getWhatsNew() {
        // Simulate fetching latest "What's New" articles
        List<Article> whatsNew = new ArrayList<>();
        whatsNew.add(new Article("Secretart for Economic Air plane that looks like", "Alice cloe", "Jun 19, 2020", "Struggling to sell one multi-million dollar home currently on the market won’t stop actress and singer Jennifer Lopez.", "/assets/img/gallery/whats_news_details1.png"));
        whatsNew.add(new Article("Portrait of group of friends ting eat. market in.", "Alice cloe", "Jun 19, 2020", "", "/assets/img/gallery/whats_right_img1.png"));
        // Add more articles as needed
        return whatsNew;
    }

    @GetMapping("/getLatestNews")
    @ResponseBody
    public List<Article> getLatestNews() {
        // Simulate fetching latest news articles
        List<Article> latestNews = new ArrayList<>();
        latestNews.add(new Article("New Article 1", "Author 1", "Date 1"));
        latestNews.add(new Article("New Article 2", "Author 2", "Date 2"));
        latestNews.add(new Article("New Article 3", "Author 3", "Date 3"));
        return latestNews;
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
