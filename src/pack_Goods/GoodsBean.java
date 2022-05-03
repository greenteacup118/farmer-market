package pack_Goods;

public class GoodsBean {
	
	private int num;						// DB 테이블 번호
	private String goodsImg;			// 제품사진
	private String goodsCode;		// 제품코드
	private int goodsPrice;				// 제품가격
	private String goodsName;		// 제품이름
	private String goodsCatch;		// 제품소제목
	private String goodsWeight;		// 제품중량/용량
	private String contentImg1;		// 제품상세설명 상단 이미지
	private String contentImg2;		// 제품상세설명 중단 이미지
	private String contentImg3;		// 제품상세설명 하단 이미지
	private int eventRate;				// 제품 할인율
	private String deliType;			// 배송방법
	private String unitType;			// 판매단위
	private String packType;			// 포장방법
	
	
	
	
	
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsCatch() {
		return goodsCatch;
	}
	public void setGoodsCatch(String goodsCatch) {
		this.goodsCatch = goodsCatch;
	}
	public String getGoodsWeight() {
		return goodsWeight;
	}
	public void setGoodsWeight(String goodsWeight) {
		this.goodsWeight = goodsWeight;
	}
	public String getContentImg1() {
		return contentImg1;
	}
	public void setContentImg1(String contentImg1) {
		this.contentImg1 = contentImg1;
	}
	public String getContentImg2() {
		return contentImg2;
	}
	public void setContentImg2(String contentImg2) {
		this.contentImg2 = contentImg2;
	}
	public String getContentImg3() {
		return contentImg3;
	}
	public void setContentImg3(String contentImg3) {
		this.contentImg3 = contentImg3;
	}
	public int getEventRate() {
		return eventRate;
	}
	public void setEventRate(int eventRate) {
		this.eventRate = eventRate;
	}
	public String getDeliType() {
		return deliType;
	}
	public void setDeliType(String deliType) {
		this.deliType = deliType;
	}
	public String getUnitType() {
		return unitType;
	}
	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}
	public String getPackType() {
		return packType;
	}
	public void setPackType(String packType) {
		this.packType = packType;
	}
	
}
