package dev.mvc.blog_contents;

import java.util.List;

public interface Blog_Contents_DAOInter {
  
  /**
   * ���α� ������ ���
   * @param blog_Contents_VO
   * @return
   */
  public int create(Blog_Contents_VO blog_Contents_VO);
  
  /**
   * ���α� ������ ���
   * @return
   */
  public List<Blog_Contents_VO> list_all();
  
  /**
   * ���α� ������ 1�� ��ȸ
   * @param contents_no
   * @return
   */
  public Blog_Contents_VO read(int contents_no);
}
