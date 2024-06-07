package fit.hcmuaf.news.repository;


import fit.hcmuaf.news.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    // Add custom query methods if needed
    List<Comment> findByNewsIdNews(Long idNews);
}

