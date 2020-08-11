package dev.mvc.blog_categrp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.blog_categrp.Blog_Categrp_Proc")
public class Blog_Categrp_Proc implements Blog_Categrp_ProcInter {
@Autowired
  private Blog_Categrp_DAOInter blog_Categrp_DAO;

  @Override
  public int categrp_create(Blog_Categrp_VO blog_Categrp_VO) {
    int cnt = this.blog_Categrp_DAO.categrp_create(blog_Categrp_VO);
    return cnt;
  }

  @Override
  public List<Blog_Categrp_VO> list_blog_seqno_asc() {
    List<Blog_Categrp_VO> list = this.blog_Categrp_DAO.list_blog_seqno_asc();
    return list;
  }

  @Override
  public Blog_Categrp_VO read(int blog_categrpno) {
    Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_DAO.read(blog_categrpno);
    return blog_Categrp_VO;
  }

  @Override
  public int update(Blog_Categrp_VO blog_Categrp_VO) {
    int cnt = this.blog_Categrp_DAO.update(blog_Categrp_VO);
    return cnt;
  }

  @Override
  public int delete(int blog_categrpno) {
    int cnt = this.blog_Categrp_DAO.delete(blog_categrpno);
    return cnt;
  }

  @Override
  public int update_seqno_up(int blog_categrpno) {
    int cnt = this.blog_Categrp_DAO.update_seqno_up(blog_categrpno);
    return cnt;
  }

  @Override
  public int update_seqno_down(int blog_categrpno) {
    int cnt = this.blog_Categrp_DAO.update_seqno_down(blog_categrpno);
    return cnt;
  }

  @Override
  public int update_visible(Blog_Categrp_VO blog_Categrp_VO) {
    int cnt = 0;
    if(blog_Categrp_VO.getBlog_visible().toUpperCase().equals("Y")) {
      blog_Categrp_VO.setBlog_visible("N");
    } else {
      blog_Categrp_VO.setBlog_visible("Y");
    }
    cnt = this.blog_Categrp_DAO.update_visible(blog_Categrp_VO);
    return cnt;
  }

  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param blog_categrpno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int blog_categrpno, int search_count, int nowPage) {
    int totalPage = (int)(Math.ceil((double)search_count/Blog_Categrp.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Blog_Categrp.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Blog_Categrp.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Blog_Categrp.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Blog_Categrp.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ 20
    int _nowPage = (nowGrp-1) * Blog_Categrp.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
 
    // �߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ �������� �Ѿ�ٸ� ���� ��� ����
        break; 
      } 
  
      if (nowPage == i){ // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Blog_Categrp.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public ArrayList<Blog_Categrp_VO> list_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Blog_Categrp.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1; 
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Blog_Categrp.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    ArrayList<Blog_Categrp_VO> list = this.blog_Categrp_DAO.list_paging(map);
    
    return list;
  }

  @Override
  public int search_count(HashMap<String, Object> map) {
    int cnt = this.blog_Categrp_DAO.search_count(map);
    return cnt;
  }

  
 
}
