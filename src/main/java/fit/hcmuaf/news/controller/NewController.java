package fit.hcmuaf.news.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fit.hcmuaf.news.entity.News;
import fit.hcmuaf.news.repository.CategoryRepository;
import fit.hcmuaf.news.repository.NewsRepository;
import fit.hcmuaf.news.util.MessageUtil;

@Controller(value = "newControllerAdmin")
public class NewController {
    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "/admin/news/list", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam("page") int page,
                                 @RequestParam("limit") int limit, HttpServletRequest request) {
        int offset = (page - 1) * limit;
        List<News> newsList = newsRepository.findNewsWithPagination(offset, limit);
        long totalItems = newsRepository.count();
        int totalPages = (int) Math.ceil((double) totalItems / limit);

        ModelAndView mav = new ModelAndView("admin/new/list");
        mav.addObject("newsList", newsList);
        mav.addObject("totalItems", totalItems);
        mav.addObject("totalPages", totalPages);
        mav.addObject("currentPage", page);
        mav.addObject("limit", limit);

        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        return mav;
    }

    @RequestMapping(value = "/admin/news/edit", method = RequestMethod.GET)
    public ModelAndView editNew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/new/edit");
        News news = new News();
        if (id != null) {
            news = newsRepository.findById(id).orElse(new News());
        }

        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }

        mav.addObject("categories", categoryRepository.findAll());
        mav.addObject("news", news);
        return mav;
    }
}
