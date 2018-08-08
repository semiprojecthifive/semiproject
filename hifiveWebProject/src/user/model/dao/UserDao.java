package user.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import user.exception.UserException;
import user.model.vo.User;

public class UserDao {

	public UserDao() {}
	
	// 로그인
	public String loginCheck(Connection con, String userId, String userPw) throws UserException {
		String userName = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String query = "select * from users "
				+ "where user_id = ? and user_pw = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
				userName = rset.getString("user_name");
			else
				throw new UserException("아이디나 비밀번호가 일치하지 않습니다.");			
		} catch(Exception e){
			e.printStackTrace();
			throw new UserException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}		
		return userName;
	}
	
	// 관리자용 회원 전체 조회
	public ArrayList<User> selectAllUser(Connection con) throws UserException {
		ArrayList<User> list = new ArrayList<User>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from users";
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				User user = new User();
				user.setUser_Id(rset.getString("user_id"));
				user.setUser_Pw(rset.getString("user_pw"));
				user.setUser_Name(rset.getString("user_name"));
				user.setEmail(rset.getString("email"));
				user.setPhone(rset.getString("phone"));
				user.setBirth(rset.getDate("birth"));
				user.setGender(rset.getString("gender"));
				user.setJoin_Date(rset.getDate("join_date"));
				user.setSafety_check(rset.getString("safety"));
				user.setNationality(rset.getString("nationality"));
				user.setAddress(rset.getString("address"));
				user.setHobby(rset.getString("hobby"));
				user.setJob(rset.getString("job"));
				user.setLanguage(rset.getString("language"));
				user.setContent(rset.getString("content"));
				user.setRestriction(rset.getString("restriction"));
				user.setProfile_image(rset.getString("profile_image"));

				list.add(user);
			}			
			if(list.size() == 0)
				throw new UserException("회원 정보가 존재하지 않습니다.");			
		} catch(Exception e){
			e.printStackTrace();
			throw new UserException(e.getMessage());
		} finally{
			close(rset);
			close(stmt);
		}		
		return list;
	}
	
	// 회원가입
	public int insertUser(Connection con, User user) throws UserException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into users values "
				+ "(?, ?, ?, ?, ?, ?, ?, sysdate, default, '', '', '', '', '', '', default, '')";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getUser_Id());
			pstmt.setString(2, user.getUser_Pw());
			pstmt.setString(3, user.getUser_Name());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setDate(6, user.getBirth());
			pstmt.setString(7, user.getGender());
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new UserException("회원 가입 실패");	
		} catch(Exception e){
			e.printStackTrace();
			throw new UserException(e.getMessage());
		} finally{
			close(pstmt);
		}
		
		return result;
	}
	
	// 회원탈퇴
	public int deleteUser(Connection con, String userId) throws UserException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from users where user_id = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new UserException("회원 탈퇴 실패");			
		} catch(Exception e){
			e.printStackTrace();
			throw new UserException(e.getMessage());
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	// 회원 한 명 선택
	public User selectUser(Connection con, String userId) throws UserException {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from users where user_id = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				user = new User();
				user.setUser_Id(userId);
				user.setUser_Pw(rset.getString("user_pw"));
				user.setUser_Name(rset.getString("user_name"));
				user.setEmail(rset.getString("email"));
				user.setPhone(rset.getString("phone"));
				user.setBirth(rset.getDate("birth"));
				user.setGender(rset.getString("gender"));
				user.setJoin_Date(rset.getDate("join_date"));
				user.setSafety_check(rset.getString("safety_check"));
				user.setNationality(rset.getString("nationality"));
				user.setAddress(rset.getString("address"));
				user.setHobby(rset.getString("hobby"));
				user.setJob(rset.getString("job"));
				user.setLanguage(rset.getString("language"));
				user.setContent(rset.getString("contents"));	
				user.setRestriction(rset.getString("restriction"));
				user.setProfile_image(rset.getString("profile_image"));
			} else {
				throw new UserException("회원 조회 실패");
			}
		} catch(Exception e){
			e.printStackTrace();
			throw new UserException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		return user;
	}
	
	// 회원 정보 수정
	public int updateUser(Connection con, User user) throws UserException {
		int result = 0;
		
		
		return result;
	}
	
	// 아이디 찾기
	public String searchId(Connection con, String userEmail, String userPhone) throws UserException{
		String userId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from users "
				+ "where email = ? and phone = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userPhone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				userId = rset.getString("user_id");						
			} else {
				throw new UserException("회원 조회 실패");
			}
		} catch(Exception e){
			e.printStackTrace();
			throw new UserException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		return userId;
	}

	public int selectCheckId(Connection con, String userId) {
		int idCount = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(user_id) "
						+ "from users where user_id = ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				idCount = rset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return idCount;
		
	}
}