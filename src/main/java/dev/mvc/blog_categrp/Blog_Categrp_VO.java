package dev.mvc.blog_categrp;

public class Blog_Categrp_VO {
//  CREATE TABLE blog_categrp(
//      blog_categrpno                    NUMBER(10)     NOT NULL,
//      blog_name                         VARCHAR2(50)     NOT NULL,
//      blog_seqno                        NUMBER(7)    DEFAULT 0     NOT NULL,
//      blog_visible                      CHAR(1)    DEFAULT 'Y'     NOT NULL,
//      blog_rdate                        DATE     NOT NULL
//  );
  
  /**블로그 카테고리 그룹 번호 */
  private int blog_categrpno;
  
  /**블로그 카테고리 그룹 이름 */
  private String blog_name;
  
  /** 블로그 카테고리 그룹  출력 순서 */
  private int blog_seqno;
  
  /** 블로그 카테고리 그룹 출력 모드 */
  private String blog_visible;
  
  /** 블로그 카테고리 그룹 생성일 */
  private String blog_rdate;
  
  public int getBlog_categrpno() {
    return blog_categrpno;
  }
  public void setBlog_categrpno(int blog_categrpno) {
    this.blog_categrpno = blog_categrpno;
  }
  public String getBlog_name() {
    return blog_name;
  }
  public void setBlog_name(String blog_name) {
    this.blog_name = blog_name;
  }
  public int getBlog_seqno() {
    return blog_seqno;
  }
  public void setBlog_seqno(int blog_seqno) {
    this.blog_seqno = blog_seqno;
  }
  public String getBlog_visible() {
    return blog_visible;
  }
  public void setBlog_visible(String blog_visible) {
    this.blog_visible = blog_visible;
  }
  public String getBlog_rdate() {
    return blog_rdate;
  }
  public void setBlog_rdate(String blog_rdate) {
    this.blog_rdate = blog_rdate;
  }
}
