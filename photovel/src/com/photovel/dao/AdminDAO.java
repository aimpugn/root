package com.photovel.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.BadSqlGrammarException;
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
	public List<Admin> selectAll() throws Exception {
		try{
			return session.selectList("AdminMapper.selectAll");//id 값 , parameter로 보낼 값
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 아이디에 해당하는 관리자를 반환한다
	 * @param adminId 아이디
	 * @return 저장소의 고객객체를 반환한다.
	 *         고객을 찾지 못하면 null을 반환한다.
	 */
	public Admin selectById(String adminId) throws Exception {
		try{
			return session.selectOne("AdminMapper.selectById", adminId);
		} catch (Exception e) {
			return null;
		} 
	}

	/**
	 * 이름에 해당하는 고객을 반환한다
	 * @param name 이름
	 * @return
	 */
	public List<Admin> selectByName(String adminNickName) throws Exception {
		try{
			return session.selectList("AdminMapper.selectByName", adminNickName);//id 값 , parameter로 보낼 값
		} catch (Exception e) {
			return null;
		} 
	}
	
	/**
	 *  * 저장하려는 객체의 id가 저장소에 이미 존재하는 경우
	 * "이미 존재하는 아이디입니다"msg를 출력하고 저장안함.
	 * @param c
	 * @throws Exception 
	 */
	public void insert(Admin ad) throws Exception {
		try{
			session.insert("AdminMapper.insert", ad);//id 값 , parameter로 보낼 값
		} catch (DuplicateKeyException e){ // Spring + MyBatis인 경우
											//SpringJDBC용 EXCEPTION이 발생됨
			throw new Exception("이미 존재하는 아이디입니다.");
		} catch(BadSqlGrammarException e){
			throw new Exception("SQL 구문 오류!");
		} catch(Exception e){
			e.printStackTrace();
		}
	};	


	public void update(Admin ad) throws Exception {
		try{
	         session.update("AdminMapper.update", ad);
	      }catch(BadSqlGrammarException e){
	         throw new Exception("SQL구문 오류");
	      }catch(Exception e){
	         throw e;
	      }
		
	}


	public void leave(Admin ad) throws Exception {
		try{
			session.update("AdminMapper.leave", ad);
	      }catch(BadSqlGrammarException e){
	         throw new Exception("SQL구문 오류");
	      }catch(Exception e){
	         throw e;
	      }
		
	}
	
	public void stop(Admin ad) throws Exception{

		try{
			session.update("AdminMapper.stop", ad);
	      }catch(BadSqlGrammarException e){
	         throw new Exception("SQL구문 오류");
	      }catch(Exception e){
	         throw e;
	      }
		
	}
	
	
	public void regist(Admin admin) throws Exception {
		this.insert(admin);		
	}

	
	public Admin login(String id, String pw) throws Exception {
		Admin ad = this.selectById(id);
		//String status = c.getStatus(); 다른 메시지를 주기 위해서 customercontroller에서 처리함
		//if( c == null || !(pw).equals(c.getPassword()) || "d".equals(status)){
		if( ad == null || !(pw).equals(ad.getAdminUserPassword()) ){
			throw new Exception("로그인 실패");
		}
		return ad;
	}

	public Admin findById(String id) throws Exception {
		 Admin ad = this.selectById(id);
	     return ad;
	}
	
	public void modify(Admin ad) throws Exception {
		this.update(ad);
	}
	
}
	







