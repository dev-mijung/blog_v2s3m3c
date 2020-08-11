package dev.mvc.blog_cate;

import java.util.List;

public interface Blog_Cate_DAOInter {

  /**
   * 카테고리 등록
   * @param blog_Cate_VO
   * @return 등록 된 레코드 갯수
   */
  public int create(Blog_Cate_VO blog_Cate_VO);
  
  /**
   * 카테고리 목록
   * @return
   */
  public List<Blog_Cate_VO> list_seqno_asc();
  
  /** 
   * 카테고리 조회
   * @param cateno
   * @return
   */
  public Blog_Cate_VO read(int cate_no);
  
  /**
   * 카테고리 수정
   * @param blog_Cate_VO
   * @return
   */
  public int update(Blog_Cate_VO blog_Cate_VO);
  
 /**
  * 카테고리 삭제
  * @param cate_no
  * @return
  */
  public int delete(int cate_no);
  
/**
 * 출력순서 상향, 10 ▷ 1
 * @param cate_no
 * @return
 */
  public int update_seqno_up(int cate_no);
  
  /**
   * 출력순서 하향, 출력순서 하향, 1 ▷ 10
   * @param cate_no
   * @return
   */
  public int update_seqno_down(int cate_no);
  
  /**
   * 출력모드 변경
   * @param blog_Cate_VO
   * @return
   */
  public int update_visible(Blog_Cate_VO blog_Cate_VO);
  
}
