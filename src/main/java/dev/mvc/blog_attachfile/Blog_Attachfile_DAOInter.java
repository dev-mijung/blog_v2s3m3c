package dev.mvc.blog_attachfile;

import java.util.List;

public interface Blog_Attachfile_DAOInter {
  /**
   * ÷������ ���
   * @param blog_Attachfile_VO
   * @return
   */
  public int create(Blog_Attachfile_VO blog_Attachfile_VO);
  
  /**
   * ÷������ ���
   * @return
   */
  public List<Blog_Attachfile_VO> list();
  
  /**
   * ÷������ ��ȸ
   * @param attachfile_no
   * @return
   */
  public Blog_Attachfile_VO read(int attachfile_no);
  
  /**
   * ÷������ ����
   * @param attachfile_no
   * @return
   */
  public int delete(int attachfile_no);
}
