package hsp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hsp.model.service.SurferPartnerService;
import hsp.model.vo.SurferPartner;
import user.model.vo.User;

/**
 * Servlet implementation class SurferSearchServlet
 */
@WebServlet("/surfersearch")
public class SurferSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurferSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String destination = request.getParameter("destination");
		int num = Integer.parseInt(request.getParameter("num").trim());
		Date startDate = java.sql.Date.valueOf(request.getParameter("startdate"));
		Date endDate = java.sql.Date.valueOf(request.getParameter("enddate"));
		System.out.println("넘어온값 : "+destination+","+num+","+startDate+","+endDate);
		
		SurferPartner sp = new SurferPartner();
		sp.setCity(destination);
		sp.setUser_num(num);
		sp.setStart_date(startDate);
		sp.setEnd_date(endDate);
		
		ArrayList<User> list = new SurferPartnerService().searchSP(sp, 's');		
		
		JSONObject job1 = new JSONObject();
		JSONArray jar = new JSONArray();
		
		for(User u : list){
			JSONObject job2 = new JSONObject();
			job2.put("id", u.getUser_Id());
			job2.put("name", u.getUser_Name());
			job2.put("address", u.getAddress());
			job2.put("nationality", u.getNationality());
			job2.put("image", u.getProfile_image());
			jar.add(job2);			
		}				
		job1.put("list", jar);		
		System.out.println("가져온값 : "+job1.toJSONString());
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.append(job1.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
