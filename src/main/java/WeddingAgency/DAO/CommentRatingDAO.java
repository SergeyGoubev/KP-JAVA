package WeddingAgency.DAO;

import WeddingAgency.Models.CommentRating;
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
public class CommentRatingDAO {

    JdbcTemplate template;
    private static final Logger logger= LoggerFactory.getLogger(WeddingAgency.DAO.CategoryDAO.class);

    public int comment(CommentRating commentRating, int userId, int orgId){
        logger.info("Выполнение метода comment - добавление комментария и оценки");
        String query="insert into commentrating (userId, organizatorId, mark, comment) values (?, ?, ?, ?)";
        logger.info(query);
        Object[] params = {userId, orgId, commentRating.getMark(), commentRating.getComment()};
        int[] types = {Types.INTEGER, Types.INTEGER, Types.INTEGER, Types.VARCHAR};
        try {
            return template.update(query,params,types);
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода insert: ", e);
            return -1;
        }
    }

    public int getMark(int orgId, int userId){
        logger.info("Выполнение метода getMark - получение оценки");
        String query="select * from commentrating where userId=? and organizatorId=?";
        logger.info(query);
        Object[] params = {userId, orgId};
        try {
            CommentRating commentRating = template.queryForObject(query, params, new BeanPropertyRowMapper<CommentRating>(CommentRating.class));
            return commentRating.getMark();
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода getMark: ", e);
            return -1;
        }
    }

    public float getRating(int orgId){
        logger.info("Выполнение метода getRating - получение средней оценки");
        String query="select sum(mark)/count(*) as rating from commentrating where organizatorId=?";
        logger.info(query);
        Object[] params = {orgId};
        try {
            logger.info("rating "+orgId);
            float rating = template.queryForObject(query, params, Float.class);
            logger.info("rating "+rating);
            return rating;
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода getRating: ", e);
            return 0;
        }
    }

    public List<CommentRating> getCommentById(int orgId){
        logger.info("Выполнение метода getCommentById для вывода комментариев и оценок на страницу организатора");
        String Sql="select c.id, c.userId, c.organizatorId, c.comment, c.mark, c.date, u.name, u.surname " +
                "from commentrating c, user u where c.userId=u.userId and organizatorId=" + orgId + " order by c.date DESC";
        try{
            return template.query(Sql,new RowMapper<CommentRating>(){
                public CommentRating mapRow(ResultSet rs, int row) throws SQLException {
                    CommentRating c =  new CommentRating();
                    c.setId(rs.getInt("id"));
                    c.setUserId(rs.getInt("userId"));
                    c.setOrganizatorId(rs.getInt("organizatorId"));
                    c.setComment(rs.getString("comment"));
                    c.setMark(rs.getInt("mark"));
                    c.setDate(rs.getDate("date"));
                    c.setName(rs.getString("name"));
                    c.setSurname(rs.getString("surname"));
                    return c;
                }
            });
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода getCommentById: ", e);
            return null;
        }
    }

    public void setTemplate(JdbcTemplate template) {
            this.template = template;
        }
}

