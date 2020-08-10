package com.moon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.moon.dto.BoardListVO;
import com.moon.dto.BoardManageVO;
import com.moon.dto.BoardMemberVO;
import com.moon.dto.BoardApplyVO;
import com.moon.dto.BoardCommentVO;

import util.DBManager;

public class BoardListDAO {
	
	private BoardListDAO() {
	}

	private static BoardListDAO instance = new BoardListDAO();

	public static BoardListDAO getInstance() {
		return instance;
	}
	
	public List<BoardListVO> selectAllList(int id, int pageno) {
		//String sql = "select * from boardList where tableid=? order by num desc";
		//String sql = "select * from boardList a left outer join ( select l.num, count(*) as c from boardList l, boardcomment c where l.tableid=? and l.num = c.pboard group by l.num ) count on a.num = count.num where a.tableid=? order by a.num desc";
		String sql ="select  X.*"
				+ "	from ( "
				+ "	    select rownum as rnum, A.*"
				+ "	    from ("
				+ " select * from boardList a left outer join ( select l.num, count(*) as c from boardList l, boardcomment c where l.tableid=? and l.num = c.pboard group by l.num ) count on a.num = count.num where a.tableid=? order by a.num desc "
				+ "	        ) A"
				+ "	    where rownum <= ?) X"
				+ "	where X.rnum >= ?";
		
		List<BoardListVO> list = new ArrayList<BoardListVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setInt(2, id);
			pstmt.setInt(3, pageno*10);
			pstmt.setInt(4, (pageno-1)*10+1);
			rs = pstmt.executeQuery();
			
			while (rs.next()) { // 이동은 행(로우) 단위로
				BoardListVO bVo = new BoardListVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setTitle(rs.getString("title"));
				bVo.setId(rs.getString("id"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				bVo.setReadcount(rs.getInt("readcount"));
				if(Integer.toString(rs.getInt("c"))==null) {
					bVo.setReplyCount(0);
				}else {
					bVo.setReplyCount(rs.getInt("c"));
				}
				
				list.add(bVo);
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	//전체레코드 갯수 조회하기
		public int selectCountBoard(int id){
			String sql="select count(*) as recordCount from boardlist where tableid=?";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int recordCount=0;
			try{
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				
				rs=pstmt.executeQuery();
				if(rs.next()){
					recordCount=rs.getInt("recordCount");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				DBManager.close(conn, pstmt, rs);
			}
			return recordCount;
		}
	
	public String getTableTitle(int id) {
		String sql = "select title from manageboard where id=?";
		String title = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 이동은 행(로우) 단위로
				title = rs.getString("title");
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		
		return title;
	}
	
	
	
	
	
	public void insertBoardList(BoardListVO bVo) {
		String sql = "insert into boardlist(num, title, id, password, content, tableid)"
				+ " values(product_seq.nextval, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getTitle());
			pstmt.setString(2, bVo.getId());
			pstmt.setString(3, bVo.getPassword());
			pstmt.setString(4, bVo.getContent());
			pstmt.setInt(5, bVo.getTableid());
			pstmt.executeUpdate(); // 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 게시글이 무슨 게시판의 글인지 체크
	public String getTableId(int num) {
		String sql = "select tableid from boardlist where num=?";
		String tableid = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 이동은 행(로우) 단위로
				tableid = rs.getString("tableid");
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		
		return tableid;
	}

	
	
	public BoardListVO selectOneBoardList(Integer num) {
		String sql = "select * from boardlist where num=?";
		BoardListVO bVo = null;
		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bVo = new BoardListVO();
					bVo.setNum(rs.getInt("num"));
					bVo.setTitle(rs.getString("title"));
					bVo.setId(rs.getString("id"));
					bVo.setWritedate(rs.getTimestamp("writedate"));
					bVo.setReadcount(rs.getInt("readcount"));
					bVo.setPassword(rs.getString("password"));
					bVo.setContent(rs.getString("content"));
					bVo.setNum(num);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bVo;
	}

	
	public void updateBoardList(BoardListVO bVo) {
		String sql = "update boardlist set title=?, content=? where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getTitle());
			pstmt.setString(2, bVo.getContent());
			pstmt.setInt(3, bVo.getNum());
			pstmt.executeUpdate();// 쿼리문 실행한다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	
	// 타이틀로 게시판 id 찾기
	public int getIdByTitle(String title) {
		String sql = "select id from manageboard where title=?";
		int id = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 이동은 행(로우) 단위로
				id = rs.getInt("id");
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return id;
	}
	
	
	
	
	
	// 회원가입 중복체크
	public int checkDupleMember(String id) {
		String sql = "select count(*) as result from boardMember where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String checkId = id;
		String sqlResult = "";
		int result = 0;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 이동은 행(로우) 단위로
				sqlResult = rs.getString("result");
				result = Integer.parseInt(sqlResult);
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	
	
	// 회원가입 insert
	public void insertMember(BoardMemberVO mVo) {
		String sql = "insert into boardMember(no, id, pw, name, phoneNum) values(seq_boardMemNo.nextVal, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getId());
			pstmt.setString(2, mVo.getPw());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getPhonenum());
			pstmt.executeUpdate(); // 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	// 댓글 등록
	public void insertComment(BoardCommentVO cVo) {
		String sql = "insert into boardcomment(no, pboard, cid, cpw, comments, wdate) values(comment_seq.nextVal, ?, ?, ?, ?, sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cVo.getPboard());
			pstmt.setString(2, cVo.getCid());
			pstmt.setString(3, cVo.getCpw());
			pstmt.setString(4, cVo.getComments());
			pstmt.executeUpdate(); // 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 댓글 불러오기
	public List<BoardCommentVO> getCommentByPid(int pid) {
		String sql = "select * from boardcomment where pboard=? order by wdate";
		List<BoardCommentVO> list = new ArrayList<BoardCommentVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 이동은 행(로우) 단위로
				BoardCommentVO cVo = new BoardCommentVO();
				cVo.setPboard(rs.getInt("pboard"));
				cVo.setCid(rs.getString("cid"));
				cVo.setCpw(rs.getString("cpw"));
				cVo.setComments(rs.getString("comments"));
				cVo.setWdate(rs.getTimestamp("wdate"));
				
				list.add(cVo);
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	
	// 로그인 체크 1_아이디가 존재하는가
	public int checkExistId(String id) {
		String sql = "select count(*) as result from boardmember where id=?";
		String count = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 이동은 행(로우) 단위로
				count = rs.getString("result");
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		// id가 존재하지않는다면 0
		if(count.equals("0")) {
			return 0;
		}else {
			return 1;
		}
	}
	
	
	
	// 로그인 체크 2
	public int checkLogin(String id, String pw) {
		String sql = "select pw from boardmember where id=?";
		String readPw = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 이동은 행(로우) 단위로
				readPw = rs.getString("pw");
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		String inputPw = pw;
		
		// pw가 일치하면 1 다르면 0
		if(inputPw.equals(readPw)) {
			return 1;
		}else {
			return 0;
		}
	}
	
	
	// 배열형태로 게시판이름 전달
	public String getBoardList() {
		String sql = "select title from manageboard order by title";
		//String[] tableStr = new String[100];
		String str = "";
		int i = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if(i!=0) {
					str+=",";
				}
				str += rs.getString("title");
				i=1;
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		//tableStr += "]";
		return str;
	}
	
	
	// 게시글 검색 searchListByTitle
	public List<BoardManageVO> searchListByTitle(String title) {
		//String sql = "select * from boardList where tableid=? order by num desc";
		String sql = "select * from manageboard where title like ?";
		
		List<BoardManageVO> list = new ArrayList<BoardManageVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			rs = pstmt.executeQuery();
			
			while (rs.next()) { // 이동은 행(로우) 단위로
				BoardManageVO mVo = new BoardManageVO();
				mVo.setId(rs.getInt("id"));
				mVo.setTitle(rs.getString("title"));
				
				list.add(mVo);
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	
	// boardapply insert
	public void insertBoardApply(BoardApplyVO aVo) {
		String sql = "insert into boardapply values(boardapply_seq.nextval, ?, ?, ?, ?, ? )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aVo.getId());
			pstmt.setString(2, aVo.getTitle());
			pstmt.setString(3, aVo.getEmail());
			pstmt.setString(4, aVo.getContent());
			pstmt.setInt(5, aVo.getFlag());
			pstmt.executeUpdate(); // 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	// boardapply테이블에서 flag에 맞게 list 조회하기
	public List<BoardApplyVO> getApplyByFlag(int flag) {
		String sql = "select * from boardapply where flag=? order by num desc";
		
		List<BoardApplyVO> list = new ArrayList<BoardApplyVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, flag);
			rs = pstmt.executeQuery();
			
			while (rs.next()) { // 이동은 행(로우) 단위로
				BoardApplyVO aVo = new BoardApplyVO();
				aVo.setNum(rs.getInt("num"));
				aVo.setId(rs.getString("id"));
				aVo.setTitle(rs.getString("title"));
				aVo.setEmail(rs.getString("email"));
				aVo.setContent(rs.getString("content"));
				aVo.setFlag(flag);
				
				list.add(aVo);
			}// while문 끝
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	//apply 수정하기
	public void updateApplyByNum(int message, int num) {
		String sql = "update boardapply set flag=? where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, message);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();// 쿼리문 실행한다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	
	// 요청받은 테이블 admin이 삽입하기
	public void insertManageBoard(String title) {
		String sql = "insert into manageboard(id, title)"
				+ " values(manageboard_seq.nextval, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.executeUpdate(); // 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
}
