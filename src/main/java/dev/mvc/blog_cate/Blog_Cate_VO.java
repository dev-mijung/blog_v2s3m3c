package dev.mvc.blog_cate;

public class Blog_Cate_VO {
//  CREATE TABLE blog_cate(
//      cate_no                           NUMBER(10)     NOT NULL    PRIMARY KEY,
//      blog_categrpno                    NUMBER(10)     NOT NULL,
//      cate_name                         VARCHAR2(100)    NOT NULL,
//      cate_seqno                        NUMBER(10)     DEFAULT 1     NOT NULL,
//      cate_visible                          CHAR(1)    DEFAULT 'Y'     NOT NULL,
//      cate_rdate                        DATE     NOT NULL,
//      cate_cnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
//    FOREIGN KEY (blog_categrpno) REFERENCES blog_categrp (blog_categrpno)
//  );
  
  /** ��α� ī�װ� ��ȣ*/
  private int cate_no;
  
  /**��α� ī�װ� �׷� ��ȣ */
  private int blog_categrpno;
  
  /** ��α� ī�װ� �̸� */
  private String cate_name;

  /** ��α� ī�װ� ��¼��� */
  private int cate_seqno;
  
  /** ��α� ī�װ� ��� ��� */
  private String cate_visible;
  
  /** ��α� ī�װ� ������ */
  private String cate_rdate;
  
  /** ��α� ī�װ� ��ϵ� �� �� */
  private int cate_cnt;
  
  
  public int getCate_no() {
    return cate_no;
  }
  public void setCate_no(int cate_no) {
    this.cate_no = cate_no;
  }
  public int getBlog_categrpno() {
    return blog_categrpno;
  }
  public void setBlog_categrpno(int blog_categrpno) {
    this.blog_categrpno = blog_categrpno;
  }
  public String getCate_name() {
    return cate_name;
  }
  public void setCate_name(String cate_name) {
    this.cate_name = cate_name;
  }
  public int getCate_seqno() {
    return cate_seqno;
  }
  public void setCate_seqno(int cate_seqno) {
    this.cate_seqno = cate_seqno;
  }
  public String getCate_visible() {
    return cate_visible;
  }
  public void setCate_visible(String cate_visible) {
    this.cate_visible = cate_visible;
  }
  public String getCate_rdate() {
    return cate_rdate;
  }
  public void setCate_rdate(String cate_rdate) {
    this.cate_rdate = cate_rdate;
  }
  public int getCate_cnt() {
    return cate_cnt;
  }
  public void setCate_cnt(int cate_cnt) {
    this.cate_cnt = cate_cnt;
  }
}
