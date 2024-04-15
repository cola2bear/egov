package egovframework.example.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String id; //아이디
    private String password; //비밀번호
    private String name; //이름
    private String nickname; //닉네임
    private String email; //이메일
    private String phoneNumber; //휴대폰 번호
    private Date createDate; //생성일
    private char isDeleted; //삭제여부
    
    // 기본 생성자
    public MemberVO() {
        // 필드 초기화
        this.createDate = new Date(); // 현재 날짜와 시간으로 초기화
        this.isDeleted = 'N'; // 삭제 여부를 기본값으로 초기화
    }
    

	
    
}
