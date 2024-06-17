package fit.hcmuaf.news.controller;

import fit.hcmuaf.news.entity.Users;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
@Controller
public class AdminController {
    @RequestMapping("/admin")
    public String admin(HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (user != null && "ADMIN".equals(user.getRole())) {
            return "admin/admin"; // Đảm bảo rằng "admin" là tên của trang JSP cho quản trị viên
        } else {
            return "redirect:/login";
        }
    }
}
