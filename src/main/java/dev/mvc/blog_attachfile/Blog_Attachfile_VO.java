package dev.mvc.blog_attachfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Blog_Attachfile_VO {
//  attachfile_no                     NUMBER(10)     NOT NULL    PRIMARY KEY,
//  fname                             VARCHAR2(100)    NOT NULL,
//  fupname                           VARCHAR2(100)    NOT NULL,
//  thumb                             VARCHAR2(100)    NOT NULL,
//  fsize                             NUMBER(10)     DEFAULT 0     NOT NULL,
//  attachfile_rdate                  DATE     NOT NULL,
//  contents_no                       NUMBER(10)     NULL ,
  
  /** 파일 번호 */
  private int attachfile_no;
  
  /** 원본 파일명 */
  private String fname;
  
  /** 업로드된 파일명 */
  private String fupname;
  
  /** Thumb 이미지 */
  private String thumb;
  
  /** 파일 크기 */
  private long fsize;
  
  /** 등록일 */
  private String attachfile_rdate;
  
  /** 글 번호(FK) */
  private int contents_no;
  
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장 */
  private List<MultipartFile> fnamesMF;
  
  // private MultipartFile fnamesMF; // 하나의 파일 처리
  
  /** 파일 단위 출력 */
  private String flabel;

  public int getAttachfile_no() {
    return attachfile_no;
  }

  public void setAttachfile_no(int attachfile_no) {
    this.attachfile_no = attachfile_no;
  }

  public String getFname() {
    return fname;
  }

  public void setFname(String fname) {
    this.fname = fname;
  }

  public String getFupname() {
    return fupname;
  }

  public void setFupname(String fupname) {
    this.fupname = fupname;
  }

  public String getThumb() {
    return thumb;
  }

  public void setThumb(String thumb) {
    this.thumb = thumb;
  }

  public long getFsize() {
    return fsize;
  }

  public void setFsize(long fsize) {
    this.fsize = fsize;
  }

  public String getAttachfile_rdate() {
    return attachfile_rdate;
  }

  public void setAttachfile_rdate(String attachfile_rdate) {
    this.attachfile_rdate = attachfile_rdate;
  }

  public int getContents_no() {
    return contents_no;
  }

  public void setContents_no(int contents_no) {
    this.contents_no = contents_no;
  }

  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }

  public String getFlabel() {
    return flabel;
  }

  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }
}
