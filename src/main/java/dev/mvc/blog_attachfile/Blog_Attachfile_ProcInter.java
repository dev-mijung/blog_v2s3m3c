package dev.mvc.blog_attachfile;

import java.util.List;

public interface Blog_Attachfile_ProcInter {
  /**
   * ���� ���
   * @param blog_Attachfile_VO
   * @return
   */
  public int create(Blog_Attachfile_VO blog_Attachfile_VO);
  
  /**
   * ���� ���
   * @return
   */
  public List<Blog_Attachfile_VO> list();
}
