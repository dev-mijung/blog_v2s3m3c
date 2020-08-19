package dev.mvc.blog_contents;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

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
  public List<Blog_Contents_VO> list_all() {
    List<Blog_Contents_VO> list = this.blog_Contents_DAO.list_all();
    return list;
  }

  @Override
  public Blog_Contents_VO read(int contents_no) {
    
    Blog_Contents_VO blog_Contents_VO = this.blog_Contents_DAO.read(contents_no);
    
    String title = blog_Contents_VO.getContents_title();
    title = Tool.convertChar(title);
    blog_Contents_VO.setContents_title(title);
    
    return blog_Contents_VO;
  }

  @Override
  public int update(Blog_Contents_VO blog_Contents_VO) {
    int cnt = this.blog_Contents_DAO.update(blog_Contents_VO);
    return cnt;
  }
  
  @Override
  public Blog_Contents_VO update(int contents_no) {
    Blog_Contents_VO blog_Contents_VO = this.blog_Contents_DAO.read(contents_no);
    return blog_Contents_VO;
  }
  
  @Override
  public int passwd_check(HashMap<String, Object> map) {
    int cnt = this.blog_Contents_DAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int delete(int contents_no) {
    int cnt = this.blog_Contents_DAO.delete(contents_no);
    return cnt;
  }

  @Override
  public List<Blog_Contents_VO> list_by_cate(int cate_no) {
    List<Blog_Contents_VO> list_by_cate = this.blog_Contents_DAO.list_by_cate(cate_no);
    return list_by_cate;
  }

}
