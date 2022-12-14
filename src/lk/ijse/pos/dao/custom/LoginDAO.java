package lk.ijse.pos.dao.custom;

import lk.ijse.pos.dao.CrudDAO;
import lk.ijse.pos.entity.Login;

import java.sql.SQLException;

public interface LoginDAO extends CrudDAO<Login, String> {
    Login userSearch(String userName, String password) throws SQLException, ClassNotFoundException;
}
