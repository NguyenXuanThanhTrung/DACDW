package fit.hcmuaf.news.controller;
public class Login {
    private String email;
    private String password;

    // Constructors
    public Login() {}

    public Login(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // Getters and setters
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Method to authenticate user
    public boolean authenticate() {
        // Add authentication logic here
        return "user@example.com".equals(this.email) && "password123".equals(this.password);
    }
}
