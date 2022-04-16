package pack_MyPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pack_DBCP.DBConnectionMgr;


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

	// 주문내역 메서드
	public List<OrderListBean> selectOrderList(String uId) {
		List<OrderListBean> list = new ArrayList<>();
		try {
			objConn = pool.getConnection();
	         sql = "select * from orderList  where uId = ?";
	         objPStmt = objConn.prepareStatement(sql);
	         objPStmt.setString(1, uId);
	         objRs = objPStmt.executeQuery();
			
			while (objRs.next()) {
				OrderListBean orderList = new OrderListBean();
				orderList.setGoodsCode(objRs.getString("goodsCode"));
				orderList.setGoodsCnt(objRs.getInt("goodsCnt"));
				list.add(orderList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return list;
	}

	//찜한 목록 메서드
	public List<WishListBean> selectWishList(String uId) {
		List<WishListBean> list = new ArrayList<>();
		try {
			objConn = pool.getConnection();
	         sql = "select * from wishList  where uId = ?";
	         objPStmt = objConn.prepareStatement(sql);
	         objPStmt.setString(1, uId);
	         objRs = objPStmt.executeQuery();
			
			while (objRs.next()) {
				WishListBean wishList  = new WishListBean();
				wishList.setGoodsCode(objRs.getString("goodsCode"));
				wishList.setNo(objRs.getInt("no"));
				wishList.setuId(objRs.getString("uId"));
				list.add(wishList );
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPStmt, objRs);
		}
		return list;
	}
	
	
	
	// 배송지 추가 메서드
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
