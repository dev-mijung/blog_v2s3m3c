package dev.mvc.blog_attachfile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class Blog_Attachfile_Cont {
@Autowired
@Qualifier("dev.mvc.blog_attachfile.Blog_Attachfile_Proc")
  private Blog_Attachfile_ProcInter blog_Attachfile_Proc;

  public Blog_Attachfile_Cont() {
    System.out.println("--> Blog_Attachfile_Cont created.");
  }
  
  /**
   * ÷������ ��� ��
   * @return
   */
  @RequestMapping(value="/blog_attachfile/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/blog_attachfile/create");
    return mav;
  }
  
  /**
   * ���ϵ�� ó��
   * @param request
   * @param blog_Attachfile_VO
   * @return
   */
  @RequestMapping(value="/blog_attachfile/create.do", method=RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, Blog_Attachfile_VO blog_Attachfile_VO) {
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int contents_no = blog_Attachfile_VO.getContents_no(); // �θ� �� ��ȣ
    String fname = ""; // ���� ���� ��
    String fupname = ""; // ���ε� �� ���� ��
    long fsize = 0; // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count =0; // ���� ó�� �� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/blog_attachfile/storage"); // ���� ��� ���� ��
    // ���� ������ ��� fnamesMF ��ü�� ���� ��
    List<MultipartFile> fnamesMF = blog_Attachfile_VO.getFnamesMF();
    int count = fnamesMF.size(); // ���� ���� ����
    if(count > 0 ) { // ���� �� ���� �ִ� ���
      for(MultipartFile multipartFile:fnamesMF) {
        fsize = multipartFile.getSize();
        if(fsize > 0) { // ���� ũ�� üũ
          fname = multipartFile.getOriginalFilename(); 
          fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ����
          if(Tool.isImage(fname)) {
            thumb = Tool.preview(upDir, fupname, 120, 80); // upDir�� ����, thumb �̹��� ���� �� ���ϸ� ����,(width:120, height:80)
          }
        }
          Blog_Attachfile_VO vo = new Blog_Attachfile_VO();
          vo.setContents_no(contents_no);
          vo.setFname(fname);
          vo.setFupname(fupname);
          vo.setThumb(thumb);
          vo.setFsize(fsize);
          
          upload_count = upload_count + this.blog_Attachfile_Proc.create(vo);
      }
    }
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    mav.addObject("upload_count", upload_count);
    mav.addObject("contents_no", contents_no);
    
    mav.setViewName("redirect:/blog_attachfile/create_msg.jsp");
    return mav;
  }
  
  /**
   * ���� ���
   * @return
   */
  @RequestMapping(value="/blog_attachfile/list.do", method=RequestMethod.GET)
    public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<Blog_Attachfile_VO> list = this.blog_Attachfile_Proc.list();
    mav.addObject("list",list);
    
    mav.setViewName("/blog_attachfile/list");
    
    return mav;
  }
}
