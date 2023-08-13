package com.project.todo.service;

import com.project.todo.domain.TodoVO;
import com.project.todo.dto.PageRequestDTO;
import com.project.todo.dto.PageResponseDTO;
import com.project.todo.dto.TodoDTO;

import java.util.List;

public interface TodoService {
    void register(TodoDTO todoDTO);
    List<TodoDTO> getAll();

    PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO);

    TodoDTO getOne(Long tno);
    void delete(Long tno);

    void modify(TodoDTO todoDTO);

    boolean modifyFinish(Long tno);

}
