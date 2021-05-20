package WeddingAgency.Models;

import java.sql.Date;

public class CommentRating {
    private int id;
    private int userId;
    private int organizatorId;
    private String comment;
    private int mark;
    private Date date;
    private String name;
    private String surname;

    public CommentRating(){
    }

    public CommentRating(int id, int userId, int organizatorId, String comment, int mark, Date date){
        id= id;
        this.userId = userId;
        this.organizatorId = organizatorId;
        this.comment = comment;
        this.mark = mark;
        this.date = date;
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

    public int getOrganizatorId() {
        return organizatorId;
    }

    public void setOrganizatorId(int organizatorId) {
        this.organizatorId = organizatorId;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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
}
