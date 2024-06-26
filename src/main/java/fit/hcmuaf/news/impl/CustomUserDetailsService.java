package fit.hcmuaf.news.impl;

import fit.hcmuaf.news.entity.Users;
import fit.hcmuaf.news.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UsersService usersService;

    @Autowired
    public CustomUserDetailsService(UsersService usersService) {
        this.usersService = usersService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users user = usersService.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return new User(user.getUsername(), user.getPassword(), user.getAuthorities());
    }
}
