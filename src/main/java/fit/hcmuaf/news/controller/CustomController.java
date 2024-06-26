package fit.hcmuaf.news.controller;

import fit.hcmuaf.news.entity.Comment;
import fit.hcmuaf.news.entity.News;
import fit.hcmuaf.news.entity.Users;
import fit.hcmuaf.news.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CustomController {
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
    private PasswordEncoder passwordEncoder;
    @RequestMapping(value = {"api/{id}", "api"})
    public String testindex(@PathVariable(required = false) Long id , Model model) {
        return "";
    }

    @RequestMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/checklogin")
    @ResponseBody
    public Map<String, Object> checklogin(@RequestBody Map<String, String> loginData, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        String username = loginData.get("username");
        String password = loginData.get("password");

        Users user = userService.authenticate(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            response.put("success", true);
            response.put("role", user.getRole());
            // Tạo và lưu trữ SecurityContext
            UsernamePasswordAuthenticationToken authToken =
                    new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authToken);
            session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
        } else {
            response.put("success", false);
            response.put("message", "Invalid username or password.");
        }
        return response;
    }


    @RequestMapping("/signUp")
    public String showSignUpPage() {
        return "signUp";
    }

    @PostMapping("/signUp")
    @ResponseBody
    public Map<String, Object> handleSignUp(@RequestParam("name") String name,
                                            @RequestParam("username") String username,
                                            @RequestParam("password") String password,
                                            @RequestParam("address") String address,
                                            @RequestParam("email") String email,
                                            @RequestParam("phoneNumber") String phoneNumber,
                                            @RequestParam("sex") String sex,
                                            @RequestParam("dateOfBirth") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate dateOfBirth,
                                            HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        Users newUser = new Users();
        newUser.setName(name);
        newUser.setUsername(username);
        String encodedPassword = passwordEncoder.encode(password);
        newUser.setPassword(encodedPassword);  // Mã hóa mật khẩu chỉ một lần
        newUser.setAddress(address);
        newUser.setEmail(email);
        newUser.setPhonenumber(phoneNumber);
        newUser.setSex(sex);
        newUser.setUpdatedate(LocalDateTime.now());
        newUser.setDateofbirth(dateOfBirth.atStartOfDay());
        newUser.setRole("USER"); // Gán vai trò mặc định là "USER"

        Users savedUser = userService.save(newUser);

        if (savedUser != null) {
            session.setAttribute("user", savedUser);
            response.put("success", true);
        } else {
            response.put("success", false);
            response.put("message", "Sign up failed.");
        }
        return response;
    }


    @RequestMapping("/user")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String user(HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            if ("ADMIN".equals(user.getRole())) {
                return "redirect:/admin";
            } else {
                return "index";
            }
        } else {
            return "redirect:/login";
        }
    }


    @RequestMapping("/user/profile")
    public String userProfile(HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            return "profile";
        } else {
            return "redirect:/login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/index";
    }

    @RequestMapping("/news/{id}")
    public String showNewsDetails(@PathVariable("id") Long id, Model model) {
        String contextPath = servletContext.getContextPath();
        model.addAttribute("contextPath", contextPath);
        News news = newsService.getNewsById(id);
        if (news != null) {
            model.addAttribute("news", news);
            List<Comment> comments = commentService.getCommentsByNewsId(id);
            model.addAttribute("comments", comments);
            return "blog_details";
        } else {
            return "error";
        }
    }

    @RequestMapping("/shownews")
    public String showAllNews(Model model) {
        String contextPath = servletContext.getContextPath();
        List<News> newsList  = newsService.findByCategoryIdCategory(1l);;
        model.addAttribute("newsList", newsList);
        model.addAttribute("contextPath", contextPath);
        return "testshownews";
    }

    @RequestMapping("/saveComment")
    public String saveComment(@RequestParam(required = false) String comment,
                              HttpSession session, Model model,
                              @RequestParam("newsId") Long newsId) {
        News news = newsService.getNewsById(newsId);
        Users users = (Users) session.getAttribute("user");
        Comment newcomment = new Comment();
        newcomment.setContent(comment);
        newcomment.setCreateDate(LocalDateTime.now());
        newcomment.setNews(news);
        newcomment.setUser(users);
        commentService.saveComment(newcomment);
        model.addAttribute("newcomment", newcomment);
        return "redirect:/news/" + newsId;
    }
}
