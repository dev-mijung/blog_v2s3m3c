package dev.mvc.blog_contents;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.blog_contents.Blog_Contents_Proc")
public class Blog_Contents_Proc implements Blog_Contents_ProcInter {
@Autowired
  private Blog_Contents_DAOInter blog_Contents_DAO;
  
  @Override
  public int create(Blog_Contents_VO blog_Contents_VO) {
    int cnt = this.blog_Contents_DAO.create(blog_Contents_VO);
    return cnt;
  }

  @Override
  public List<Blog_Contents_VO> list() {
    List<Blog_Contents_VO> list = this.blog_Contents_DAO.list();
    return list;
  }

}
