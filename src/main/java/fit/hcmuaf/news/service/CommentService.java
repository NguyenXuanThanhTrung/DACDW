package fit.hcmuaf.news.service;


import fit.hcmuaf.news.entity.Comment;

import java.util.List;
public interface CommentService {
    List<Comment> getCommentsByNewsId(Long idNews);
    void saveComment(Comment comment);
    List<Comment> findAll();
    Comment findById(Long id);
    Comment save(Comment comment);
    void deleteById(Long id);
}