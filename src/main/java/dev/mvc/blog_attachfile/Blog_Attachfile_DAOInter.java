package dev.mvc.blog_attachfile;

import java.util.List;

public interface Blog_Attachfile_DAOInter {
  /**
   * 첨부파일 등록
   * @param blog_Attachfile_VO
   * @return
   */
  public int create(Blog_Attachfile_VO blog_Attachfile_VO);
  
  /**
   * 첨부파일 목록
   * @return
   */
  public List<Blog_Attachfile_VO> list();
  
  /**
   * 첨부파일 조회
   * @param attachfile_no
   * @return
   */
  public Blog_Attachfile_VO read(int attachfile_no);
  
  /**
   * 첨부파일 삭제
   * @param attachfile_no
   * @return
   */
  public int delete(int attachfile_no);
}
