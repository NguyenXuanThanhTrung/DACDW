package fit.hcmuaf.news.entity;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idComment;

    private String content;
    private LocalDateTime createDate;

    @ManyToOne
    @JoinColumn(name = "id_news", referencedColumnName = "idNews")
    private News news;

    @ManyToOne
    @JoinColumn(name = "id_user", referencedColumnName = "idUser")
    private Users user;

    // Constructors
    public Comment() {}

    public Comment(String content, LocalDateTime createDate, News news, Users user) {
        this.content = content;
        this.createDate = createDate;
        this.news = news;
        this.user = user;
    }

    // Getters and setters
    public Long getIdComment() {
        return idComment;
    }

    public void setIdComment(Long idComment) {
        this.idComment = idComment;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
}

