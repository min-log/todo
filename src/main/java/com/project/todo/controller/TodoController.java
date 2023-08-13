package com.project.todo.controller;

import com.project.todo.dto.PageRequestDTO;
import com.project.todo.dto.PageResponseDTO;
import com.project.todo.dto.TodoDTO;
import com.project.todo.service.TodoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/todo")
public class TodoController {
    private final TodoService todoService;

    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO,
                     BindingResult bindingResult,
                     Model model,
                     HttpServletRequest request){
        log.info("todo list ----------------");
        log.info("pageRequestDTO : {}" ,pageRequestDTO);

        if(bindingResult.hasErrors()){
            pageRequestDTO = PageRequestDTO.builder().build();
        }

        PageResponseDTO<TodoDTO> list = todoService.getList(pageRequestDTO);
        log.info("list START: {}", list.getSize());
        log.info("list END: {}", list.getEnd());
        model.addAttribute("responseDTO", list);


        // 리다이렉트 전달 메시지
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if(flashMap !=null){
            log.info("전달 받은 msg");
            model.addAttribute("msg",flashMap.get("message"));
        }
    }

    @GetMapping("/register")
    public void registerGet(){
        log.info("todo  register----------------");
    }


    @PostMapping("/register")
    public String registerPost(@Valid TodoDTO todoDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes){
        log.info("todo  register save----------------");
        log.info("todoDTO : {}",todoDTO);
        if (bindingResult.hasErrors()){
            log.info("has errors : {}",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            return "redirect:/todo/register";
        }


        redirectAttributes.addFlashAttribute("message","일정 등록이 완료되었습니다.");
        todoService.register(todoDTO);
        return "redirect:/todo/list";
    }


    @GetMapping({"/read","/modify"})
    public void read(Long tno, Model model){
        log.info("read ------------------");
        TodoDTO todoDTO = todoService.getOne(tno);
        model.addAttribute("dto",todoDTO);
    }


    @GetMapping("/remove")
    public String remove(Long tno, RedirectAttributes redirectAttributes){
        log.info("remove ------------------");
        todoService.delete(tno);
        redirectAttributes.addFlashAttribute("message","삭제가 성공했습니다.");

        return "redirect:/todo/list";
    }

    @PostMapping("/modify")
    public String modify(@Valid TodoDTO todoDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes){
        log.info("modify ------------------");

        if(bindingResult.hasErrors()) {
            log.info("has errors: {}", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors() );
            redirectAttributes.addAttribute("tno", todoDTO.getTno() );
            return "redirect:/todo/modify";
        }
        log.info("todoDTO : {}",todoDTO);

        todoService.modify(todoDTO);
        redirectAttributes.addFlashAttribute("message","수정이 완료되었습니다.");
        return "redirect:/todo/list";
    }




}
