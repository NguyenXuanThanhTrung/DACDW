package fit.hcmuaf.news.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    @GetMapping("/admin")
    @PreAuthorize("hasRole('ADMIN')")
    public String admin(HttpSession session) {
        logger.debug("User session: " + session.getAttribute("user"));
        logger.debug("Security context: " + SecurityContextHolder.getContext().getAuthentication());
        return "admin/admin"; // Tên của view admin
    }
}
