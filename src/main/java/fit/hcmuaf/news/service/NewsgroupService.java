package fit.hcmuaf.news.service;

import fit.hcmuaf.news.entity.Newsgroup;

import java.util.List;
import java.util.Optional;
public interface NewsgroupService {
    List<Newsgroup> findAll();
    Newsgroup findById(Long id);
    Newsgroup save(Newsgroup newsgroup);
    void deleteById(Long id);
}
