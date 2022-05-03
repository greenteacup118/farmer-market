package pack_MyPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pack_DBCP.DBConnectionMgr;
import pack_Goods.GoodsBean;
import pack_Member.MemberBean;

public class MyPageDao {
	private Connection objConn = null;
	private Statement objStmt = null;
	private ResultSet objRs = null;
	private PreparedStatement objPStmt = null;
	private DBConnectionMgr pool = null;
	String sql = "";

	public MyPageDao() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("DBCP E:" + e.getMessage());
		}
	}

	// 주문하기 버튼 클릭시 주문내역에 담기
	public boolean insertOrderList(String uId, String goodsCode, int goodsCnt, int goodsPrice, int eventRate) {
		boolean flag = false;
		try {
			objConn = pool.getConnection();
			sql = "insert into orderList (uId, goodsCode, goodsCnt, goodsPrice, eventRate, buyTime) values(?,?,?,?,?,now())";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objPStmt.setString(2, goodsCode);
			objPStmt.setInt(3, goodsCnt);
			objPStmt.setInt(4, goodsPrice);
			objPStmt.setInt(5, eventRate);

			if (objPStmt.executeUpdate() == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}
		return flag;
	}

	// 주문내역 메서드
	public List<OrderListBean> selectOrderList(String uId, String where) {
		List<OrderListBean> list = new ArrayList<>();
		try {
			objConn = pool.getConnection();
			sql = "select buyTime, goodsCode, goodsCnt from orderList where uId =?";

			if (!where.equals("") || where != null) {
				String sql2 = " and buyTime like '" + where + "%'";
				sql += sql2;
			}
			
			sql += "order by buyTime DESC";
			
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objRs = objPStmt.executeQuery();

			while (objRs.next()) {
				OrderListBean goods = new OrderListBean();
				goods.setuId(uId);
				goods.setGoodsCode(objRs.getString("goodsCode"));
				goods.setGoodsCnt(objRs.getInt("goodsCnt"));
				goods.setBuyTime(objRs.getString("buyTime"));
				list.add(goods);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return list;
	}

	// 찜한 목록 메서드
	public List<GoodsBean> selectWishList(String uId) {
		List<GoodsBean> list = new ArrayList<>();
		try {

			objConn = pool.getConnection();
			sql = "select g.goodsImg, g.goodsName, g.goodsPrice, g.goodsCode from goods g left join wishlist on g.goodsCode = wishlist.goodsCode where wishlist.uid =?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objRs = objPStmt.executeQuery();

			while (objRs.next()) {
				GoodsBean goods = new GoodsBean();
				goods.setGoodsImg(objRs.getString("goodsImg"));
				goods.setGoodsName(objRs.getString("goodsName"));
				goods.setGoodsPrice(objRs.getInt("goodsPrice"));
				goods.setGoodsCode(objRs.getString("goodsCode"));

				list.add(goods);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return list;
	}

	// 상품찜하기 - insert
	public boolean insertWishList(String uId, String goodsCode) {
		boolean flag = false;
		try {
			objConn = pool.getConnection();
			sql = "insert into wishList (uId, goodsCode) values(?,?)";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objPStmt.setString(2, goodsCode);

			if (objPStmt.executeUpdate() == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}
		return flag;
	}

	// 찜한목록 중복확인
	public boolean checkWish(String goodsCode) {
		int chkRes = 0;
		String sql = "";

		try {
			objConn = pool.getConnection();
			// goodsCode에 해당하는 갯수 확인
			sql = "select count(*) from wishList where goodsCode=?";

			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, goodsCode);

			objRs = objPStmt.executeQuery();

			if (objRs.next()) {
				chkRes = objRs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}

		// 0이 반환되면 중복 없음
		return chkRes == 0 ? true : false;
	}

	// 찜한 목록 삭제 메서드
	public boolean deleteWishList(String goodsCode) {
		int rs = 0;
		try {
			objConn = pool.getConnection();
			sql = "delete from wishList where goodsCode = ?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, goodsCode);
			rs = objPStmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return rs == 1 ? true : false;
	}

	// 배송지 추가 메서드
	public boolean insertAddr(String uId, String uName, String uAddr) {
		boolean flag = false;
		try {
			objConn = pool.getConnection();
			sql = "insert into addr (uId, uName, uAddr) values(?,?,?)";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objPStmt.setString(2, uName);
			objPStmt.setString(3, uAddr);

			if (objPStmt.executeUpdate() == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}
		return flag;
	}

	// 배송지 삭제 메서드
	public boolean deleteAddr(String uId, String no) {
		int result = 0;
		try {
			objConn = pool.getConnection();
			sql = "delete from Addr where uid=? and no = ?";
			objPStmt = objConn.prepareStatement(sql);

			int num = Integer.parseInt(no);
			objPStmt.setString(1, uId);
			objPStmt.setInt(2, num);
			result = objPStmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}
		return result == 1 ? true : false;
	}

	// addr테이블에 저장된 배송지 다 가져오기
	public List<AddrBean> selectAddrList(String uId) {
		List<AddrBean> list = new ArrayList<>();
		try {
			objConn = pool.getConnection();
			sql = "select * from Addr where uId = ?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objRs = objPStmt.executeQuery();

			while (objRs.next()) {
				AddrBean aBean = new AddrBean();
				aBean.setNo(objRs.getInt("no"));
				aBean.setuId(objRs.getString("uId"));
				aBean.setuName(objRs.getString("uName"));
				aBean.setuAddr(objRs.getString("uAddr"));
				list.add(aBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}
		return list;
	}

	// 상품 후기 작성 메서드
	public List<GoodsCommentsBean> selectComments(String uId) {
		List<GoodsCommentsBean> list = new ArrayList<>();
		try {
			objConn = pool.getConnection();
			sql = "select no, uId, goodsCode, title_c from goodsComments where uId = ?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objRs = objPStmt.executeQuery();

			while (objRs.next()) {
				GoodsCommentsBean comments = new GoodsCommentsBean();
				comments.setNo(objRs.getInt("no"));
				comments.setuId(objRs.getString("uId"));
				comments.setGoodsCode(objRs.getString("goodsCode"));
				comments.setTitle_c(objRs.getString("title_c"));
				list.add(comments);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return list;
	}

	// 상품 문의 메서드
	public List<GoodsQnABean> selectQnA(String uId) {
		List<GoodsQnABean> list = new ArrayList<>();
		try {
			objConn = pool.getConnection();
			sql = "select no, uId, goodsCode, title_q from goodsQnA where uId = ?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objRs = objPStmt.executeQuery();

			while (objRs.next()) {
				GoodsQnABean qna = new GoodsQnABean();
				qna.setNo(objRs.getInt("no"));
				qna.setuId(objRs.getString("uId"));
				qna.setGoodsCode(objRs.getString("goodsCode"));
				qna.setTitle_q(objRs.getString("title_q"));
				list.add(qna);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return list;
	}

	// 상품 문의 읽기 (글 1개)
	public GoodsQnABean selectQnAOne(int no) {
		GoodsQnABean gBean = new GoodsQnABean();

		try {
			objConn = pool.getConnection();
			sql = "select * from goodsQnA where no = ?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setInt(1, no);
			objRs = objPStmt.executeQuery();

			if (objRs.next()) {
				gBean.setNo(objRs.getInt("no"));
				gBean.setuId(objRs.getString("uId"));
				gBean.setGoodsCode(objRs.getString("goodsCode"));
				gBean.setTitle_q(objRs.getString("title_q"));
				gBean.setContetns_q(objRs.getString("contetns_q"));
				gBean.setFileOName_q(objRs.getString("fileOName_q"));
				gBean.setFileRName_q(objRs.getString("fileRName_q"));
				gBean.setWriteTime_q(objRs.getString("writeTime_q"));
				gBean.setView_cnt_q(objRs.getInt("view_cnt_q"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return gBean;
	}

	// 상품 후기 읽기 (글 1개)
	public GoodsCommentsBean selectCommentOne(int no) {
		GoodsCommentsBean gBean = new GoodsCommentsBean();

		try {
			objConn = pool.getConnection();
			sql = "select * from goodsComments where no = ?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setInt(1, no);
			objRs = objPStmt.executeQuery();

			if (objRs.next()) {
				gBean.setNo(objRs.getInt("no"));
				gBean.setuId(objRs.getString("uId"));
				gBean.setGoodsCode(objRs.getString("goodsCode"));
				gBean.setTitle_c(objRs.getString("title_c"));
				gBean.setContetns_c(objRs.getString("contetns_c"));
				gBean.setFileOName_c(objRs.getString("fileOName_c"));
				gBean.setFileRName_c(objRs.getString("fileRName_c"));
				gBean.setWriteTime_c(objRs.getString("writeTime_c"));
				gBean.setView_cnt_c(objRs.getInt("view_cnt_c"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return gBean;
	}

	// 상품후기 삭제 메서드
	public boolean deleteCmtOne(int no, String uId) {
		int result = 0;
		try {
			objConn = pool.getConnection();
			sql = "delete from goodsComments where uId = ? and no = ?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objPStmt.setInt(2, no);
			result = objPStmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}
		return result == 1 ? true : false;
	}

	// 상품문의 삭제 메서드
	public boolean deleteQnaOne(int no, String uId) {
		int result = 0;
		try {
			objConn = pool.getConnection();
			sql = "delete from goodsQnA where uId = ? and no = ?";
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setString(1, uId);
			objPStmt.setInt(2, no);
			result = objPStmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}
		return result == 1 ? true : false;
	}

	// 상품 후기 수정 메서드
	public boolean updateCmtOne(String title, String content, String uId, int no) {
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			sql = "Update goodsComments set title_c=?, contetns_c=?, writeTime_c=now() where uId=? and no=?";
			objPStmt = objConn.prepareStatement(sql);

			objPStmt.setString(1, title);
			objPStmt.setString(2, content);
			objPStmt.setString(3, uId);
			objPStmt.setInt(4, no);
			if (objPStmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}

		return flag;
	}

	// 상품 문의 수정 메서드
	public boolean updateQnaOne(String title, String content, String uId, int no) {
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			sql = "Update goodsQnA set title_q=?, contetns_q=?, writeTime_q=now() where uId=? and no=?";
			objPStmt = objConn.prepareStatement(sql);

			objPStmt.setString(1, title);
			objPStmt.setString(2, content);
			objPStmt.setString(3, uId);
			objPStmt.setInt(4, no);
			if (objPStmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}

		return flag;
	}
}
