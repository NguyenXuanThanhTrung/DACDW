package fit.hcmuaf.news.service;

import fit.hcmuaf.news.entity.Users;

import java.util.List;
import java.util.Optional;
public interface UsersService {
    Users authenticate(String username, String password);
    List<Users> findAll();
    Optional<Users> findById(Long id);
    Users save(Users user);
    void deleteById(Long id);
}

