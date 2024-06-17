package fit.hcmuaf.news.impl;

import fit.hcmuaf.news.entity.News;
import fit.hcmuaf.news.repository.CategoryRepository;
import fit.hcmuaf.news.repository.NewsRepository;
import fit.hcmuaf.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class NewsServiceImpl implements NewsService {

    private final NewsRepository newsRepository;
    private final CategoryRepository categoryRepository;

    @Autowired
    public NewsServiceImpl(NewsRepository newsRepository, CategoryRepository categoryRepository) {
        this.newsRepository = newsRepository;
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<News> findAll() {
        return newsRepository.findAll();
    }


    @Override
    public List<News> findByCategoryIdCategory(Long idCategory) {
        return newsRepository.findByCategoryIdCategory(idCategory);
    }

    @Override
    public List<News> findByNewsgroupIdNewsgroup(Long idNewsgroup) {
        return newsRepository.findByNewsgroupIdNewsgroup(idNewsgroup);
    }

    public News getNewsById(Long id) {
        return newsRepository.findById(id).orElse(null);
    }

    @Override
    public Optional<News> findById(Long id) {
        return newsRepository.findById(id);
    }

    @Override
    public News save(News news) {
        // Kiểm tra và lưu category nếu chưa tồn tại
        if (news.getCategory() != null && news.getCategory().getIdCategory() == null) {
            categoryRepository.save(news.getCategory());
        }
        return newsRepository.save(news);
    }

    @Override
    public void deleteById(Long id) {
        newsRepository.deleteById(id);
    }
    public List<News> searchNews(String query) {
        return newsRepository.findByTitleContaining(query);
    }
    @Override
    public List<News> getNewsWithPagination(int offset, int limit) {
        return newsRepository.findNewsWithPagination(offset, limit);
    }
}

