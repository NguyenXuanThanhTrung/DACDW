package fit.hcmuaf.news.repository;

import fit.hcmuaf.news.entity.Newsgroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface NewsgroupRepository extends JpaRepository<Newsgroup, Long> {
    @Query("SELECT n.idNewsgroup FROM Newsgroup n WHERE n.idNewsgroup = :newsId")
    Long findIdNewsgroupByNewsId(Long newsId);
}

