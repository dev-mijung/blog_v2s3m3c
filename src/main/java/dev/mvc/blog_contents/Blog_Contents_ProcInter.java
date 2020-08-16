package dev.mvc.blog_contents;

import java.util.List;

public interface Blog_Contents_ProcInter {

  /**
   * ºí·Î±× ÄÁÅÙÃ÷ µî·Ï
   * @param blog_Contents_VO
   * @return
   */
  public int create(Blog_Contents_VO blog_Contents_VO);
  
  /**
   * ºí·Î±× ÄÁÅÙÃ÷ ¸ñ·Ï
   * @return
   */
  public List<Blog_Contents_VO> list_all();
}
