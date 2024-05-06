package com.example.sbjsp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}
