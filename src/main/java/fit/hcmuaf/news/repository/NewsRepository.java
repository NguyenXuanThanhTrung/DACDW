package fit.hcmuaf.news.repository;

import fit.hcmuaf.news.entity.News;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NewsRepository extends JpaRepository<News, Long> {
    // Có thể định nghĩa các phương thức truy vấn tùy chỉnh ở đây
    List<News> findByCategoryIdCategory(Long idCategory);
     List<News> findByNewsgroupIdNewsgroup(Long idNewsgroup);


}

