package pack_Util;

public class PageHandler {
	private int totalCnt; // 총 게시물 갯수
	private int pageSize; // 한 페이지의 크기
	private int navSize = 10; // 페이지 내비게이션의 크기
	private int totalPage; // 전체 페이지의 갯수
	private int page; // 현재 페이지
	private int beginPage; // 네비게이션의 첫번째 페이지
	private int endPage; // 네비게이션의 마지막 페이지
	private boolean showPrev; // 이전페이지로 이동하는 링크를 보여줄 것인지
	private boolean showNext; // 다음페이지로 이동하는 링크를 보여줄 것인지

	public PageHandler(int totalCnt, int page) {
		// 한페이지의 게시물 갯수를 지정하지 않으면 10개로 지정해서
		// 아래 생성자를 다시 호출
		this(totalCnt, page, 10);
	}

	public PageHandler(int totalCnt, int page, int pageSize) {
		this.totalCnt = totalCnt;
		this.page = page;
		this.pageSize = pageSize;

		// 전체 게시물 갯수에서 한페이지에서 보여줄 게시글 수로 나눠서 페이지 계산
		totalPage = (int) Math.ceil((double) totalCnt / pageSize);
		// 페이지 번호 가장 처음 나올 숫자(ex. navSize가 10개 이므로 1, 11, 21, ...)
		beginPage = (page - 1) / navSize * navSize + 1;
		// 페이지 번호 중 가장 마지막 숫자 (10, 20, .. 또는 게시글 수에 따라 마지막 페이지 중 최소값)
		endPage = Math.min(beginPage + navSize - 1, totalPage);
		// 보여지는 번호중 가장 작은 수가 1이 아닐 때 이전버튼 true(활성화)
		showPrev = beginPage != 1;
		// 마지막 페이지가 전체 페이지가 아닐 때 다음 버튼 true(활성화)
		showNext = endPage != totalPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getNavSize() {
		return navSize;
	}

	public void setNavSize(int navSize) {
		this.navSize = navSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

}
