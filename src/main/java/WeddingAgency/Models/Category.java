package WeddingAgency.Models;

public class Category {
    private int categoryId;
    private String name;

    public Category(){
    }

    public Category(int id, String name){
        categoryId= id;
        this.name = name;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int id) {
        this.categoryId = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
