package WeddingAgency.DAO;
import WeddingAgency.Models.Guests;
import WeddingAgency.Models.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

@Repository
public class GuestsDAO {

    JdbcTemplate template;
    private static final Logger logger= LoggerFactory.getLogger(CategoryDAO.class);

    public List<Guests> getGuestsById(int userId){
        logger.info("Выполнение метода getGuestsById для вывода списка гостей");
        String Sql="select * from guests where userId=" + userId;
        try{
            return template.query(Sql,new RowMapper<Guests>(){
                public Guests mapRow(ResultSet rs, int row) throws SQLException {
                    Guests g =  new Guests();
                    g.setId(rs.getInt("id"));
                    g.setName(rs.getString("name"));
                    g.setSurname(rs.getString("surname"));
                    g.setComment(rs.getString("comment"));
                    return g;
                }
            });
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода getGuestsById: ", e);
            return null;
        }
    }

    public int insertGuest(int userId, Guests guest){
        logger.info("Выполнение метода insertGuest - добавление нового гостя");
        String query="insert into guests(userId, name, surname, comment) values (?, ?, ?, ?)";
        logger.info(query + guest.getName());
        Object[] params = {userId, guest.getName(), guest.getSurname(), guest.getComment()};
        int[] types = {Types.INTEGER, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR};
        try {
            return template.update(query,params,types);
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода insertGuest: ", e);
            return -1;
        }
    }

    public int deleteGuest(int id){
        logger.info("Выполнение метода delete - удаление гостя");
        String query="delete from guests where id=?";
        Object[] params = {id};
        int[] types = {Types.INTEGER};
        try {
            return template.update(query,params,types);
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода delete: ", e);
            return -1;
        }
    }

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
}
