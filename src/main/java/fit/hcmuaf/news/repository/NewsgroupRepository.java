package fit.hcmuaf.news.repository;

import fit.hcmuaf.news.entity.Newsgroup;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NewsgroupRepository extends JpaRepository<Newsgroup, Long> {
    // Có thể định nghĩa các phương thức truy vấn tùy chỉnh ở đây
}

