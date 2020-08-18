package dev.mvc.blog_attachfile;

import java.util.List;

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

  @Override
  public List<Blog_Attachfile_VO> list() {
    List<Blog_Attachfile_VO> list = this.blog_Attachfile_DAO.list();
    return list;
  }

  @Override
  public Blog_Attachfile_VO read(int attachfile_no) {
    Blog_Attachfile_VO blog_Attachfile_VO = this.blog_Attachfile_DAO.read(attachfile_no);
    return blog_Attachfile_VO;
  }

  @Override
  public int delete(int attachfile_no) {
    int cnt = this.blog_Attachfile_DAO.delete(attachfile_no);
    return cnt;
  }

}
