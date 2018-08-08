package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import review.model.dao.ReviewDao;
import review.model.vo.Review;

public class ReviewService {
	
	public ReviewService(){}
	
	// 리뷰 전체 조회
	public ArrayList<Review> selectAllReview() throws ReviewException {
		Connection con = getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReview(con);
		close(con);
		return list;
	}
	
	// 리뷰 등록
	public int insertReview(Review review, String user_id, String r_user_id) throws ReviewException {
		Connection con = getConnection();
		int result = new ReviewDao().insertReview(con, review, user_id, r_user_id);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		return result;
	}
	
	// 리뷰 수정
	public int updateReview(Review review) throws ReviewException {
		Connection con = getConnection();
		int result = new ReviewDao().updateReview(con, review);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		return result;
	}
			
	// 리뷰 삭제
	public int updateReview(int review_no) throws ReviewException {
		Connection con = getConnection();
		int result = new ReviewDao().deleteReview(con, review_no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		return result;
	}
				
}
