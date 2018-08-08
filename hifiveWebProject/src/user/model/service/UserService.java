package user.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import user.exception.UserException;
import user.model.dao.UserDao;
import user.model.vo.User;

public class UserService {
	
	public UserService(){}
	
	public String loginCheck(String userId, String userPw) throws UserException{
		Connection con = getConnection();
		String userName = new UserDao().loginCheck(con, userId, userPw);
		close(con);
		return userName;
	}

	public ArrayList<User> selectAllUser() throws UserException {
		Connection con = getConnection();
		ArrayList<User> list = new UserDao().selectAllUser(con);
		close(con);		
		return list;
	}

	public int insertUser(User user) throws UserException {
		Connection con = getConnection();
		int result = new UserDao().insertUser(con, user);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int deleteUser(String userId) throws UserException {
		Connection con = getConnection();
		int result = new UserDao().deleteUser(con, userId);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public User selectUser(String userId) throws UserException {
		Connection con = getConnection();
		User user = new UserDao().selectUser(con, userId);
		close(con);
		return user;
	}

	public int updateUser(User user) throws UserException {
		Connection con = getConnection();
		int result = new UserDao().updateUser(con, user);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return 0;
	}
	
	public String searchId(String userEmail, String userPhone) throws UserException {
		Connection con = getConnection();
		String userId = new UserDao().searchId(con, userEmail, userPhone);
		close(con);
		return userId;
	}

	public int selectCheckId(String userId) {
		Connection con = getConnection();
		int result = 
				new UserDao().selectCheckId(con, userId);
		close(con);
		return result;
	}
}