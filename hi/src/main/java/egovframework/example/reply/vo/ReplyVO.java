package egovframework.example.reply.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rno;
	private int srSeq;
	private String content;
	private String writer;
	private Date regdate;

	
}
