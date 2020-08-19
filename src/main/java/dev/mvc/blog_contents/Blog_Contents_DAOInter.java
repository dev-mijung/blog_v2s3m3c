package dev.mvc.blog_contents;

import java.util.HashMap;
import java.util.List;

public interface Blog_Contents_DAOInter {
  
  /**
   * ��α� ������ ���
   * @param blog_Contents_VO
   * @return
   */
  public int create(Blog_Contents_VO blog_Contents_VO);
  
  /**
   * ��α� ������ ���
   * @return
   */
  public List<Blog_Contents_VO> list_all();
  
  /**
   * cate_no�� ���
   * @param cate_no
   * @return
   */
  public List<Blog_Contents_VO> list_by_cate(int cate_no);
  
  /**
   * ��α� ������ 1�� ��ȸ
   * @param contents_no
   * @return
   */
  public Blog_Contents_VO read(int contents_no);
  
  /**
   * ��α� ������ ����
   * @param blog_Contents_VO
   * @return
   */
  public int update(Blog_Contents_VO blog_Contents_VO);
  
  /**
   * ����,������ �н����� üũ
   * @param map
   * @return
   */
  public int passwd_check(HashMap<String, Object> map);
  
  /**
   * ��α� ������ ����
   * @param contents_no
   * @return
   */
  public int delete(int contents_no);
}
