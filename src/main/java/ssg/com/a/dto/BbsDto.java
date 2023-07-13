package ssg.com.a.dto;

import java.io.Serializable;

// BBS Bulletin Board System 전자 게시판
public class BbsDto implements Serializable{

	private int seq;		// 글번호  sequence 중복되지 않는 번호
	private String id;		// 작성자 (자유 게시판같은 경우엔 작성자 변수를 뺌)
	
	// 답변이 있는 게시판일 때 필요한 변수들
	private int ref;		// 그룹번호(글번호)
	private int step;		// 행번호
	private int depth;		// 깊이
	
	private String title;
	private String content;
	private String wdate; // 작성일자  <- 최신 글이 위로 올라오게 할 때 기준?으로 필요	
	private int del; // 글 삭제 여부?
	private int readcount;	// 조회수
	
	public BbsDto() {
	}

	public BbsDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public BbsDto(int seq, String id, int ref, int step, int depth, String title, String content, String wdate, int del,
			int readcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}





