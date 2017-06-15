package com.photovel.dao;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.Admin;

@Repository
public class AdminDAO{
	@Autowired
	private SqlSession session;
	
	/**
	 * 관리자 멤버를 반환한다.
	 * @return
	 */
	public List<Admin> selectAll(){
		return session.selectList("AdminMapper.selectAll");//id 값 , parameter로 보낼 값
	}

	/**
	 * 아이디에 해당하는 관리자를 반환한다
	 * @param adminId 아이디
	 * @return 저장소의 고객객체를 반환한다.
	 *         고객을 찾지 못하면 null을 반환한다.
	 */
	public Admin selectById(String admin_id){
		return session.selectOne("AdminMapper.selectById", admin_id);
	}

	/**
	 * 이름에 해당하는 고객을 반환한다
	 * @param name 이름
	 * @return
	 */
	public List<Admin> selectByName(String admin_nickname){
		return session.selectList("AdminMapper.selectByName", admin_nickname);//id 값 , parameter로 보낼 값
	}
	
	/**
	 * 상태에 해당하는 고객을 반환한다
	 * @param admin_status_flag 상태
	 * @return
	 */
	public List<Admin> selectByStatus(String admin_status_flag){
		return session.selectList("AdminMapper.selectByStatus", admin_status_flag);//id 값 , parameter로 보낼 값
	}
	
	/**
	 * 상태에 해당하는 고객을 반환한다
	 * @param admin_status_flag 상태
	 * @return
	 */
	public List<Admin> selectByDate(Date from_date, Date to_date){
		HashMap<String, Object> list = new HashMap<>();
		list.put("from_date", from_date);
		list.put("to_date", to_date);
		return session.selectList("AdminMapper.selectByDate", list);//id 값 , parameter로 보낼 값
	}
	
	/**
	 *  * 저장하려는 객체의 id가 저장소에 이미 존재하는 경우
	 * "이미 존재하는 아이디입니다"msg를 출력하고 저장안함.
	 * @param c
	 * @throws Exception 
	 */
	public void insert(Admin ad) throws Exception {
		session.insert("AdminMapper.insert", ad);//id 값 , parameter로 보낼 값
	};	

	public void update(Admin ad) throws Exception {
		session.update("AdminMapper.update", ad);
	}

	public void leave(String admin_id) throws Exception {
		session.update("AdminMapper.leave", admin_id);
	}
	
	public void stop(String admin_id) throws Exception{
		session.update("AdminMapper.stop", admin_id);
	}
	public void normal(String admin_id) throws Exception{
		session.update("AdminMapper.normal", admin_id);
	}


}