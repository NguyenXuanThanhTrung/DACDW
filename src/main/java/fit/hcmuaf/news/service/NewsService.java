package fit.hcmuaf.news.service;

import fit.hcmuaf.news.entity.News;

import java.util.List;
import java.util.Optional;
public interface NewsService {
    List<News> findAll();
    //  phương thức lấy list news theo id của categoryId
    List<News> findByCategoryIdCategory(Long categoryId);
    //  phương thức lấy list news theo id của newsgroupId
    public List<News> findByNewsgroupIdNewsgroup(Long idNewsgroup);
    // phương thức lấy news theo id
    News getNewsById(Long id);

    Optional<News> findById(Long id);
    News save(News news);
    void deleteById(Long id);
    List<News> searchNews(String query);

    List<News> getNewsWithPagination(int offset, int limit);
}

