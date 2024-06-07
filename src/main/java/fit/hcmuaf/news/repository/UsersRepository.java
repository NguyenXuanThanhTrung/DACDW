package fit.hcmuaf.news.repository;

import fit.hcmuaf.news.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
public interface UsersRepository extends JpaRepository<Users, Long> {
    // Có thể định nghĩa các phương thức truy vấn tùy chỉnh ở đây
    Users findByUsernameAndPassword(String username, String password);
}

