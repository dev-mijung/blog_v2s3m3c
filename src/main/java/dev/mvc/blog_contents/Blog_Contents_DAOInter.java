package dev.mvc.blog_contents;

import java.util.HashMap;
import java.util.List;

public interface Blog_Contents_DAOInter {
  
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
   * cate_no별 목록
   * @param cate_no
   * @return
   */
  public List<Blog_Contents_VO> list_by_cate(int cate_no);
  
  /**
   * 블로그 컨텐츠 1건 조회
   * @param contents_no
   * @return
   */
  public Blog_Contents_VO read(int contents_no);
  
  /**
   * 블로그 컨텐츠 수정
   * @param blog_Contents_VO
   * @return
   */
  public int update(Blog_Contents_VO blog_Contents_VO);
  
  /**
   * 수정,삭제시 패스워드 체크
   * @param map
   * @return
   */
  public int passwd_check(HashMap<String, Object> map);
  
  /**
   * 블로그 컨텐츠 삭제
   * @param contents_no
   * @return
   */
  public int delete(int contents_no);
}
