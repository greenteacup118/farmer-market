package pack_MyPage;

public class WishListBean {
	private int no;						// DB 테이블 번호
	private String uId;			// 아이디
	private String goodsCode;		// 제품코드
	
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

}
