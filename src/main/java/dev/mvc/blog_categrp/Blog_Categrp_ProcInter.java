package dev.mvc.blog_categrp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface Blog_Categrp_ProcInter {
  /**
   * 등록
   * @param blog_Categrp_VO
   * @return 등록 된 레코드 갯수
   */
  public int categrp_create(Blog_Categrp_VO blog_Categrp_VO);
  
  /**
   * 목록
   * @return 레코드목록(자바 입장에서는 Blog_Categrp_VO목록)
   */
  public List<Blog_Categrp_VO> list_blog_seqno_asc();
  
  /**
   * 조회
   * @param blog_categrpno
   * @return
   */
  public Blog_Categrp_VO read(int blog_categrpno);
  
  /**
   * 수정
   * @param blog_Categrp_VO
   * @return
   */
  public int update(Blog_Categrp_VO blog_Categrp_VO);
  
  /**
   * 삭제
   * @param blog_categrpno
   * @return
   */
  public int delete(int blog_categrpno);
  
  /**
   * 우선순위 상향 up 10 ▷ 1
   * @param blog_categrpno
   * @return
   */
  public int update_seqno_up(int blog_categrpno);
  
  /**
   * 우선순위 하향 up 1 ▷ 10
   * @param blog_categrpno
   * @return
   */
  public int update_seqno_down(int blog_categrpno);
  
  /**
   * 출력 모드의 변경 
   * @param blog_Categrp_VO
   * @return
   */
  public int update_visible(Blog_Categrp_VO blog_Categrp_VO);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param blog_categrpno 블로그 카테고리번호
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @return
   */
  public String pagingBox(String listFile, int categrpno, int search_count, int nowPage);
  
  /**
   * 페이징 목록
   * @param map
   * @return
   */
  public ArrayList<Blog_Categrp_VO> list_paging(HashMap<String, Object> map);
  
  /**
   * 검색갯수
   * @return
   */
   public int search_count(HashMap<String, Object> map);
}
