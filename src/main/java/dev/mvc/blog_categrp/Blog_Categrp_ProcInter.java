package dev.mvc.blog_categrp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface Blog_Categrp_ProcInter {
  /**
   * ���
   * @param blog_Categrp_VO
   * @return ��� �� ���ڵ� ����
   */
  public int categrp_create(Blog_Categrp_VO blog_Categrp_VO);
  
  /**
   * ���
   * @return ���ڵ���(�ڹ� ���忡���� Blog_Categrp_VO���)
   */
  public List<Blog_Categrp_VO> list_blog_seqno_asc();
  
  /**
   * ��ȸ
   * @param blog_categrpno
   * @return
   */
  public Blog_Categrp_VO read(int blog_categrpno);
  
  /**
   * ����
   * @param blog_Categrp_VO
   * @return
   */
  public int update(Blog_Categrp_VO blog_Categrp_VO);
  
  /**
   * ����
   * @param blog_categrpno
   * @return
   */
  public int delete(int blog_categrpno);
  
  /**
   * �켱���� ���� up 10 �� 1
   * @param blog_categrpno
   * @return
   */
  public int update_seqno_up(int blog_categrpno);
  
  /**
   * �켱���� ���� up 1 �� 10
   * @param blog_categrpno
   * @return
   */
  public int update_seqno_down(int blog_categrpno);
  
  /**
   * ��� ����� ���� 
   * @param blog_Categrp_VO
   * @return
   */
  public int update_visible(Blog_Categrp_VO blog_Categrp_VO);
  
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param blog_categrpno ��α� ī�װ���ȣ
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @return
   */
  public String pagingBox(String listFile, int categrpno, int search_count, int nowPage);
  
  /**
   * ����¡ ���
   * @param map
   * @return
   */
  public ArrayList<Blog_Categrp_VO> list_paging(HashMap<String, Object> map);
  
  /**
   * �˻�����
   * @return
   */
   public int search_count(HashMap<String, Object> map);
}
