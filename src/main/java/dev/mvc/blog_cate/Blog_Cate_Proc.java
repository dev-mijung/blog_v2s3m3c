package dev.mvc.blog_cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.blog_cate.Blog_Cate_Proc")
public class Blog_Cate_Proc implements Blog_Cate_ProcInter {
@Autowired
private Blog_Cate_DAOInter blog_Cate_DAO;

  @Override
  public int create(Blog_Cate_VO blog_Cate_VO) {
    int cnt = this.blog_Cate_DAO.create(blog_Cate_VO);
    return cnt;
  }

  @Override
  public List<Blog_Cate_VO> list_seqno_asc() {
    List<Blog_Cate_VO> list = this.blog_Cate_DAO.list_seqno_asc();
    return list;
  }

  @Override
  public Blog_Cate_VO read(int cate_no) {
    Blog_Cate_VO blog_Cate_VO = this.blog_Cate_DAO.read(cate_no);
    return blog_Cate_VO;
  }

  @Override
  public int update(Blog_Cate_VO blog_Cate_VO) {
    int cnt = this.blog_Cate_DAO.update(blog_Cate_VO);
    return cnt;
  }

  @Override
  public int delete(int cate_no) {
    int cnt = this.blog_Cate_DAO.delete(cate_no);
    return cnt;
  }

  @Override
  public int update_seqno_up(int cate_no) {
    int cnt = this.blog_Cate_DAO.update_seqno_up(cate_no);
    return cnt;
  }

  @Override
  public int update_seqno_down(int cate_no) {
    int cnt = this.blog_Cate_DAO.update_seqno_down(cate_no);
    return cnt;
  }

  @Override
  public int update_visible(Blog_Cate_VO blog_Cate_VO) {
    int cnt = 0;
    
    if(blog_Cate_VO.getCate_visible().toUpperCase().equals("Y")) {
      blog_Cate_VO.setCate_visible("N");
    } else {
      blog_Cate_VO.setCate_visible("Y");
    }
    
    cnt = this.blog_Cate_DAO.update_visible(blog_Cate_VO);
    return cnt;
  }
  
}
