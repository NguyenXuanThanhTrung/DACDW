package fit.hcmuaf.news.impl;

import fit.hcmuaf.news.entity.Newsgroup;
import fit.hcmuaf.news.repository.NewsgroupRepository;
import fit.hcmuaf.news.service.NewsgroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class NewsgroupServiceImpl implements NewsgroupService {

    @Autowired
    private NewsgroupRepository newsgroupRepository;

    @Override
    public List<Newsgroup> findAll() {
        return newsgroupRepository.findAll();
    }

    @Override
    public Newsgroup findById(Long id) {
        return newsgroupRepository.findById(id).orElse(null);
    }
    @Override
    public Newsgroup save(Newsgroup newsgroup) {
        return newsgroupRepository.save(newsgroup);
    }

    @Override
    public void deleteById(Long id) {
        newsgroupRepository.deleteById(id);
    }
}

