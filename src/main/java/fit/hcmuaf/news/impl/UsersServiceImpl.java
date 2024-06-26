package fit.hcmuaf.news.impl;

import fit.hcmuaf.news.entity.Users;
import fit.hcmuaf.news.repository.UsersRepository;
import fit.hcmuaf.news.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository usersRepository;

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UsersServiceImpl(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public Users authenticate(String username, String password) {
        Users user = usersRepository.findByUsername(username);
        if (user != null) {
            System.out.println("Found user: " + user.getUsername());
            System.out.println("Encoded password in DB: " + user.getPassword());
            System.out.println("Raw password: " + password);
            if (passwordEncoder.matches(password, user.getPassword())) {
                System.out.println("Password matches");
                return user;
            } else {
                System.out.println("Password does not match");
            }
        } else {
            System.out.println("User not found");
        }
        return null;
    }

    @Override
    public Users save(Users user) {
        // Không mã hóa lại mật khẩu nếu nó đã được mã hóa
        if (!user.getPassword().startsWith("$2a$")) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        return usersRepository.save(user);
    }

    @Override
    public List<Users> findAll() {
        return usersRepository.findAll();
    }

    @Override
    public Users findById(Long id) {
        return usersRepository.findById(id).orElse(null);
    }


    @Override
    public void deleteById(Long id) {
        usersRepository.deleteById(id);
    }

    @Override
    public Users findByUsername(String username) {
        return usersRepository.findByUsername(username);
    }}

