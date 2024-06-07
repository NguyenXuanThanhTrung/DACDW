package fit.hcmuaf.news.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Entity
public class Newsgroup {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idNewsgroup;

    private String newsgroupname;
    private LocalDateTime updatedate;

    // Constructors
    public Newsgroup() {}

    public Newsgroup(String newsgroupname, LocalDateTime updatedate) {
        this.newsgroupname = newsgroupname;
        this.updatedate = updatedate;
    }

    // Getters and Setters
    public Long getIdNewsgroup() {
        return idNewsgroup;
    }

    public void setIdNewsgroup(Long idNewsgroup) {
        this.idNewsgroup = idNewsgroup;
    }

    public String getNewsgroupname() {
        return newsgroupname;
    }

    public void setNewsgroupname(String newsgroupname) {
        this.newsgroupname = newsgroupname;
    }

    public LocalDateTime getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(LocalDateTime updatedate) {
        this.updatedate = updatedate;
    }
}
