package egovframework.example.main.vo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;



@Data
public class MainVO {
	
	private int srSeq;
	private String titl;
    private String cntn;
    private String writNm;
    private String writId;
    private String fileName;
    private String regrId;
    private String regrIp;
    private String regDttm;
    private String mdfrId;
    private String mdfrIp;
    private String modDttm;
    private String statusYn;

	
}
