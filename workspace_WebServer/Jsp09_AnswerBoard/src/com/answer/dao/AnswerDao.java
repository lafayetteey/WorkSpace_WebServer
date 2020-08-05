package com.answer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.answer.dto.AnswerDto;

import common.JDBCTemplate;

public class AnswerDao extends JDBCTemplate{
	
	public List<AnswerDto> selectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<AnswerDto> res = new ArrayList<>();
		String sql = "SELECT * FROM ANSWERBOARD ORDER BY GROUPNO DESC, GROUPSQ ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04 . query실행 및 리턴");
			
			while(rs.next() ) {
				AnswerDto dto = 
						new AnswerDto(rs.getInt(1), rs.getInt(2) , rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6) , rs.getString(7) , rs.getDate(8));
				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3 / 4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
	
	public int insert(AnswerDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "INSERT INTO ANSWERBOARD VALUES"
				+ "(BOARDNOSQ.NEXTVAL  , GROUPNOSQ.NEXTVAL , 1 , 0 , ? , ? , ? , SYSDATE)";
		
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getWriter());
			System.out.println("03단계. query 준비 :" + sql );
	
			
			res = pstm.executeUpdate();
			System.out.println("04단계.query실행 및 리턴 ");
			
			if(res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3 / 4단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
	public AnswerDto selectOne(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		AnswerDto res = null;
		String sql = "SELECT * FROM ANSWERBOARD WHERE BOARDNO = ? ";
		
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴 ");
			while(rs.next()) {
				res = new AnswerDto();
				res.setBoardno(rs.getInt(1));
				res.setGroupno(rs.getInt(2));
				res.setGroupsq(rs.getInt(3));
				res.setTitletab(rs.getInt(4));
				res.setTitle(rs.getString(5));
				res.setContent(rs.getString(6));
				res.setWriter(rs.getString(7));
				res.setRegdate(rs.getDate(8));
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;	
	}
	
	//answer - update
	public int updateAnswer(int parentgroupno , int parentgroupsq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "UPADTE ANSWERBOARD SET GROUPSQ = GROUPSQ+1"
				+ "WHERE GROUPNO=? AND GROUPSQ > ?";
		
		String sql2 = "UPDATE ANSWERBOARD SET GROUPSQ = GROUPSQ+1"
				+ "WHERE GROUPNO = (SELECT GROUPNO FROM ANSWERBOARD WHERE BOARDNO = ? ) AND"
				+ "GROUPSQ > (SELECT GROUPSQ FROM ANSWERBOARD WHERE BOARDNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, parentgroupno);
			pstm.setInt(2, parentgroupsq);
			System.out.println("03. query 준비 : " +sql );
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
	//answer - insert
	public int insertAnswer(AnswerDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0; 
		String sql = "INSERT INTO ANSWERBOARD VALUES(BOARDNOSQ.NEXTVAL , ? , ? , ? , ? , ? , ? , SYSDATE )";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getGroupno());
			//부모의 그룹시퀀스와 타이틀탭을 1씩 증가시킨다.
			pstm.setInt(2, dto.getGroupsq()+1);
			pstm.setInt(3, dto.getTitletab()+1);
			pstm.setString(4, dto.getTitle());
			pstm.setString(5, dto.getContent());
			pstm.setString(6, dto.getWriter());
			System.out.println("03.query 준비 : " +sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res >0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		return res;	
	}
}
