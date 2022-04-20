package pack_MyPage;

public class GoodsQnABean { //상품문의
	private int no;						// DB 테이블 번호
	private String uId;			// 아이디
	private String goodsCode;		// 제품코드
	private String title_q ;		// 제목
	private String contetns_q;		// 내용
	private String fileOName_q;		// 파일 이름
	private String fileRName_q;		// 파일 이름
	private String writeTime_q;				// 작성시간
	private int view_cnt_q;				// 조회수
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getTitle_q() {
		return title_q;
	}
	public void setTitle_q(String title_q) {
		this.title_q = title_q;
	}
	public String getContetns_q() {
		return contetns_q;
	}
	public void setContetns_q(String contetns_q) {
		this.contetns_q = contetns_q;
	}
	public String getFileOName_q() {
		return fileOName_q;
	}
	public void setFileOName_q(String fileOName_q) {
		this.fileOName_q = fileOName_q;
	}
	public String getFileRName_q() {
		return fileRName_q;
	}
	public void setFileRName_q(String fileRName_q) {
		this.fileRName_q = fileRName_q;
	}
	public String getWriteTime_q() {
		return writeTime_q;
	}
	public void setWriteTime_q(String writeTime_q) {
		this.writeTime_q = writeTime_q;
	}
	public int getView_cnt_q() {
		return view_cnt_q;
	}
	public void setView_cnt_q(int view_cnt_q) {
		this.view_cnt_q = view_cnt_q;
	}
	
	
}
