package dev.mvc.blog_cate;

import java.util.List;

public interface Blog_Cate_DAOInter {

  /**
   * ī�װ� ���
   * @param blog_Cate_VO
   * @return ��� �� ���ڵ� ����
   */
  public int create(Blog_Cate_VO blog_Cate_VO);
  
  /**
   * ī�װ� ���
   * @return
   */
  public List<Blog_Cate_VO> list_seqno_asc();
  
  /** 
   * ī�װ� ��ȸ
   * @param cateno
   * @return
   */
  public Blog_Cate_VO read(int cate_no);
  
  /**
   * ī�װ� ����
   * @param blog_Cate_VO
   * @return
   */
  public int update(Blog_Cate_VO blog_Cate_VO);
  
 /**
  * ī�װ� ����
  * @param cate_no
  * @return
  */
  public int delete(int cate_no);
  
/**
 * ��¼��� ����, 10 �� 1
 * @param cate_no
 * @return
 */
  public int update_seqno_up(int cate_no);
  
  /**
   * ��¼��� ����, ��¼��� ����, 1 �� 10
   * @param cate_no
   * @return
   */
  public int update_seqno_down(int cate_no);
  
  /**
   * ��¸�� ����
   * @param blog_Cate_VO
   * @return
   */
  public int update_visible(Blog_Cate_VO blog_Cate_VO);
  
}
