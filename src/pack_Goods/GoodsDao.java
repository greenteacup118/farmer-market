package pack_Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack_DBCP.DBConnectionMgr;
import pack_MyPage.GoodsCommentsBean;
import pack_MyPage.GoodsQnABean;

public class GoodsDao {

	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private DBConnectionMgr pool = null;
	String sql = "";

	public GoodsDao() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/* 상품 테이블 입력 시작 */
	public List<GoodsBean> goodsTbl() {

		List<GoodsBean> goodsList = new Vector();

		try {
			conn = pool.getConnection();

			String sql = "select * from goods order by num desc";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				GoodsBean gBean = new GoodsBean();

				gBean.setGoodsImg(rs.getString("goodsImg"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setGoodsPrice(rs.getInt("goodsPrice"));
				gBean.setGoodsName(rs.getString("goodsName"));
				gBean.setGoodsCatch(rs.getString("goodsCatch"));
				gBean.setGoodsWeight(rs.getString("goodsWeight"));
				gBean.setContentImg1(rs.getString("contentImg1"));
				gBean.setContentImg2(rs.getString("contentImg2"));
				gBean.setContentImg3(rs.getString("contentImg3"));
				gBean.setEventRate(rs.getInt("eventRate"));
				gBean.setDeliType(rs.getString("deliType"));
				gBean.setUnitType(rs.getString("unitType"));
				gBean.setPackType(rs.getString("packType"));

				goodsList.add(gBean);

			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			pool.freeConnection(conn, stmt, rs);
		}

		return goodsList;

	}

	/* 상품 테이블 입력 시작 */
	public List<GoodsBean> selectGoodsWhere(String search) {

		List<GoodsBean> goodsList = new ArrayList<>();

		try {
			conn = pool.getConnection();

			String sql = "select * from goods ";
			String sql2 = "";

			if (search != null) {
				sql2 += "where ";
				sql2 += "goodsName like '%" + search + "%' or ";
				sql2 += "goodsCatch like '%" + search + "%' or ";
				sql2 += "goodsWeight like '%" + search + "%' or ";
				sql2 += "deliType like '%" + search + "%' or ";
				sql2 += "unitType like '%" + search + "%' or ";
				sql2 += "packType like '%" + search + "%'";

				if (search.equals("육류") || search.equals("고기")) {
					sql2 += " or goodsCode like 'M%'";
				} else if (search.equals("생선") || search.equals("해산물")) {
					sql2 += " or goodsCode like 'S%'";
				} else if (search.equals("채소") || search.equals("야채")) {
					sql2 += " or goodsCode like 'V%'";
				} else if (search.equals("과일")) {
					sql2 += " or goodsCode like 'F%'";
				}
			}

			String sql3 = " order by num desc";

			sql = sql + sql2 + sql3;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				GoodsBean gBean = new GoodsBean();

				gBean.setGoodsImg(rs.getString("goodsImg"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setGoodsPrice(rs.getInt("goodsPrice"));
				gBean.setGoodsName(rs.getString("goodsName"));
				gBean.setGoodsCatch(rs.getString("goodsCatch"));
				gBean.setGoodsWeight(rs.getString("goodsWeight"));
				gBean.setContentImg1(rs.getString("contentImg1"));
				gBean.setContentImg2(rs.getString("contentImg2"));
				gBean.setContentImg3(rs.getString("contentImg3"));
				gBean.setEventRate(rs.getInt("eventRate"));
				gBean.setDeliType(rs.getString("deliType"));
				gBean.setUnitType(rs.getString("unitType"));
				gBean.setPackType(rs.getString("packType"));

				goodsList.add(gBean);

			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			pool.freeConnection(conn, stmt, rs);
		}

		return goodsList;

	}

	// 상품 상세페이지 구현을 위해서 데이터 가져오기
	public GoodsBean selectGoodsOne(String goodsCode) {
		GoodsBean gBean = new GoodsBean();

		try {
			conn = pool.getConnection();

			sql = "select * from goods where goodsCode= ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, goodsCode);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				gBean.setGoodsImg(rs.getString("goodsImg"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setGoodsPrice(rs.getInt("goodsPrice"));
				gBean.setGoodsName(rs.getString("goodsName"));
				gBean.setGoodsCatch(rs.getString("goodsCatch"));
				gBean.setGoodsWeight(rs.getString("goodsWeight"));
				gBean.setContentImg1(rs.getString("contentImg1"));
				gBean.setContentImg2(rs.getString("contentImg2"));
				gBean.setContentImg3(rs.getString("contentImg3"));
				gBean.setEventRate(rs.getInt("eventRate"));
				gBean.setDeliType(rs.getString("deliType"));
				gBean.setUnitType(rs.getString("unitType"));
				gBean.setPackType(rs.getString("packType"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return gBean;
	}

	// 장바구니 데이터 추가
	public void insertBasket(String uId, String goodsCode, int goodsCnt, String uDeli) {
		/* System.out.println("OK1"); */
		String sql = null;

		try {
			conn = pool.getConnection();

			sql = "insert into basket(uId, goodsCode, goodsCnt, uDeli) values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uId);
			pstmt.setString(2, goodsCode);
			pstmt.setInt(3, goodsCnt);
			pstmt.setString(4, uDeli);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			/* System.out.println("OK2"); */
			pool.freeConnection(conn, pstmt);
		}
	}

	/* 장바구니 데이터 불러오기 */
	public List<BasketBean> basketInfo(String uId_Session) {

		List<BasketBean> basketList = new ArrayList<>();
		List<String> list = new ArrayList<>(); // 체크용 리스트

		try {
			conn = pool.getConnection();

			String sql = "select * from basket where uId=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uId_Session);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				BasketBean bBean = new BasketBean();

				String goodsCode = rs.getString("goodsCode");

				bBean.setuId(rs.getString("uId"));
				bBean.setGoodsCode(goodsCode);
				bBean.setGoodsCnt(rs.getInt("goodsCnt"));
				bBean.setuDeli(rs.getString("uDeli"));

				if (list.indexOf(goodsCode) == -1) {
					basketList.add(bBean); // goodsCode 값이 없을경우 추가
				}
				list.add(goodsCode);

			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return basketList;

	}

	// 장바구니 화면 출력용
	public GoodsBean basketTbl(String goodsCode) {
		String sql = null;

		GoodsBean gBean = new GoodsBean();

		try {
			conn = pool.getConnection();

			sql = "select * from goods where goodsCode= ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, goodsCode);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				gBean.setGoodsImg(rs.getString("goodsImg"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setGoodsPrice(rs.getInt("goodsPrice"));
				gBean.setGoodsName(rs.getString("goodsName"));
				gBean.setGoodsWeight(rs.getString("goodsWeight"));
				gBean.setEventRate(rs.getInt("eventRate"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return gBean;
	}

	// 장바구니 삭제
	public void deleteBasket(String uId, String goodsCode) {
		String sql = null;

		try {
			conn = pool.getConnection();
			sql = "delete from basket where uId=? and goodsCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			pstmt.setString(2, goodsCode);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
	}

	// 장바구니 중복확인
	public boolean checkBasket(String goodsCode) {
		int chkRes = 0;
		String sql = "";

		try {
			conn = pool.getConnection();
			// goodsCode에 해당하는 갯수 확인
			sql = "select count(*) from basket where goodsCode=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodsCode);

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

	// 상품코드 첫번째 글자 및 정렬기준 활용하여 메인페이지 상품 보여주기
	public List<GoodsBean> selectGoodsList(String category, String orderby) {
		List<GoodsBean> list = new ArrayList<>();

		try {
			conn = pool.getConnection();

			sql = "select goodsImg, goodsCode, goodsPrice, goodsName, goodsCatch, eventRate "
					+ "from goods where goodsCode like '" + category + "%' " + orderby + " limit 3";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsBean gBean = new GoodsBean();
				gBean.setGoodsImg(rs.getString("goodsImg"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setGoodsPrice(rs.getInt("goodsPrice"));
				gBean.setGoodsName(rs.getString("goodsName"));
				gBean.setGoodsCatch(rs.getString("goodsCatch"));
				gBean.setEventRate(rs.getInt("eventRate"));

				list.add(gBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return list;
	}
	
	
	// 상품 후기 조회수 증가 메서드
	public boolean updateViewCnt(int no) {
		boolean flag = false;

		try {
			conn = pool.getConnection();
			sql = "Update goodsComments set view_cnt_c = view_cnt_c+1 where no=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}

		return flag;
	}
	
	
	// 상품 문의 게시판 내용 insert 메서드
	public boolean insertGoodsQnA(HttpServletRequest req, String uId) {
		boolean flag = false;
		String saveDir = "D:/infoProc_1119/Project/farmerMarket/proj_farmerMarket/WebContent/fileUpload";

		int maxPostSize = 10 * 1024 * 1024; // 10*1kb 1024면 10mb

		try {

			MultipartRequest mReq = new MultipartRequest(req, // request
					saveDir, // 업로드할 폴더 경로
					maxPostSize, // 업로드 허용 용량(단위 : byte)
					"UTF-8", // 인코딩
					new DefaultFileRenamePolicy() // 동일파일명 정책을 관리하는 객체
			);

			String goodsCode = mReq.getParameter("goodsCode");
			String title = mReq.getParameter("title");
			String content = mReq.getParameter("content");
			String fileName = "";
			String original = "";
			Enumeration files = mReq.getFileNames();

			while (files.hasMoreElements()) {
				String name = (String) files.nextElement();
				fileName = mReq.getFilesystemName(name);
				original = mReq.getOriginalFileName(name);
			}

			conn = pool.getConnection();

			if (fileName == null || original == null) {
				sql = "insert into goodsQnA (uId, goodsCode, title_q, contetns_q, writeTime_q)"
						+ " values(?,?,?,?,now())";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uId);
				pstmt.setString(2, goodsCode);
				pstmt.setString(3, title);
				pstmt.setString(4, content);
			} else {
				sql = "insert into goodsQnA (uId, goodsCode, title_q, contetns_q, writeTime_q, fileOName_q, fileRName_q)"
						+ " values(?,?,?,?,now(), ? , ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uId);
				pstmt.setString(2, goodsCode);
				pstmt.setString(3, title);
				pstmt.setString(4, content);
				pstmt.setString(5, fileName);
				pstmt.setString(6, original);
			}

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}

		return flag;
	}

	// 상품 후기 게시판 내용 insert 메서드
	public boolean insertGoodsComments(HttpServletRequest req, String uId) {
		boolean flag = false;
		String saveDir = "D:/infoProc_1119/Project/farmerMarket/proj_farmerMarket/WebContent/fileUpload";

		int maxPostSize = 10 * 1024 * 1024; // 10*1kb 1024면 10mb

		try {

			MultipartRequest mReq = new MultipartRequest(req, // request
					saveDir, // 업로드할 폴더 경로
					maxPostSize, // 업로드 허용 용량(단위 : byte)
					"UTF-8", // 인코딩
					new DefaultFileRenamePolicy() // 동일파일명 정책을 관리하는 객체
			);

			String goodsCode = mReq.getParameter("goodsCode");
			String title = mReq.getParameter("title");
			String content = mReq.getParameter("content");
			String fileName = "";
			String original = "";

			Enumeration files = mReq.getFileNames();

			while (files.hasMoreElements()) {
				String name = (String) files.nextElement();
				fileName = mReq.getFilesystemName(name);
				original = mReq.getOriginalFileName(name);
			}

			conn = pool.getConnection();

			if (fileName == null || original == null) {
				sql = "insert into goodsComments (uId, goodsCode, title_c, contetns_c, writeTime_c)"
						+ " values(?,?,?,?,now())";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uId);
				pstmt.setString(2, goodsCode);
				pstmt.setString(3, title);
				pstmt.setString(4, content);
			} else {
				sql = "insert into goodsComments (uId, goodsCode, title_c, contetns_c, writeTime_c, fileOName_c, fileRName_c)"
						+ " values(?,?,?,?,now(), ? , ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uId);
				pstmt.setString(2, goodsCode);
				pstmt.setString(3, title);
				pstmt.setString(4, content);
				pstmt.setString(5, fileName);
				pstmt.setString(6, original);
			}

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}

		return flag;
	}

	// 후기게시판 보여주기 메서드
	public List<GoodsCommentsBean> selectGoodsCmtList(String goodsCode) {
		List<GoodsCommentsBean> list = new ArrayList<>();

		try {
			conn = pool.getConnection();

			sql = "select * from goodsComments where goodsCode=? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodsCode);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsCommentsBean gBean = new GoodsCommentsBean();
				gBean.setNo(rs.getInt("no"));
				gBean.setuId(rs.getString("uId"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setTitle_c(rs.getString("title_c"));
				gBean.setContetns_c(rs.getString("contetns_c"));
				gBean.setFileRName_c(rs.getString("fileRName_c"));
				gBean.setWriteTime_c(rs.getString("writeTime_c"));
				gBean.setView_cnt_c(rs.getInt("view_cnt_c"));

				list.add(gBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return list;
	}

	// 내 상품 후기 보여주기 메서드
	public List<GoodsCommentsBean> selectMyGoodsCmtList(String uId) {
		List<GoodsCommentsBean> list = new ArrayList<>();

		try {
			conn = pool.getConnection();

			sql = "select * from goodsComments where uId=? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsCommentsBean gBean = new GoodsCommentsBean();
				gBean.setNo(rs.getInt("no"));
				gBean.setuId(rs.getString("uId"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setTitle_c(rs.getString("title_c"));
				gBean.setContetns_c(rs.getString("contetns_c"));
				gBean.setFileRName_c(rs.getString("fileRName_c"));
				gBean.setWriteTime_c(rs.getString("writeTime_c"));
				gBean.setView_cnt_c(rs.getInt("view_cnt_c"));

				list.add(gBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return list;
	}

	// 문의게시판 보여주기 메서드
	public List<GoodsQnABean> selectGoodsQnaList(String goodsCode) {
		List<GoodsQnABean> list = new ArrayList<>();

		try {
			conn = pool.getConnection();

			sql = "select * from goodsQnA where goodsCode=? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodsCode);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsQnABean gBean = new GoodsQnABean();
				gBean.setNo(rs.getInt("no"));
				gBean.setuId(rs.getString("uId"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setTitle_q(rs.getString("title_q"));
				gBean.setContetns_q(rs.getString("contetns_q"));
				gBean.setFileRName_q(rs.getString("fileRName_q"));
				gBean.setWriteTime_q(rs.getString("writeTime_q"));
				gBean.setView_cnt_q(rs.getInt("view_cnt_q"));

				list.add(gBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return list;
	}

	// 상품문의 내역 보여주기 메서드
	public List<GoodsQnABean> selectMyGoodsQnaList(String uId) {
		List<GoodsQnABean> list = new ArrayList<>();

		try {
			conn = pool.getConnection();

			sql = "select * from goodsQnA where uId=? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsQnABean gBean = new GoodsQnABean();
				gBean.setNo(rs.getInt("no"));
				gBean.setuId(rs.getString("uId"));
				gBean.setGoodsCode(rs.getString("goodsCode"));
				gBean.setTitle_q(rs.getString("title_q"));
				gBean.setContetns_q(rs.getString("contetns_q"));
				gBean.setFileRName_q(rs.getString("fileRName_q"));
				gBean.setWriteTime_q(rs.getString("writeTime_q"));
				gBean.setView_cnt_q(rs.getInt("view_cnt_q"));

				list.add(gBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return list;
	}

	// 주문완료시 장바구니 목록 삭제
	public void orderCom(String uId, String goodsCode) {
		String sql = null;

		try {
			conn = pool.getConnection();
			sql = "delete from basket where uId=? and goodsCode = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			pstmt.setString(2, goodsCode);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
}
