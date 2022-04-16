package pack_infoCenter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import pack_DBCP.DBConnectionMgr;

public class BBSDAO {

	private Connection objConn = null;
	private Statement objStmt = null;
	private ResultSet objRs = null;
	private PreparedStatement objPStmt = null;
	private DBConnectionMgr pool = null;

	public NoticeVO BBSRead() {

		NoticeVO nvo = new NoticeVO();

		try {

			String sql = "select 'ibno_n','title_n','contents_n','writer_n','writeTime'";
			sql += ",'view_cnt_n','fileSize_n','fileName_n' from";
			sql += "NoticeBBS where ibno_n = ?";
			pool = DBConnectionMgr.getInstance();
			objConn = pool.getConnection();
			objPStmt = objConn.prepareStatement(sql);
			objRs = objPStmt.executeQuery();

			if (objRs.next()) {

				nvo.setibno_n(objRs.getInt("ibno_n"));
				nvo.setTitle_n(objRs.getString("title_n"));
				nvo.setContents_n(objRs.getString("contents_n"));
				nvo.setWriter_n(objRs.getString("writer_n"));
				nvo.setWriteTime_n(objRs.getString("writeTime_n"));
				nvo.setview_cnt_n(objRs.getInt("view_cnt_n"));
				nvo.setFileSize_n(objRs.getInt("FileSize_n"));
				nvo.setFileName_n(objRs.getString("FileName_n"));

			}

		} catch (Exception e) {
			System.out.println("DBCP E:" + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objStmt, objRs);

		}
		return nvo;
	}

}
