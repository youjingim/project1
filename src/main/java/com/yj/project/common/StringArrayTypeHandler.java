package com.yj.project.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringArrayTypeHandler implements TypeHandler<String []>{
	
	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		if(parameter != null) {
			ps.setString(i, String.join(",", parameter));
		}else {
			ps.setString(i, "");
		}
		
	}
	/*컬럼명으로 resultSet에 있는 자료를 가져올때 설정*/

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String [] result=null;
		if(rs.getString(columnName)!=null) {
		String columnValue=rs.getString(columnName);
		result=columnValue.split(",");
		}
		return result;
	}
	/*index로 resultSet에 있는 자료를 가져올때 설정*/
	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String columnValue=rs.getString(columnIndex);
		String [] result=columnValue.split(",");
		return result;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String columnValue=cs.getString(columnIndex);
		String [] result=columnValue.split(",");
		return result;
	}

}
