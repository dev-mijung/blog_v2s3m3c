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
  
  /** ���� ��ȣ */
  private int attachfile_no;
  
  /** ���� ���ϸ� */
  private String fname;
  
  /** ���ε�� ���ϸ� */
  private String fupname;
  
  /** Thumb �̹��� */
  private String thumb;
  
  /** ���� ũ�� */
  private long fsize;
  
  /** ����� */
  private String attachfile_rdate;
  
  /** �� ��ȣ(FK) */
  private int contents_no;
  
  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ���� */
  private List<MultipartFile> fnamesMF;
  
  // private MultipartFile fnamesMF; // �ϳ��� ���� ó��
  
  /** ���� ���� ��� */
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
