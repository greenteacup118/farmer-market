package pack_Goods;

public class BasketBean {
	
	
	
	public String uId;				// 사용자 아이디
	public String goodsCode;		// 제품코드
	public int goodsCnt;			// 제품구매수량
	public String uDeli;				// 배달예정지
	public int deliPrice;				// 배송비	 
	
	
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
	public int getGoodsCnt() {
		return goodsCnt;
	}
	public void setGoodsCnt(int goodsCnt) {
		this.goodsCnt = goodsCnt;
	}
	public String getuDeli() {
		return uDeli;
	}
	public void setuDeli(String uDeli) {
		this.uDeli = uDeli;
	}
	public int getDeliPrice() {
		return deliPrice;
	}
	public void setDeliPrice(int deliPrice) {
		this.deliPrice = deliPrice;
	}

}
