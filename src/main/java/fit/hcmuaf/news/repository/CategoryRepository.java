package fit.hcmuaf.news.repository;

import fit.hcmuaf.news.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    List<Category> findAll();
//    List<Category> findAllList();
}
