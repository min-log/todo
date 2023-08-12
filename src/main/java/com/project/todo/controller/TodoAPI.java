package com.project.todo.controller;

import com.project.todo.dto.TodoDTO;
import com.project.todo.service.TodoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Log4j2
@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class TodoAPI {
    private final TodoService todoService;

    @PostMapping("/finished")
    public ResponseEntity<Boolean> modifyFinish(@RequestBody TodoDTO todoDTO){

        log.info("tno : {}",todoDTO);
        log.info("tno : {}",todoDTO.getTno());

//        boolean result = todoService.modifyFinish(tno);
//        log.info("전달할 값 : {}",result);
        return new ResponseEntity<>(true, HttpStatus.OK);
    }
}
