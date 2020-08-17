package dev.mvc.blog_contents;

import java.util.HashMap;
import java.util.List;

public interface Blog_Contents_ProcInter {

  /**
   * 블로그 컨텐츠 등록
   * @param blog_Contents_VO
   * @return
   */
  public int create(Blog_Contents_VO blog_Contents_VO);
  
  /**
   * 블로그 컨텐츠 목록
   * @return
   */
  public List<Blog_Contents_VO> list_all();
  
  /**
   * 블로그 컨텐츠 1건 조회
   * @param contents_no
   * @return
   */
  public Blog_Contents_VO read(int contents_no);
  
  /**
   * 블로그 컨텐츠 수정 폼
   * @param contents_no
   * @return
   */
  public Blog_Contents_VO update(int contents_no);
  
  /**
   * 블로그 컨텐츠 수정 처리
   * @param blog_Contents_VO
   * @return 처리 된 레코드 갯수
   */
  public int update(Blog_Contents_VO blog_Contents_VO);
  
  /**
   * 수정,삭제시 패스워드 체크
   * @param map
   * @return
   */
  public int passwd_check(HashMap map);
  
  /**
   * 블로그 컨텐츠 삭제
   * @param contents_no
   * @return
   */
  public int delete(int contents_no);
}
