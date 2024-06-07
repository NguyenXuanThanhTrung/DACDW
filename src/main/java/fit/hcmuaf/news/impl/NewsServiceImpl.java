package fit.hcmuaf.news.impl;

import fit.hcmuaf.news.entity.News;
import fit.hcmuaf.news.repository.NewsRepository;
import fit.hcmuaf.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class NewsServiceImpl implements NewsService {

    private final NewsRepository newsRepository;

    @Autowired
    public NewsServiceImpl(NewsRepository newsRepository) {
        this.newsRepository = newsRepository;
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
        return newsRepository.save(news);
    }

    @Override
    public void deleteById(Long id) {
        newsRepository.deleteById(id);
    }
}

