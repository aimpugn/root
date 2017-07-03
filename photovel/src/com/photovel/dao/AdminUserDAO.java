package com.photovel.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.AdminUser;
import com.photovel.vo.User;


@Repository
public class AdminUserDAO {

	@Autowired
	private SqlSession session;
	

	/**
	 * 유저리스트를 반환한다.
	 * @return
	 */
	public List<AdminUser> selectAll(){
		return session.selectList("AdminUserMapper.selectAll");//id 값 , parameter로 보낼 값
	}
	/**
	 * 아이디에 해당하는 유저를 반환한다
	 * @param uerId 아이디
	 * @return 저장소의 고객객체를 반환한다.
	 *         고객을 찾지 못하면 null을 반환한다.
	 */
	public AdminUser selectById(String user_id){
		return session.selectOne("AdminUserMapper.selectById", user_id);
	}
	/**
	 * 아이디에 해당하는  유저를 반환한다
	 * @param uerId 아이디
	 * @return 저장소의 고객객체를 반환한다.
	 *         고객을 찾지 못하면 null을 반환한다.
	 */
	public List<AdminUser> selectByIds(String user_id){
		return session.selectList("AdminUserMapper.selectByIds", user_id);
	}

	/**
	 * 닉네임 해당하는  유저를 반환한다
	 * @param user_ninkname 닉네임이름
	 * @return
	 */
	public List<AdminUser> selectByName(String user_nickname){
		return session.selectList("AdminUserMapper.selectByName", user_nickname);//id 값 , parameter로 보낼 값
	}
	
	/**
	 * 상태에 해당하는  유저를 반환한다
	 * @param user_state_flag 상태
	 * @return
	 */
	public List<AdminUser> selectByState(String user_state_flag){
		return session.selectList("AdminUserMapper.selectByState", user_state_flag);//id 값 , parameter로 보낼 값
	}
	
	/**
	 * 상태에 해당하는  유저를반환한다
	 * @param user_state_flag 상태
	 * @return
	 */
	public List<AdminUser> selectByDate(Date from_date, Date to_date){
		HashMap<String, Object> list = new HashMap<>();
		list.put("from_date", from_date);
		list.put("to_date", to_date);
		return session.selectList("AdminUserMapper.selectByDate", list);//id 값 , parameter로 보낼 값
	}
	/**
	 * F: 여자, M: 남자
	 * @return 가입회원의 성별별 인원수를 리턴한다.
	 */
	public List<AdminUser> selectByGender() {
		return session.selectList("AdminUserMapper.selectByGender");
	}
	/**
	 *  * 어드민에서 회원 추가시 : 저장하려는 객체의 id가 저장소에 이미 존재하는 경우
	 * "이미 존재하는 아이디입니다 msg를 출력하고 저장안함.
	 * @param c
	 * @throws Exception 
	 */
	public void insertAdminUser(AdminUser user) throws Exception {
		HashMap<String, Object> list = new HashMap<>();
		list.put("user_password", user.getUser_password());
		list.put("user_nick_name", user.getUser_nick_name());
		list.put("user_gender", user.getUser_gender());
		list.put("user_phone1", user.getUser_phone1());
		list.put("user_phone2", user.getUser_phone2());
		list.put("user_profile_photo", user.getUser_profile_photo());
		list.put("user_state_flag", user.getUser_state_flag());
		list.put("user_id", user.getUser_id());
		//session.insert("AdminUserMapper.insertUser", user);//id 값 , parameter로 보낼 값
		session.insert("AdminUserMapper.insertAdminUser", user);
	};	
	public void update(AdminUser user) throws Exception {
		session.update("AdminUserMapper.update", user);
	}
	public void leave(String user_id) throws Exception {
		session.update("AdminUserMapper.leave", user_id);
	}
	public void black(String user_id) throws Exception{
		session.update("AdminUserMapper.black", user_id);
	}
	public void normal(String user_id) throws Exception{
		session.update("AdminUserMapper.normal", user_id);
	}
	
}
