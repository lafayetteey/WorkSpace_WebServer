package com.mvc.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.dto.MyMVCDto;

public class MyMVCDaoImpl implements MyMVCDao {
	
	
	
	@Override
	public List<MyMVCDto> selectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MyMVCDto> res = new ArrayList<>();
		
		try {
			pstm = con.prepareStatement(selectAllsql);
			System.out.println("03. query 준비 : " + selectAllsql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while(rs.next()) {
				MyMVCDto dto = new MyMVCDto(rs.getInt(1), rs.getString(2) , rs.getString(3) , rs.getString(4) , rs.getDate(5));
				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3 /4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}

	@Override
	public MyMVCDto selectOne(int seq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyMVCDto res = null;
		
		try {
			pstm = con.prepareStatement(selectOnesql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비");
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while(rs.next() ) {
					res = new MyMVCDto();
					res.setSeq(rs.getInt(1));
					res.setWriter(rs.getString(2));
					res.setTitle(rs.getString(3));
					res.setContent(rs.getString(4));
					res.setRegdate(rs.getDate(5));
			}
		} catch (SQLException e) {
			System.out.println("3 / 4 단계 오류 ");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		
		return res;
	}

	@Override
	public boolean insert(MyMVCDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(insertsql);
			pstm.setString(1, dto.getWriter());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			System.out.println("03. query 준비" + insertsql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			if(res > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3, 4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return (res > 0)? true : false;
	}

	@Override
	public boolean update(MyMVCDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(updatesql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());
			System.out.println("03. query 준비 : "+ updatesql);
			
			res = pstm.executeUpdate();
			System.out.println("04. querty 실행 및 리턴 ");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return ( res > 0 )? true : false;
	}

	@Override
	public boolean delete(int seq) {
		return false;
	}

}
