package fit.hcmuaf.news.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class News {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idNews;
    private String title;
    private String image;
    private String newsquote;
    private String content;
    private int numberofreads;
    private LocalDateTime createDay;

    @ManyToOne
    @JoinColumn(name = "id_category", referencedColumnName = "idCategory")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "id_newsgroup", referencedColumnName = "idNewsgroup")
    private Newsgroup newsgroup;

    @ManyToOne
    @JoinColumn(name = "id_user", referencedColumnName = "idUser")
    private Users user;

    @OneToMany(mappedBy = "news", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Comment> comments = new ArrayList<>();

    // Constructors
    public News() {
    }

    public News(String title, String image, String newsquote, String content, int numberofreads, LocalDateTime createDay, Category category, Newsgroup newsgroup, Users user) {
        this.title = title;
        this.image = image;
        this.newsquote = newsquote;
        this.content = content;
        this.numberofreads = numberofreads;
        this.createDay = createDay;
        this.category = category;
        this.newsgroup = newsgroup;
        this.user = user;
    }

    // Getters and setters
    public Long getIdNews() {
        return idNews;
    }

    public void setIdNews(Long idNews) {
        this.idNews = idNews;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNewsquote() {
        return newsquote;
    }

    public void setNewsquote(String newsquote) {
        this.newsquote = newsquote;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getNumberofreads() {
        return numberofreads;
    }

    public void setNumberofreads(int numberofreads) {
        this.numberofreads = numberofreads;
    }

    public LocalDateTime getCreateDay() {
        return createDay;
    }

    public void setCreateDay(LocalDateTime createDay) {
        this.createDay = createDay;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Newsgroup getNewsgroup() {
        return newsgroup;
    }

    public void setNewsgroup(Newsgroup newsgroup) {
        this.newsgroup = newsgroup;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
