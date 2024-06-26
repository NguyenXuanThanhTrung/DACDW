package fit.hcmuaf.news.config;

import fit.hcmuaf.news.entity.Users;
import fit.hcmuaf.news.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Configuration
public class AdminUserInitializer {

    @Autowired
    private UsersService usersService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Bean
    public CommandLineRunner initAdminUser() {
        return args -> {
            String adminUsername = "adminnews";
            String adminPassword = "admin123";
            if (usersService.findByUsername(adminUsername) == null) {
                Users admin = new Users();
                admin.setName("Admin Name");
                admin.setUsername(adminUsername);
                admin.setPassword(passwordEncoder.encode(adminPassword)); // Mã hóa mật khẩu trước khi lưu
                admin.setAddress("123 Admin St");
                admin.setEmail("admin@example.com");
                admin.setPhonenumber("0912217440");
                admin.setSex("M");
                admin.setUpdatedate(LocalDateTime.now());
                admin.setDateofbirth(LocalDate.of(1999, 1, 1).atStartOfDay());
                admin.setRole("ADMIN");
                usersService.save(admin);
                System.out.println("Admin account created successfully.");
            } else {
                System.out.println("Admin account already exists.");
            }
        };
    }
}
