package fit.hcmuaf.news.impl;


import fit.hcmuaf.news.entity.Comment;
import fit.hcmuaf.news.repository.CommentRepository;
import fit.hcmuaf.news.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private final CommentRepository commentRepository;

    @Autowired
    public CommentServiceImpl(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }
    // phuong thuc lay list comment theo id
    @Override
    public List<Comment> getCommentsByNewsId(Long idNews) {
        return commentRepository.findByNewsIdNews(idNews);
    }
    @Override
    public void saveComment(Comment comment) {
        commentRepository.save(comment);
    }
    @Override
    public List<Comment> findAll() {
        return commentRepository.findAll();
    }

    @Override
    public Comment findById(Long id) {
        return commentRepository.findById(id).orElse(null);
    }

    @Override
    public Comment save(Comment comment) {
        return commentRepository.save(comment);
    }

    @Override
    public void deleteById(Long id) {
        commentRepository.deleteById(id);
    }
}
