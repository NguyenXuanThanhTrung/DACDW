package fit.hcmuaf.news.repository;

import fit.hcmuaf.news.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UsersRepository extends JpaRepository<Users, Long> {
    // Có thể định nghĩa các phương thức truy vấn tùy chỉnh ở đây
    Users findByUsernameAndPassword(String username, String password);
    Users findByUsername(String username);
    @Query("SELECT u.idUser FROM Users u WHERE u.idUser = :newsId")
    Long findIdUserByNewsId(Long newsId);
}


