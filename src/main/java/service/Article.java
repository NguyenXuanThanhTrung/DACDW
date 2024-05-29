package service;
public  class Article {
    private String title;
    private String author;
    private String timestamp;

    public Article(String title, String author, String timestamp) {
        this.title = title;
        this.author = author;
        this.timestamp = timestamp;
    }

    public Article(String title, String aliceCloe, String timestamp, String s, String s1) {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}