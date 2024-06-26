package fit.hcmuaf.news.service;

import fit.hcmuaf.news.entity.Users;
import java.util.List;
public interface UsersService {
    Users authenticate(String username, String password);
    List<Users> findAll();
    Users findById(Long id);
    Users save(Users user);
    void deleteById(Long id);

    Users findByUsername(String username);
}

