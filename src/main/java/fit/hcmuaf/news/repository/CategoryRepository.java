package fit.hcmuaf.news.repository;

import fit.hcmuaf.news.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
public interface CategoryRepository extends JpaRepository<Category, Long> {
    // Có thể định nghĩa các phương thức truy vấn tùy chỉnh ở đây
}
