package fit.hcmuaf.news.impl;

import fit.hcmuaf.news.entity.Users;
import fit.hcmuaf.news.repository.UsersRepository;
import fit.hcmuaf.news.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository usersRepository;
    @Override
    public Users authenticate(String username, String password) {
        return usersRepository.findByUsernameAndPassword(username, password);
    }
    @Override
    public List<Users> findAll() {
        return usersRepository.findAll();
    }

    @Override
    public Optional<Users> findById(Long id) {
        return usersRepository.findById(id);
    }

    @Override
    public Users save(Users user) {
        return usersRepository.save(user);
    }

    @Override
    public void deleteById(Long id) {
        usersRepository.deleteById(id);
    }
}

