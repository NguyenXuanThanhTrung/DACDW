package fit.hcmuaf.news.repository;

import fit.hcmuaf.news.entity.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NewsRepository extends JpaRepository<News, Long> {
    // Có thể định nghĩa các phương thức truy vấn tùy chỉnh ở đây
    List<News> findByCategoryIdCategory(Long idCategory);
     List<News> findByNewsgroupIdNewsgroup(Long idNewsgroup);
     List<News> findByTitleContaining(String title);
    @Query("SELECT n.numberofreads FROM News n WHERE n.idNews = :newsId")
    Integer findNumberOfReadsByNewsId(Long newsId);

    @Query(value = "SELECT * FROM News ORDER BY id_news OFFSET :offset ROWS FETCH NEXT :limit ROWS ONLY", nativeQuery = true)
    List<News> findNewsWithPagination(@Param("offset") int offset, @Param("limit") int limit);
}

