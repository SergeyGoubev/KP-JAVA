package WeddingAgency.DAO;
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
public class UserDAO {
    JdbcTemplate template;
    private static final Logger logger= LoggerFactory.getLogger(UserDAO.class);

    public List<User> getByCategory(int category){
        logger.info("Выполнение метода getByCategory для вывода организаторов по категориям");
        String Sql="select u.userId, u.name, u.surname, u.organizationName, " +
                "(select sum(mark)/count(*) from commentrating c where organizatorId=u.userId) as rating " +
                "from user u where category=" + category;
        try{
            return template.query(Sql,new RowMapper<User>(){
                public User mapRow(ResultSet rs, int row) throws SQLException {
                    User u =  new User();
                    u.setUserId(rs.getInt("userId"));
                    u.setName(rs.getString("name"));
                    u.setSurname(rs.getString("surname"));
                    u.setOrganizationName(rs.getString("organizationName"));
                    u.setRating(rs.getFloat("rating"));
                    return u;
                }
            });
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода getByCategory: ", e);
            return null;
        }
    }

    public User getUserById(int id){
        logger.info("Выполнение метода getUserById - получаем информацию о конкретном пользователе");
        String query="select * from user where userId=?";
        try{
            return template.queryForObject(query, new Object[]{id}, new BeanPropertyRowMapper<User>(User.class));
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода getUserById: ", e);
            return null;
        }
    }

    public byte[] getUserImage(int userId){
        logger.info("Выполнение метода getUserImage - получаем картинку");
        String query="select * from user where userId=?";
        try{
            return template.queryForObject(query, new Object[]{userId}, new BeanPropertyRowMapper<User>(User.class)).getImage();
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода getUserById: ", e);
            return null;
        }
    }

    public User checkUser(User user){
        logger.info("Выполнение метода checkUser - проверка пользователя при входе");
        String query="select * from user where login=? and password=?";
        try {
            return template.queryForObject(query, new Object[]{user.getLogin(), user.getPassword()}, new BeanPropertyRowMapper<User>(User.class));
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода checkUser: ", e);
            return null;
        }
    }

    public int insert(User user){
        logger.info("Выполнение метода insert - добавление нового клиента");
        String query="insert into user(userId, name, surname, age, telephone, email," +
                "weddingWishes, login, password, rating, typeOfUser) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        logger.info(query);
        Object[] params = {user.getUserId(), user.getName(), user.getSurname(),
                user.getAge(), user.getTelephone(), user.getEmail(),
                user.getWeddingWishes(), user.getLogin(), user.getPassword(), 0, 1};
        int[] types = {Types.INTEGER, Types.VARCHAR, Types.VARCHAR, Types.INTEGER, Types.VARCHAR,
                Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.FLOAT, Types.INTEGER};
        try {
            return template.update(query,params,types);
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода insert: ", e);
            return -1;
        }
    }

    public int insertOrg(User user){
        logger.info("Выполнение метода insertOrg - добавление нового организатора");
        String query="insert into user(userId, name, surname, age, telephone, email," +
                "description, category, image, organizationName, address, login, password," +
                "rating, typeOfUser) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        logger.info(query);
        Object[] params = {user.getUserId(), user.getName(), user.getSurname(),
                user.getAge(), user.getTelephone(), user.getEmail(), user.getDescription(),
                user.getCategory(),user.getImage(), user.getOrganizationName(),
                user.getAddress(), user.getLogin(), user.getPassword(), 0, 2};
        int[] types = {Types.INTEGER, Types.VARCHAR, Types.VARCHAR, Types.INTEGER,
                Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.INTEGER, Types.BLOB,
                Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.FLOAT, Types.INTEGER};
        try {
            return template.update(query,params,types);
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода insert: ", e);
            return -1;
        }
    }

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    /*public List<User> getAllUsers(){
        logger.info("Выполнение метода getAllUsers для вывода всех пользователей");
        try{
            return template.query("select * from user",new RowMapper<User>(){

                public User mapRow(ResultSet rs, int row) throws SQLException {
                    User u =  new User();
                    u.setUserId(rs.getInt("userId"));
                    u.setLogin(rs.getString("login"));
                    u.setPassword(rs.getString("password"));
                    u.setEmail(rs.getString("email"));
                    return u;
                }
            });

        }catch (Exception e){
            logger.error("Ошибка при выполнении метода getAllUsers: ", e);
            return null;
        }
    }*/

    /* public int update(User user){
        logger.info("Выполнение метода update - изменение данных о пользователе");
        String query="update user set name=?, surname=?, age=?, telephone=?, " +
                "email=?, login=?, password=?, weddingWishes=?, category=?, " +
                "description=?, typeOfUser=?, photo=?, organizationName=?, address=?  where userId=?";
        Object[] params = {user.getName(), user.getSurname(), user.getAge(), user.getTelephone(),
                user.getEmail(), user.getLogin(), user.getPassword(), user.getWeddingWishes(),
                user.getCategory(), user.getDescription(), user.getTypeOfUser(),
                user.getPhoto(), user.getOrganizationName(), user.getAddress()};
        int[] types = {Types.VARCHAR, Types.VARCHAR, Types.INTEGER, Types.VARCHAR,
                Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.INTEGER,
                Types.VARCHAR, Types.INTEGER, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR};
        try {
            return template.update(query,params,types);
        }catch (Exception e) {
            logger.error("Ошибка при выполнении метода update: ", e);
            return -1;
        }
    }*/
}
