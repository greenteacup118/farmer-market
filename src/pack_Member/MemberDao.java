package pack_Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pack_DBCP.DBConnectionMgr;
import pack_Goods.GoodsBean;

public class MemberDao {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private DBConnectionMgr pool = null;
	String sql = "";

	public MemberDao() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// id 중복확인
	public boolean checkId(String uId) {
		int chkRes = 0;

		try {
			conn = pool.getConnection();
			// uId에 해당하는 갯수 확인
			sql = "select count(*) from member where uId=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				chkRes = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		// 0이 반환되면 중복 없음
		return chkRes == 0 ? true : false;
	}

	// 로그인 메서드
	public boolean loginMember(String uId, String uPw) {
		boolean flag = false;

		try {
			conn = pool.getConnection();
			sql = "select uId from member where uId=? and uPw=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uId);
			pstmt.setString(2, uPw);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return flag;
	}

	// 회원가입 메서드
	public boolean insertMember(MemberBean bean) {
		boolean flag = false;

		try {
			conn = pool.getConnection();
			sql = "insert into member (uId, uPw, uName, uEmail, uPhone, uAddr,"
					+ "uGender, uBirth, joinTime) values(?,?,?,?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getuId());
			pstmt.setString(2, bean.getuPw());
			pstmt.setString(3, bean.getuName());
			pstmt.setString(4, bean.getuEmail());
			pstmt.setString(5, bean.getuPhone());
			pstmt.setString(6, bean.getuAddr());
			pstmt.setString(7, bean.getuGender());
			pstmt.setString(8, bean.getuBirth());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}

		return flag;
	}

	// 회원정보 가져오기 메서드
	public MemberBean selectMemberOne(String uId) {
		MemberBean mem = new MemberBean();

		try {
			conn = pool.getConnection();
			sql = "select * from member where uId=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mem.setuId(rs.getString("uId"));
				mem.setuPw(rs.getString("uPw"));
				mem.setuName(rs.getString("uName"));
				mem.setuEmail(rs.getString("uEmail"));
				mem.setuPhone(rs.getString("uPhone"));
				mem.setuAddr(rs.getString("uAddr"));
				mem.setuGender(rs.getString("uGender"));
				mem.setuBirth(rs.getString("uBirth"));
				mem.setJoinTime(rs.getString("joinTime"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return mem;
	}

	// 회원 정보 변경 메서드
	public boolean updateMember(MemberBean bean, String uId) {
		boolean flag = false;

		try {
			conn = pool.getConnection();
			sql = "Update member set uPw=?, uName=?, uEmail=?, uPhone=?, uAddr=?, uGender=?,"
					+ "uBirth = ? where uId=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getuPw());
			pstmt.setString(2, bean.getuName());
			pstmt.setString(3, bean.getuEmail());
			pstmt.setString(4, bean.getuPhone());
			pstmt.setString(5, bean.getuAddr());
			pstmt.setString(6, bean.getuGender());
			pstmt.setString(7, bean.getuBirth());
			pstmt.setString(8, uId);
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}

		return flag;
	}

	// 회원 탈퇴 메서드
	public boolean deleteMember(String uId) {
		boolean flag = false;

		try {
			conn = pool.getConnection();
			sql = "delete from member where uId=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uId);
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}

		return flag;
	}
	
}
