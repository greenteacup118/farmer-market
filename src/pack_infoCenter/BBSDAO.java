package pack_infoCenter;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack_DBCP.DBConnectionMgr;

public class BBSDAO {

	private Connection objConn = null;
	private Statement objStmt = null;
	private ResultSet objRs = null;
	private PreparedStatement objPStmt = null;
	private DBConnectionMgr pool = null;

	private String saveDir = "D://infoproc_1119//mun_ua//Project//Team Proj_문혁민//proj_farmerMarket_mybox//proj_farmerMarket_mybox - 복사본//WebContent//fileUpload";
	private int Size = 10 * 1024 * 1024;
	private String Encoding = "UTF-8";

	public BBSDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<QnaVO> BBSRead2()

	{

		List<QnaVO> list2 = new ArrayList<>();

		try {

			String sql = "select ibno_q,title_q,contents_q,writer_q,writeTime ";
			sql += ", view_cnt_q, fileSize_q, fileName_q from";
			sql += "NoticeBBS";

			objConn = pool.getConnection();
			objStmt = objConn.createStatement();
			objRs = objStmt.executeQuery(sql);

			while (objRs.next()) {

				QnaVO nvo = new QnaVO();

				nvo.setibno_q(objRs.getInt("ibno_q"));
				nvo.setTitle_q(objRs.getString("title_q"));
				nvo.setContents_q(objRs.getString("contents_q"));
				nvo.setWriter_q(objRs.getString("writer_q"));
				nvo.setWriteTime_q(objRs.getString("writeTime_q"));
				nvo.setview_cnt_q(objRs.getInt("view_cnt_q"));
				nvo.setFileSize_q(objRs.getLong("FileSize_q"));
				nvo.setFileOName_q(objRs.getString("FileOName_q"));
				nvo.setFileRName_q(objRs.getString("FileRName_q"));
				list2.add(nvo);
			}

		} catch (Exception e) {
			System.out.println("DBCP E:" + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objStmt, objRs);

		}
		return list2;

	}

