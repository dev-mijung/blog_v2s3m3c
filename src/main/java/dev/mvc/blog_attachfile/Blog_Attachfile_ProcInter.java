package dev.mvc.blog_attachfile;

import java.util.List;

public interface Blog_Attachfile_ProcInter {
  /**
   * 파일 등록
   * @param blog_Attachfile_VO
   * @return
   */
  public int create(Blog_Attachfile_VO blog_Attachfile_VO);
  
  /**
   * 파일 목록
   * @return
   */
  public List<Blog_Attachfile_VO> list();
}
