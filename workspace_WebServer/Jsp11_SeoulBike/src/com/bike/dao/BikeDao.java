package com.bike.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.bike.dto.BikeDto;

import common.JDBCTemplate;

public class BikeDao extends JDBCTemplate {
	
	public int insert(List<BikeDto> dtos) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "INSERT INTO BIKE_TB VALUES( ? , ? , ? ,? , ? , ? ,? )";
		
		try {
			pstm = con.prepareStatement(sql);
			
			int cnt   = 0 ;
			for(int i=0; i<dtos.size(); i++) {
				BikeDto dto = dtos.get(i);
				
				pstm.setString(1, dto.getAddr_gu());
				pstm.setInt(2, dto.getContent_id());
				pstm.setString(3, dto.getContent_nm());
				pstm.setString(4, dto.getNew_addr());
				pstm.setInt(5, dto.getCradle_count());
				pstm.setDouble(6, dto.getLongitude());
				pstm.setDouble(7,dto.getLatitude());
				
				pstm.addBatch();
				cnt++;
			}
			System.out.println("03. query 준비 :" + sql + "(총 " + cnt + " 개)");
			
			int[] result = pstm.executeBatch();
			System.out.println("04. query 실행 및 리턴");
			
			for(int i=0; i<result.length; i++) {
				//addbatch 성공 시 리턴값은 -2 
				if(result[i] == - 2) {
					res++;
				}
			}
			if(res == dtos.size() ) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println(" 3 / 4 단계 오류 ");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		return res;
		
	}
	public int delete() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " DELETE FROM BIKE_TB ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비");
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res > 0 ) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		
		return res;
	}
}
