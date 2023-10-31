package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.FileInfo;
import kr.ed.haebeop.domain.Fileboard;
import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.service.FileInfoService;
import kr.ed.haebeop.service.FileboardService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/fileboard/")
public class FileboardController {
    @Autowired
    HttpSession session;

    @Autowired
    private FileboardService fileboardService;
    @Autowired
    private FileInfoService fileInfoService;


    @GetMapping("list")        //board/list.do
    public String boardList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        Page page = new Page();
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET
        // 페이징에 필요한 데이터 저장
        int total = fileboardService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        List<Fileboard> fileList = fileboardService.fileList(page);
        model.addAttribute("fileList", fileList);          // 공지사항 목록
        model.addAttribute("curPage", curPage);             // 현재 페이지
        model.addAttribute("page", page);                   // 페이징 데이터
        return "/fileboard/fileboardList";
    }

    @GetMapping("detail")    //board/detail.do?seq=1
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        int articleno = Integer.parseInt(request.getParameter("articleno"));
        Fileboard fileboard = fileboardService.fileDetail(articleno); //해당 자료실 객체 값 생성
        List<FileInfo> fileboard2 = fileInfoService.fileInfoDetail(articleno); //해당 자료실에 첨부된 파일 객체 값 생성
        model.addAttribute("fileboard", fileboard);
        model.addAttribute("fileboard2", fileboard2);
        return "/fileboard/fileboardDetail";
    }

    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String write() {
        return "/fileboard/fileboardInsert";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String write(Fileboard fileboardDto, @RequestParam("upfile") MultipartFile[] files, Model model, HttpServletRequest req) throws IllegalStateException, IOException {
        Page page = new Page();
        String id = (String) session.getAttribute("sid");
        if (id != null && id.equals("admin")) { //관리자만 등록가능fileboardIsert
            //String realPath = req.getRealPath("/pro3_war/resources/upload");
            String realPath = req.getSession().getServletContext().getRealPath("/resources/upload/fileboard"); // 경로설정
            System.out.println("path : " + realPath);
            String today = new SimpleDateFormat("yyMMdd").format(new Date()); //오늘 날짜
            String saveFolder = realPath + today; // 저장되는 폴더 경로
            System.out.println(saveFolder);
            File folder = new File(saveFolder);
            if (!folder.exists()) // 폴더가 존재하지 않으면 생성함
                folder.mkdirs();
            List<FileInfo> fileInfos = new ArrayList<>(); //첨부파일 정보를 리스트로 생성
            for (MultipartFile mfile : files) {
                FileInfo fileInfoDto = new FileInfo();
                String originalFileName = mfile.getOriginalFilename(); //첨부파일의 실제 파일명을 저장
                if (!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf('.')); // 랜덤으로 파일이름 설정
                    fileInfoDto.setSaveFolder(today); // 파일인포 객체에 값저장
                    fileInfoDto.setOriginFile(originalFileName); // 파일인포 객체에 값저장
                    fileInfoDto.setSaveFile(saveFileName); // 파일인포 객체에 값저장
                    System.out.println(mfile.getOriginalFilename() + "   " + saveFileName);
                    mfile.transferTo(new File(folder, saveFileName)); // 파일을 업로드 폴더에 저장
                }
                fileInfos.add(fileInfoDto);
            }
            fileboardDto.setFileInfos(fileInfos);
            fileboardDto.setId(id);
            try {
                fileboardService.writeArticle(fileboardDto);
                List<Fileboard> fileboardList = fileboardService.fileList(page);
                model.addAttribute("fileboardList", fileboardList);
                return "redirect:list";
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("msg", "글 작성중 문제가 발생했습니다.");
                return "/error/error";
            }
        } else {
            model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
            return "/error/error";
        }
    }

    @GetMapping("delete")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception {
        int articleno = Integer.parseInt(request.getParameter("articleno"));

        // 파일 삭제 처리
        List<FileInfo> fileList = fileInfoService.fileInfoList(articleno);
        ServletContext application = request.getSession().getServletContext();
        for (FileInfo fileInfo : fileList) {
            File oldFile = new File(application.getRealPath("/") + "/resources/upload/" + fileInfo.getSaveFolder() + "/" + fileInfo.getSaveFile());
            if (oldFile.exists()) {
                oldFile.delete();
            }
        }

        fileboardService.fileboardDelete(articleno);
        return "redirect:list";
    }

    @GetMapping("edit")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int articleno = Integer.parseInt(request.getParameter("articleno"));
        Fileboard dto = fileboardService.fileDetail(articleno);
        dto.setFileInfos(fileInfoService.fileInfoList(articleno));
        model.addAttribute("dto", dto);
        return "/fileboard/fileboardEdit";
    }

    @PostMapping("edit")
    public String write2(Fileboard fileboardDto, @RequestParam("upfile") MultipartFile[] files, Model model, HttpServletRequest req) throws Exception {
        String id = (String) session.getAttribute("sid");
        Page page = new Page();
        if (id != null && id.equals("admin")) { //관리자만 등록가능
            //String realPath = req.getRealPath("/pro3_war/resources/upload");
            String realPath = req.getSession().getServletContext().getRealPath("/resources/upload/fileboard"); // 경로설정
            System.out.println("path : " + realPath);
            String today = new SimpleDateFormat("yyMMdd").format(new Date()); //오늘 날짜
            String saveFolder = realPath + today; // 저장되는 폴더 경로
            System.out.println(saveFolder);

            File folder = new File(saveFolder);
            if (!folder.exists()) // 폴더가 존재하지 않으면 생성함
                folder.mkdirs();

            // 파일이 새롭게 업로드되지 않았다면 삭제하지 않도록 처리
            if(files[0].getSize() != 0) {
                List<FileInfo> fileList = fileInfoService.fileInfoList(fileboardDto.getArticleno());
                ServletContext application = req.getSession().getServletContext();
                for (FileInfo fileInfo : fileList) {
                    File oldFile = new File(application.getRealPath("/") + "/resources/upload/" + fileInfo.getSaveFolder() + "/" + fileInfo.getSaveFile());
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }
            }

            List<FileInfo> fileInfos = new ArrayList<FileInfo>(); //첨부파일 정보를 리스트로 생성
            for (MultipartFile mfile : files) {
                FileInfo fileInfoDto = new FileInfo();
                String originalFileName = mfile.getOriginalFilename(); //첨부파일의 실제 파일명을 저장
                if (!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf('.')); // 랜덤으로 파일이름 설정
                    fileInfoDto.setSaveFolder(today); // 파일인포 객체에 값저장
                    fileInfoDto.setOriginFile(originalFileName); // 파일인포 객체에 값저장
                    fileInfoDto.setSaveFile(saveFileName); // 파일인포 객체에 값저장
                    System.out.println(mfile.getOriginalFilename() + "   " + saveFileName);
                    mfile.transferTo(new File(folder, saveFileName)); // 파일을 업로드 폴더에 저장
                }
                fileInfos.add(fileInfoDto);
            }

            fileboardDto.setFileInfos(fileInfos);
            fileboardDto.setId(id);

            try {
                fileboardService.fileboardEdit(fileboardDto);
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("msg", "글 작성중 문제가 발생했습니다.");
//                return "/error/error";
            }
        } else {
            model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
//            return "/error/error";
        }
        return "redirect:/fileboard/list";
    }
}