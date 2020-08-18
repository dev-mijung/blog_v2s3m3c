package dev.mvc.blog_attachfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.blog_attachfile.Blog_Attachfile_Proc")
public class Blog_Attachfile_Proc implements Blog_Attachfile_ProcInter {
  @Autowired
  private Blog_Attachfile_DAOInter blog_Attachfile_DAO;
  
  @Override
  public int create(Blog_Attachfile_VO blog_Attachfile_VO) {
    int cnt = this.blog_Attachfile_DAO.create(blog_Attachfile_VO);
    return cnt;
  }

}
