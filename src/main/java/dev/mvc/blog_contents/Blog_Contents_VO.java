package dev.mvc.blog_contents;

public class Blog_Contents_VO {
//  contents_no                       NUMBER(10)     NOT NULL    PRIMARY KEY,
//  cate_no                           NUMBER(10)     NOT NULL,
//  member_no                         NUMBER(10)     NOT NULL,
//  contents_title                    VARCHAR2(300)    NOT NULL,
//  contents_content                  CLOB               NOT NULL,
//  contents_recom                    NUMBER(7)    NOT NULL,
//  contents_cnt                      NUMBER(7)    NOT NULL,
//  contents_reply                    NUMBER(7)    NOT NULL,
//  contents_web                      VARCHAR2(500)    NULL ,
//  contents_map                      VARCHAR2(1000)     NULL ,
//  youtube                           VARCHAR2(1000)     NULL ,
//  mp3                               VARCHAR2(1000)     NULL ,
//  mp4                               VARCHAR2(1000)     NULL ,
//  contents_visible                  CHAR(1)    DEFAULT 'Y'     NOT NULL,
//  ip                                VARCHAR2(15)     NOT NULL,
//  contents_passwd                   VARCHAR2(15)     NOT NULL,
//  contents_grpno                    NUMBER(8)    NOT NULL,
//  contents_indent                   NUMBER(2)    NOT NULL,
//  contents_ansnum                   NUMBER(3)    NOT NULL,
//  contents_word                     VARCHAR2(300)    NULL ,
  
  /** ºí·Î±× ÄÁÅÙÃ÷ ¹øÈ£ */
  private int contents_no;
  
  /** ºí·Î±× Ä«Å×°í¸® ¹øÈ£ */
  private int cate_no;
  
  /** ºí·Î±× È¸¿ø ¹øÈ£ */
  private int member_no;
  
  /** ÄÁÅÙÃ÷ Á¦¸ñ */
  private String contents_title;
  
  /** ÄÁÅÙÃ÷ ³»¿ë */
  private String contents_content;
  
  /** ÄÁÅÙÃ÷ÃßÃµ¼ö */
  private int contents_recom;
  
  /** ÄÁÅÙÃ÷Á¶È¸¼ö */
  private int contents_cnt;
  
  /** ÄÁÅÙÃ÷ ´ñ±Û ¼ö */
  private int contents_reply;
  
  /** ÄÁÅÙÃ÷ ÀÎÅÍ³İ ÁÖ¼Ò */
  private String contents_web;
  
  /** ÄÁÅÙÃ÷ Áöµµ */
  private String contents_map;
  
  /** Youtube */
  private String youtube;
  
  /** MP3 */
  private String mp3;
  
  /** MP4 */
  private String mp4;
  
  /** ÄÁÅÙÃ÷Ãâ·Â¸ğµå */
  private String contents_visible;
  
  /** IP */
  private String ip;
  
  /** ÆĞ½º¿öµå */
  private String contents_passwd;
  
  /** ±×·ì¹øÈ£ */
  private int contents_grpno;
  
  /** µé¿©¾²±â/´äº¯Â÷¼ö */
  private int contents_indent;
  
  /** ´äº¯¼ø¼­ */
  private int contents_ansnum;
  
  /** °Ë»ö¾î */
  private String contents_word;
  
  /** ÄÁÅÙÃ÷ µî·ÏÀÏ */
  private String contents_rdate;
  
  public int getContents_no() {
    return contents_no;
  }
  public void setContents_no(int contents_no) {
    this.contents_no = contents_no;
  }
  public int getCate_no() {
    return cate_no;
  }
  public void setCate_no(int cate_no) {
    this.cate_no = cate_no;
  }
  public int getMember_no() {
    return member_no;
  }
  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }
  public String getContents_title() {
    return contents_title;
  }
  public void setContents_title(String contents_title) {
    this.contents_title = contents_title;
  }
  public String getContents_content() {
    return contents_content;
  }
  public void setContents_content(String contents_content) {
    this.contents_content = contents_content;
  }
  public int getContents_recom() {
    return contents_recom;
  }
  public void setContents_recom(int contents_recom) {
    this.contents_recom = contents_recom;
  }
  public int getContents_cnt() {
    return contents_cnt;
  }
  public void setContents_cnt(int contents_cnt) {
    this.contents_cnt = contents_cnt;
  }
  public int getContents_reply() {
    return contents_reply;
  }
  public void setContents_reply(int contents_reply) {
    this.contents_reply = contents_reply;
  }
  public String getContents_web() {
    return contents_web;
  }
  public void setContents_web(String contents_web) {
    this.contents_web = contents_web;
  }
  public String getContents_map() {
    return contents_map;
  }
  public void setContents_map(String contents_map) {
    this.contents_map = contents_map;
  }
  public String getYoutube() {
    return youtube;
  }
  public void setYoutube(String youtube) {
    this.youtube = youtube;
  }
  public String getMp3() {
    return mp3;
  }
  public void setMp3(String mp3) {
    this.mp3 = mp3;
  }
  public String getMp4() {
    return mp4;
  }
  public void setMp4(String mp4) {
    this.mp4 = mp4;
  }
  public String getContents_visible() {
    return contents_visible;
  }
  public void setContents_visible(String contents_visible) {
    this.contents_visible = contents_visible;
  }
  public String getIp() {
    return ip;
  }
  public void setIp(String ip) {
    this.ip = ip;
  }
  public String getContents_passwd() {
    return contents_passwd;
  }
  public void setContents_passwd(String contents_passwd) {
    this.contents_passwd = contents_passwd;
  }
  public int getContents_grpno() {
    return contents_grpno;
  }
  public void setContents_grpno(int contents_grpno) {
    this.contents_grpno = contents_grpno;
  }
  public int getContents_indent() {
    return contents_indent;
  }
  public void setContents_indent(int contents_indent) {
    this.contents_indent = contents_indent;
  }
  public int getContents_ansnum() {
    return contents_ansnum;
  }
  public void setContents_ansnum(int contents_ansnum) {
    this.contents_ansnum = contents_ansnum;
  }
  public String getContents_word() {
    return contents_word;
  }
  public void setContents_word(String contents_word) {
    this.contents_word = contents_word;
  }
  public String getContents_rdate() {
    return contents_rdate;
  }
  public void setContents_rdate(String contents_rdate) {
    this.contents_rdate = contents_rdate;
  }
}
