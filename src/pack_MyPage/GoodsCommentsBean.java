package pack_MyPage;

public class GoodsCommentsBean { // 상품 후기 게시판
	private int no; // DB 테이블 번호
	private String uId; // 아이디
	private String goodsCode; // 제품코드
	private String title_c; // 제목
	private String contetns_c; // 내용
	private String fileOName_c; // 파일 이름
	private String fileRName_c; // 파일 이름
	private String writeTime_c; // 작성시간
	private int view_cnt_c; // 조회수

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

	public String getTitle_c() {
		return title_c;
	}

	public void setTitle_c(String title_c) {
		this.title_c = title_c;
	}

	public String getContetns_c() {
		return contetns_c;
	}

	public void setContetns_c(String contetns_c) {
		this.contetns_c = contetns_c;
	}

	public String getFileOName_c() {
		return fileOName_c;
	}

	public void setFileOName_c(String fileOName_c) {
		this.fileOName_c = fileOName_c;
	}

	public String getFileRName_c() {
		return fileRName_c;
	}

	public void setFileRName_c(String fileRName_c) {
		this.fileRName_c = fileRName_c;
	}

	public String getWriteTime_c() {
		return writeTime_c;
	}

	public void setWriteTime_c(String writeTime_c) {
		this.writeTime_c = writeTime_c;
	}

	public int getView_cnt_c() {
		return view_cnt_c;
	}

	public void setView_cnt_c(int view_cnt_c) {
		this.view_cnt_c = view_cnt_c;
	}

}
