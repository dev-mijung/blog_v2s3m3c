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

import dev.mvc.blog_cate.Blog_Cate_ProcInter;
import dev.mvc.blog_contents.Blog_Contents_ProcInter;
import dev.mvc.blog_contents.Blog_Contents_VO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class Blog_Attachfile_Cont {
@Autowired
@Qualifier("dev.mvc.blog_contents.Blog_Contents_Proc")
   private Blog_Contents_ProcInter Blog_Contents_Proc;
  
@Autowired
@Qualifier("dev.mvc.blog_cate.Blog_Cate_Proc")
  private Blog_Cate_ProcInter blog_Cate_Proc;

@Autowired
@Qualifier("dev.mvc.blog_attachfile.Blog_Attachfile_Proc")
  private Blog_Attachfile_ProcInter blog_Attachfile_Proc;

  public Blog_Attachfile_Cont() {
    System.out.println("--> Blog_Attachfile_Cont created.");
  }
  
  /**
   * 첨부파일 등록 폼
   * @return
   */
  @RequestMapping(value="/blog_attachfile/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/blog_attachfile/create");
    return mav;
  }
  
  /**
   * 첨부파일 등록 처리
   * @param request
   * @param blog_Attachfile_VO
   * @return
   */
  @RequestMapping(value="/blog_attachfile/create.do", method=RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, Blog_Attachfile_VO blog_Attachfile_VO, int cate_no) {
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int contents_no = blog_Attachfile_VO.getContents_no(); // 부모 글 번호
    String fname = ""; // 원본 파일 명
    String fupname = ""; // 업로드 된 파일 명
    long fsize = 0; // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count =0; // 정상 처리 된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/blog_attachfile/storage"); // 절대 경로 가져 옴
    // 전송 파일이 없어도 fnamesMF 객체가 생성 됨
    List<MultipartFile> fnamesMF = blog_Attachfile_VO.getFnamesMF();
    int count = fnamesMF.size(); // 전송 파일 갯수
    if(count > 0 ) { // 전송 할 파일 있는 경우
      for(MultipartFile multipartFile:fnamesMF) {
        fsize = multipartFile.getSize();
        if(fsize > 0) { // 파일 크기 체크
          fname = multipartFile.getOriginalFilename(); 
          fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장
          if(Tool.isImage(fname)) {
            thumb = Tool.preview(upDir, fupname, 120, 80); // upDir에 저장, thumb 이미지 생성 후 파일명 리턴,(width:120, height:80)
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
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    mav.addObject("upload_count", upload_count);
    mav.addObject("contents_no", contents_no);
    mav.addObject("cate_no", cate_no);

    mav.setViewName("redirect:/blog_attachfile/create_msg.jsp");
    return mav;
  }
  
  /**
   * 첨부파일 목록
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
  
//  /**
//   * 첨부파일 조회
//   * @param attachfile_no
//   * @return
//   */
//  @RequestMapping(value="/blog_attachfile/read.do", method=RequestMethod.GET)
//    public ModelAndView read(int attachfile_no) {
//    ModelAndView mav = new ModelAndView();
//    
//    Blog_Attachfile_VO blog_Attachfile_VO = this.blog_Attachfile_Proc.read(attachfile_no);
//    mav.addObject("blog_Attachfile_VO", blog_Attachfile_VO);
//    
//    mav.setViewName("/blog_attachfile/read");
//    
//    return mav;
//  }
  
  /**
   * 첨부파일 1건 삭제 처리
   * @param attachfile_no
   * @return
   */
  @RequestMapping(value="/blog_attachfile/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request, int attachfile_no) {
    ModelAndView mav = new ModelAndView();
    
    // 삭제 할 파일정보 읽어 오기 
    Blog_Attachfile_VO blog_Attachfile_VO = this.blog_Attachfile_Proc.read(attachfile_no);
    
    String upDir = Tool.getRealPath(request, "/blog_attachfile/storage");
    Tool.deleteFile(upDir, blog_Attachfile_VO.getFupname()); // folder에서 1건의 파일 삭제
    Tool.deleteFile(upDir, blog_Attachfile_VO.getThumb()); // 1건의 Thumb파일 삭제
    
    this.blog_Attachfile_Proc.delete(attachfile_no);; // DBMS에서 1건의 파일 삭제
    
    mav.setViewName("redirect:/blog_attachfile/list.do");
    
    return mav;
  }
}
