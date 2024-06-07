    package fit.hcmuaf.news.controller;

    import fit.hcmuaf.news.entity.*;
    import fit.hcmuaf.news.service.*;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.format.annotation.DateTimeFormat;
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


        @RequestMapping(value = {"api/{id}", "api"})
        public String testindex(@PathVariable(required = false) Long id , Model model) {
            // Lấy tất cả các danh mục


            return "";
        }
        @RequestMapping("/login")
        public String showLoginPage() {
            return "login";
        }

        @PostMapping("/checklogin")
        @ResponseBody
        public Map<String, Object> checklogin(@RequestParam("username") String username,
                                              @RequestParam("password") String password,
                                              HttpSession session) {
            Map<String, Object> response = new HashMap<>();
            Users user = userService.authenticate(username, password);
            if (user != null) {
                session.setAttribute("user", user);
                response.put("success", true);
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
            newUser.setPassword(password);
            newUser.setAddress(address);
            newUser.setEmail(email);
            newUser.setPhonenumber(phoneNumber);
            newUser.setSex(sex);
            newUser.setUpdatedate(LocalDateTime.now());
            newUser.setDateofbirth(dateOfBirth.atStartOfDay());

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
        public String user(HttpSession session) {
            Users user = (Users) session.getAttribute("user");
            if (user != null) {
                // Nếu người dùng đã đăng nhập, chuyển hướng đến trang index
                return "index";
            } else {
                // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang index
                return "redirect:/index"; // Đảm bảo rằng "/index" là đường dẫn đến trang index của bạn
            }
        }
        @RequestMapping("/user/profile")
        public String userProfile(HttpSession session) {
            Users user = (Users) session.getAttribute("user");
            if (user != null) {
                // Nếu người dùng đã đăng nhập, chuyển hướng đến trang profile
                return "profile"; // Đảm bảo rằng "profile" là tên của trang JSP để hiển thị profile của người dùng
            } else {
                // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
                return "redirect:/login"; // Đảm bảo rằng "/login" là đường dẫn đến trang đăng nhập của bạn
            }
        }

        @RequestMapping("/logout")
        public String logout(HttpSession session) {
            // Xóa thông tin người dùng khỏi session
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
                return "blog_details"; // Tên của trang JSP để hiển thị chi tiết bài viết
            } else {
                return "error"; // Tên của trang JSP để hiển thị thông báo lỗi
            }
        }
        /// hiển thi danh sách các news
        @RequestMapping("/shownews")
        public String showAllNews(Model model) {
            String contextPath = servletContext.getContextPath();
            List<News> newsList  = newsService.findByCategoryIdCategory(1l);;
            model.addAttribute("newsList", newsList);
            model.addAttribute("contextPath", contextPath);
            return "testshownews"; // Tên của trang JSP để hiển thị danh sách bài viết
        }
        ///// lưu comment và hiểnthi5i5 lại trang news hiện tại nở id
        @RequestMapping("/saveComment")
        public String saveComment(@RequestParam( required = false) String comment,
                                  HttpSession session,Model model,
                                  @RequestParam("newsId") Long newsId) {
            // Lấy thông tin bài viết theo ID
            News news = newsService.getNewsById(newsId);
            Users users = (Users) session.getAttribute("user");
            // Tạo đối tượng Comment mới và gán giá trị từ form
            Comment newcomment = new Comment();
            newcomment.setContent(comment);
            newcomment.setCreateDate(LocalDateTime.now());
            newcomment.setNews(news);
            newcomment.setUser(users);
            commentService.saveComment(newcomment);
            model.addAttribute("newcomment", newcomment);
            return "redirect:/news/"+newsId;
        }
    }