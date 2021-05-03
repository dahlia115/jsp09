package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jwoo", pwd = "1234";
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> list(){
		String sql = "select * from test_board";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			con = DriverManager.getConnection(url ,id, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNumber(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
			
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				
				dto.setSavedate(rs.getTimestamp("savedate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void write_save(BoardDTO dto) {
		String sql=
			"insert into test_board(id,name,title,content,idgroup,step,indent)"+
					"values(test_board_seq.nextval,?,?,?,test_board_seq.currval,0,0)";
	try {
		con = DriverManager.getConnection(url,id,pwd);
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getName() );
		ps.setString(2, dto.getTitle() );
		ps.setString(3, dto.getContent() );
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
}

















