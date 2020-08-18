package dev.mvc.blog_cate;

public class Blog_Categrp_Cate_VO {
//  SELECT r.blog_categrpno as r_blog_categrpno, r.blog_name as r_blog_name,
//  c.cate_no as c_cate_no, c.blog_categrpno as c_blog_categrpno, c.cate_name as c_cate_name,
//  c.cate_seqno as c_cate_seqno, c.cate_visible as c_cate_visible, c.cate_rdate as c_cate_rdate,
//  c.cate_cnt as c_cate_cnt
//  FROM blog_categrp r, blog_cate c
//  WHERE r.blog_categrpno = c.blog_categrpno
//  ORDER BY r.blog_categrpno ASC, c.cate_seqno ASC;
 
 //-------------------------------------------------------------------
 // Blog_Categrp table
 // -------------------------------------------------------------------
  private int r_blog_categrpno;
  /** 부모 테이블 카테고리 그룹 번호 */
  
  private String r_blog_name;
  /** 부모 테이블 카테고리 그룹 이름 */
  
  //-------------------------------------------------------------------
   // Blog_Cate table
   // -------------------------------------------------------------------  
  
  /** 블로그 카테고리 번호*/
  private int cate_no;
  
  /**블로그 카테고리 그룹 번호 */
  private int blog_categrpno;
  
  /** 블로그 카테고리 이름 */
  private String cate_name;

  /** 블로그 카테고리 출력순서 */
  private int cate_seqno;
  
  /** 블로그 카테고리 출력 모드 */
  private String cate_visible;
  
  /** 블로그 카테고리 생성일 */
  private String cate_rdate;
  
  /** 블로그 카테고리 등록된 글 수 */
  private int cate_cnt;

  public int getR_blog_categrpno() {
    return r_blog_categrpno;
  }

  public void setR_blog_categrpno(int r_blog_categrpno) {
    this.r_blog_categrpno = r_blog_categrpno;
  }

  public String getR_blog_name() {
    return r_blog_name;
  }

  public void setR_blog_name(String r_blog_name) {
    this.r_blog_name = r_blog_name;
  }

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
