package WeddingAgency.Models;

public class Guests {
    private int id;
    private int userId;
    private String name;
    private String surname;
    private String comment;

    public Guests(){
    }

    public Guests(int id, int userId, String name, String surname, String comment){
        id= id;
        this.userId = userId;
        this.name = name;
        this.surname = surname;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
