package fit.hcmuaf.news.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idUser;

    private String name;
    private String address;
    private String email;
    private String phonenumber;
    private String username;
    private String password;
    private String sex;
    private LocalDateTime updatedate;
    private LocalDateTime dateofbirth;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Comment> comments = new ArrayList<>();

    // Constructors
    public Users() {}

    public Users(String name, String address, String email, String phonenumber, String username, String password, String sex, LocalDateTime updatedate, LocalDateTime dateofbirth) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.phonenumber = phonenumber;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.updatedate = updatedate;
        this.dateofbirth = dateofbirth;
    }

    // Getters and setters
    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public LocalDateTime getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(LocalDateTime updatedate) {
        this.updatedate = updatedate;
    }

    public LocalDateTime getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(LocalDateTime dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}