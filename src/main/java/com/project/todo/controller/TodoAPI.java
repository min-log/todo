package com.project.todo.controller;

import com.project.todo.dto.TodoDTO;
import com.project.todo.service.TodoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Log4j2
@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class TodoAPI {
    private final TodoService todoService;

    @GetMapping("/finished")
    public ResponseEntity<Boolean> modifyFinish(@Param("tno") Long tno){

        log.info("tno : {}",tno);
        return new ResponseEntity<>(true,HttpStatus.OK);
    }
}