	public int Q_getCnt() {
		
		int totalCount=0;
		try {
      
			String sql="select Count(*) from QnaBBS ";
			objConn = pool.getConnection();
			objStmt = objConn.createStatement();
			objRs = objStmt.executeQuery(sql);
			
			if(objRs.next()) {
				totalCount=objRs.getInt(1);
			}
			
			
		} catch (Exception e) {
		
		} 
		return totalCount;
		
	}
 public List<QnaVO> Qnalist(int block,int nper) {
	 
	 List<QnaVO> list_q = new ArrayList<QnaVO>();
	
	 try {
		 
		 
			String sql="select *from QnaBBS order by  ibno_q  desc limit ?, ?";
			objConn = pool.getConnection();
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setInt(1, block);
			objPStmt.setInt(2, nper);
			objRs = objPStmt.executeQuery();
			
			while(objRs.next()) {
				
				QnaVO qvo = new QnaVO();

				qvo.setibno_q(objRs.getInt("ibno_q"));
				qvo.setTitle_q(objRs.getString("title_q"));
				qvo.setContents_q(objRs.getString("contetns_q"));
				qvo.setWriter_q(objRs.getString("writer_q"));
				qvo.setWriteTime_q(objRs.getString("writeTime_q"));
				qvo.setview_cnt_q(objRs.getInt("view_cnt_q"));
				qvo.setFileSize_q(objRs.getLong("fileSize_q"));
				qvo.setFileOName_q(objRs.getString("FileOName_q"));
				qvo.setFileRName_q(objRs.getString("FileRName_q"));
				
				list_q.add(qvo);
				
				
			}
			
	} catch (Exception e) {
     System.out.println("EXCP:"+ e.getMessage());
      
	}
	 return list_q;
	 
	 
	 
	 
 }
	public String BBSMulti(HttpServletRequest req) {

		MultipartRequest mReq = null;// 선언


		String select = "";
		String name = "";
		Long fileSize_n = 0L;
		String fileOName_n = "";
		String fileRName_n = "";
		try { // 실행

			mReq = new MultipartRequest( // 객체 생성
					req, saveDir, Size, Encoding, new DefaultFileRenamePolicy());

			Enumeration files = mReq.getFileNames();

			select = mReq.getParameter("select");
			System.out.println("메서드 사용");

			while (files.hasMoreElements()) {
				name = (String) files.nextElement();

				fileRName_n = mReq.getFilesystemName(name);

				fileOName_n = mReq.getOriginalFileName(name);
			}
			File file = mReq.getFile(name);
			if (file == null) {
				fileSize_n = 0L; // 파일의 용량

			} else {
				fileSize_n = file.length();

			}

			String sql = "";

			if (fileSize_n.equals(0L)) {
				sql = "insert into NoticeBBS value(null,?,?,?,now(),default,now(),null,null,null)";

				objConn = pool.getConnection();
				objPStmt = objConn.prepareStatement(sql);
				objPStmt.setString(1, mReq.getParameter("title"));
				objPStmt.setString(2, mReq.getParameter("contents"));
				objPStmt.setString(3, mReq.getParameter("writer"));
				objPStmt.executeUpdate();

			} else {
				sql = "insert into NoticeBBS value(null,?,?,?,now(),default,now(),?,?,?)";

				objConn = pool.getConnection();
				objPStmt = objConn.prepareStatement(sql);
				objPStmt.setString(1, mReq.getParameter("title"));
				objPStmt.setString(2, mReq.getParameter("contents"));
				objPStmt.setString(3, mReq.getParameter("writer"));
				objPStmt.setLong(4, fileSize_n);
				objPStmt.setString(5, fileOName_n);
				objPStmt.setString(6, fileRName_n);
				objPStmt.executeUpdate();
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}
		return select;
	}

	
	
	



	public void BBSMulti_n(HttpServletRequest req) {

		MultipartRequest mReq_n = null;// 선언
	

		String select = "";
		String name = "";
		Long fileSize_n = 0L;
		String fileOName_n = "";
		String fileRName_n = "";
		try { // 실행

			mReq_n = new MultipartRequest( // 객체 생성
					req, saveDir, Size, Encoding, new DefaultFileRenamePolicy());

			Enumeration files = mReq_n.getFileNames();

			select = mReq_n.getParameter("select");
			System.out.println("메서드 사용");

			while (files.hasMoreElements()) {
				name = (String) files.nextElement();

				fileRName_n = mReq_n.getFilesystemName(name);

				fileOName_n = mReq_n.getOriginalFileName(name);
			}
			File file = mReq_n.getFile(name);
			if (file == null) {
				fileSize_n = 0L; // 파일의 용량

			} else {
				fileSize_n = file.length();

			}

			String sql = "";

			if (fileSize_n.equals(0L)) {
				sql = "insert into NoticeBBS value(null,?,?,?,now(),default,now(),null,null,null)";

				objConn = pool.getConnection();
				objPStmt = objConn.prepareStatement(sql);
				objPStmt.setString(1, mReq_n.getParameter("title"));
				objPStmt.setString(2, mReq_n.getParameter("contents"));
				objPStmt.setString(3, mReq_n.getParameter("writer"));
				objPStmt.executeUpdate();

			} else {
				sql = "insert into NoticeBBS value(null,?,?,?,now(),default,now(),?,?,?)";

				objConn = pool.getConnection();
				objPStmt = objConn.prepareStatement(sql);
				objPStmt.setString(1, mReq_n.getParameter("title"));
				objPStmt.setString(2, mReq_n.getParameter("contents"));
				objPStmt.setString(3, mReq_n.getParameter("writer"));
				objPStmt.setLong(4, fileSize_n);
				objPStmt.setString(5, fileOName_n);
				objPStmt.setString(6, fileRName_n);
				objPStmt.executeUpdate();
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}

	}

	public void BBSMulti_q(HttpServletRequest req) {

		MultipartRequest mReq_q = null;// 선언



		String name = "";
		Long fileSize_q = 0L;
		String fileOName_q = "";
		String fileRName_q = "";
		try { // 실행

			mReq_q = new MultipartRequest( // 객체 생성
					req, saveDir, Size, Encoding, new DefaultFileRenamePolicy());

			Enumeration files = mReq_q.getFileNames();


			System.out.println("메서드 사용");

			while (files.hasMoreElements()) {
				name = (String) files.nextElement();

				fileRName_q = mReq_q.getFilesystemName(name);

				fileOName_q = mReq_q.getOriginalFileName(name);
			}
			File file = mReq_q.getFile(name);
			if (file == null) {
				fileSize_q = 0L; // 파일의 용량

			} else {
				fileSize_q = file.length();

			}

			String sql = "";

			if (fileSize_q.equals(0L)) {
				sql = "insert into QnaBBS value(null,?,?,?,now(),default,now(),null,null,null)";

				objConn = pool.getConnection();
				objPStmt = objConn.prepareStatement(sql);
				objPStmt.setString(1, mReq_q.getParameter("title"));
				objPStmt.setString(2, mReq_q.getParameter("contents"));
				objPStmt.setString(3, mReq_q.getParameter("writer"));
				objPStmt.executeUpdate();

			} else {
				sql = "insert into QnaBBS value(null,?,?,?,now(),default,now(),?,?,?)";

				objConn = pool.getConnection();
				objPStmt = objConn.prepareStatement(sql);
				objPStmt.setString(1, mReq_q.getParameter("title"));
				objPStmt.setString(2, mReq_q.getParameter("contents"));
				objPStmt.setString(3, mReq_q.getParameter("writer"));
				objPStmt.setLong(4, fileSize_q);
				objPStmt.setString(5, fileOName_q);
				objPStmt.setString(6, fileRName_q);
				objPStmt.executeUpdate();
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPStmt);
		}

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 공지사항 전체 불러오기(where없음)
	public List<NoticeVO> BBSRead1() {

		List<NoticeVO> list1 = new ArrayList<>();

		try {

			String sql = "select ibno_n, title_n, contetns_n, writer_n ,writeTime_n, view_cnt_n";
			sql += ", fileSize_n,fileOName_n,fileRName_n";
			sql += " from NoticeBBS;";

			objConn = pool.getConnection();
			objStmt = objConn.createStatement();
			objRs = objStmt.executeQuery(sql);

			while (objRs.next()) {

				NoticeVO nvo = new NoticeVO();

				nvo.setibno_n(objRs.getInt("ibno_n"));
				nvo.setTitle_n(objRs.getString("title_n"));
				nvo.setContents_n(objRs.getString("contetns_n"));
				nvo.setWriter_n(objRs.getString("writer_n"));
				nvo.setwriteTime_n(objRs.getString("writeTime_n"));
				nvo.setview_cnt_n(objRs.getInt("view_cnt_n"));
				nvo.setfileSize_n(objRs.getLong("fileSize_n"));
				nvo.setfileOName_n(objRs.getString("FileOName_n"));
				nvo.setfileRName_n(objRs.getString("FileRName_n"));
				list1.add(nvo);

			}

		} catch (Exception e) {
			System.out.println("DBCP ya:" + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objStmt, objRs);

		}
		return list1;

	}

	public NoticeVO bean1(int ibno_n) {

		NoticeVO nvo = new NoticeVO();

		try {

			String sql = "select  title_n, contetns_n ,writer_n, writeTime_n, ";
			sql += "fileSize_n, fileRName_n from NoticeBBS where ibno_n=?";

			System.out.println("ibno_n : " + ibno_n);
			System.out.println("sql : " + sql);
			objConn = pool.getConnection();
			objPStmt = objConn.prepareStatement(sql);
//			  objStmt = objConn.createStatement();
			objPStmt.setInt(1, ibno_n);
			objRs = objPStmt.executeQuery();


			if (objRs.next()) {

				nvo.setTitle_n(objRs.getString("title_n"));
				nvo.setContents_n(objRs.getString("contetns_n"));
				nvo.setWriter_n(objRs.getString("writer_n"));
				nvo.setwriteTime_n(objRs.getString("writeTime_n"));
				nvo.setfileSize_n(objRs.getLong("fileSize_n"));
				nvo.setfileRName_n(objRs.getString("fileRName_n"));

			}

		} catch (Exception e) {
			System.out.println("EXCP :" + e.getMessage());
		}

		return nvo;

	}

	public QnaVO bean2(int ibno_q) {

		QnaVO nvo = new QnaVO();

		try {

			String sql =" select title_q ,contetns_q,writer_q, writeTime_q,";
			sql +=" fileSize_q , fileRName_q from QnaBBS where ibno_q=? ";

			objConn = pool.getConnection();
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setInt(1, ibno_q);
			objRs = objPStmt.executeQuery();

			if (objRs.next()) {
				
				nvo.setTitle_q(objRs.getString("title_q"));
				nvo.setContents_q(objRs.getString("contetns_q"));
				nvo.setWriter_q(objRs.getString("writer_q"));
				nvo.setWriteTime_q(objRs.getString("writeTime_q"));
				nvo.setFileSize_q(objRs.getLong("fileSize_q"));
				nvo.setFileRName_q(objRs.getString("fileRName_q"));

			}

		} catch (Exception e) {
            System.out.println("EXCP_q:"+e.getMessage());
		}

		return nvo;

	}



	public int getCnt() {

		String sql = null;
		int totalCnt = 0;

		try {
			sql = "select count(*) from NoticeBBS ";

			objConn = pool.getConnection();
			objStmt = objConn.createStatement();
			objRs = objStmt.executeQuery(sql);

			if (objRs.next()) {
				totalCnt = objRs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("EXCP :" + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objStmt, objRs);
		}
		return totalCnt;
	}

	public List<NoticeVO> pageNum(int nblock, int numPerPage) {

//		int nowPage = Integer.parseInt(nPage);

		String sql = null;
		List<NoticeVO> list = new ArrayList<>();

		try {

			sql = "select * from NoticeBBS order by ibno_n desc limit ? ,?";
			objConn = pool.getConnection();
			objPStmt = objConn.prepareStatement(sql);
			objPStmt.setInt(1, nblock);
			objPStmt.setInt(2, numPerPage);
			objRs = objPStmt.executeQuery();

			while (objRs.next()) {

				NoticeVO nvo = new NoticeVO();

				nvo.setibno_n(objRs.getInt("ibno_n"));
				nvo.setTitle_n(objRs.getString("title_n"));
				nvo.setContents_n(objRs.getString("contetns_n"));
				nvo.setWriter_n(objRs.getString("writer_n"));
				nvo.setwriteTime_n(objRs.getString("writeTime_n"));
				nvo.setview_cnt_n(objRs.getInt("view_cnt_n"));
				nvo.setfileSize_n(objRs.getLong("fileSize_n"));
				nvo.setfileOName_n(objRs.getString("FileOName_n"));
				nvo.setfileRName_n(objRs.getString("FileRName_n"));
				list.add(nvo);
			}

		} catch (Exception e) {
			System.out.println("EXCP :" + e.getMessage());
		}

		return list;
	}
	
	
	public void update() {
		String sql = "";

		try {
			sql = "update NoticeBBS set * ";

			objConn = pool.getConnection();
			objPStmt = objConn.prepareStatement(sql);

		} catch (Exception e) {

		}

	}

}
