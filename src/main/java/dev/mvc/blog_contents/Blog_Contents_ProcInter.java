package dev.mvc.blog_contents;

import java.util.List;

public interface Blog_Contents_ProcInter {

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
}
