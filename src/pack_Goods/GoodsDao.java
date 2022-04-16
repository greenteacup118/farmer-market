package pack_Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class GoodsDao {
	
	private DBConnectionMgr objPool;
	
	Connection					objConn			=			null;
	PreparedStatement		objPstmt		=			null;
	Statement					objStmt			=			null;
	ResultSet					objRS				=			null;
	
	
	public GoodsDao() {
		try {
			objPool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}
	}
	
	
	/* 상품 테이블 입력 시작 */
	public List<GoodsBean > goodsTbl() {
		
		List<GoodsBean> goodsList = new Vector();
		
		try {
			objConn = objPool.getConnection();
			
			String sql = "select * from goods order by num desc";
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			
			while(objRS.next()) {
				
				GoodsBean gBean = new GoodsBean();
				
				gBean.setGoodsImg(objRS.getString("goodsImg"));
				gBean.setGoodsCode(objRS.getString("goodsCode"));
				gBean.setGoodsPrice(objRS.getInt("goodsPrice"));
				gBean.setGoodsName(objRS.getString("goodsName"));
				gBean.setGoodsCatch(objRS.getString("goodsCatch"));
				gBean.setGoodsWeight(objRS.getString("goodsWeight"));
				gBean.setContentImg1(objRS.getString("contentImg1"));
				gBean.setContentImg2(objRS.getString("contentImg2"));
				gBean.setContentImg3(objRS.getString("contentImg3"));
				gBean.setEventRate(objRS.getInt("eventRate"));
				gBean.setDeliType(objRS.getString("deliType"));
				gBean.setUnitType(objRS.getString("unitType"));
				gBean.setPackType(objRS.getString("packType"));
				
				goodsList.add(gBean);
				
			}
			
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objStmt, objRS);
		}
		
		return goodsList;
		
	}
	

	
	// 상품 상세페이지 구현을 위해서 데이터 가져오기
	public GoodsBean selectGoodsOne(String goodsCode) {
		String sql = null;
		GoodsBean gBean = new GoodsBean();

		try {
			objConn = objPool.getConnection();

			sql = "select * from goods where goodsCode= ?";
			objPstmt = objConn.prepareStatement(sql);

			objPstmt.setString(1, goodsCode);

			objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				gBean.setGoodsImg(objRS.getString("goodsImg"));
				gBean.setGoodsCode(objRS.getString("goodsCode"));
				gBean.setGoodsPrice(objRS.getInt("goodsPrice"));
				gBean.setGoodsName(objRS.getString("goodsName"));
				gBean.setGoodsCatch(objRS.getString("goodsCatch"));
				gBean.setGoodsWeight(objRS.getString("goodsWeight"));
				gBean.setContentImg1(objRS.getString("contentImg1"));
				gBean.setContentImg2(objRS.getString("contentImg2"));
				gBean.setContentImg3(objRS.getString("contentImg3"));
				gBean.setEventRate(objRS.getInt("eventRate"));
				gBean.setDeliType(objRS.getString("deliType"));
				gBean.setUnitType(objRS.getString("unitType"));
				gBean.setPackType(objRS.getString("packType"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return gBean;
	}

	

	
	
	
	// 장바구니 데이터 추가
	public void insertBasket(String uId, String goodsCode, int goodsCnt, String uDeli) {
		/* System.out.println("OK1"); */
		String sql = null;

		try {
			objConn = objPool.getConnection();

			sql = "insert into basket(uId, goodsCode, goodsCnt, uDeli) values (?,?,?,?)";
			objPstmt = objConn.prepareStatement(sql);

			objPstmt.setString(1, uId);
			objPstmt.setString(2, goodsCode);
			objPstmt.setInt(3, goodsCnt);
			objPstmt.setString(4, uDeli);

			objPstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			/* System.out.println("OK2"); */
			objPool.freeConnection(objConn, objPstmt);
		}
	}
	
	
	
	/* 장바구니 데이터 불러오기 */
	public List<BasketBean > basketInfo(String uId_Session) {
		
		List<BasketBean> basketList = new ArrayList<>();
		List<String> list = new ArrayList<>(); //체크용 리스트
		
		try {
			objConn = objPool.getConnection();
			
			String sql = "select * from basket where uId=?";
			objPstmt = objConn.prepareStatement(sql);
			
			objPstmt.setString(1, uId_Session);
			
			objRS = objPstmt.executeQuery();
			
			while(objRS.next()) {
				
				BasketBean bBean = new BasketBean();
				
				String goodsCode = objRS.getString("goodsCode");
				
				bBean.setuId(objRS.getString("uId"));
				bBean.setGoodsCode(goodsCode);
				bBean.setGoodsCnt(objRS.getInt("goodsCnt"));
				bBean.setuDeli(objRS.getString("uDeli"));
				
				if(list.indexOf(goodsCode) == -1) {
					basketList.add(bBean);	// goodsCode 값이 없을경우 추가
				}
				list.add(goodsCode);
				
			}

			
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return basketList;
		
	}
	
	// 장바구니 화면 출력용 
	public GoodsBean basketTbl(String goodsCode) {
		String sql = null;
		
		GoodsBean gBean = new GoodsBean();

		try {
			objConn = objPool.getConnection();

			sql = "select * from goods where goodsCode= ?";
			objPstmt = objConn.prepareStatement(sql);

			objPstmt.setString(1, goodsCode);

			objRS = objPstmt.executeQuery();			

			while (objRS.next()) {
				

				
				gBean.setGoodsImg(objRS.getString("goodsImg"));
				gBean.setGoodsCode(objRS.getString("goodsCode"));
				gBean.setGoodsPrice(objRS.getInt("goodsPrice"));
				gBean.setGoodsName(objRS.getString("goodsName"));
				gBean.setGoodsWeight(objRS.getString("goodsWeight"));
				gBean.setEventRate(objRS.getInt("eventRate"));
				


			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return gBean;
	}
	
	
	
	
	
	
	
	
	
	
	// 상품코드 첫번째 글자 및 정렬기준 활용하여 메인페이지 상품 보여주기
	public List<GoodsBean> selectGoodsList(String category, String orderby) {
		String sql = null;
		List<GoodsBean> list = new ArrayList<>();
		
		try {
			objConn = objPool.getConnection();

			sql = "select goodsImg, goodsCode, goodsPrice, goodsName, goodsCatch, eventRate "
					+ "from goods where goodsCode like '" + category + "%' " + orderby + " limit 3";
			objPstmt = objConn.prepareStatement(sql);

			objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				GoodsBean gBean = new GoodsBean();
				gBean.setGoodsImg(objRS.getString("goodsImg"));
				gBean.setGoodsCode(objRS.getString("goodsCode"));
				gBean.setGoodsPrice(objRS.getInt("goodsPrice"));
				gBean.setGoodsName(objRS.getString("goodsName"));
				gBean.setGoodsCatch(objRS.getString("goodsCatch"));
				gBean.setEventRate(objRS.getInt("eventRate"));

				list.add(gBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return list;
	}
	
	
	
	// 장바구니 중복확인
	public boolean checkBasket(String goodsCode) {
		int chkRes = 0;
		String sql = "";
		
		try {
			objConn = objPool.getConnection();
			// goodsCode에 해당하는 갯수 확인
			sql = "select count(*) from basket where goodsCode=?";

			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, goodsCode);

			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				chkRes = objRS.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		// 0이 반환되면 중복 없음
		return chkRes == 0 ? true : false;
	}
	
	
	
	
	
	
	
	
	
}
