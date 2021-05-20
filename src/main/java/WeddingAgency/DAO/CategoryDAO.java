package WeddingAgency.DAO;
import WeddingAgency.Models.Category;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
    JdbcTemplate template;
    private static final Logger logger= LoggerFactory.getLogger(CategoryDAO.class);

    public Category getCategory(int id){
        logger.info("Выполнение метода getCategory - получаем название категрии организаторов");
        String query="select * from category where id=?";
        try{
            return template.queryForObject(query, new Object[]{id}, new BeanPropertyRowMapper<Category>(Category.class));
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода getCategory: ", e);
            return null;
        }
    }

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
}
