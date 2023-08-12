package com.project.todo.mapper;

import com.project.todo.domain.TodoVO;
import com.project.todo.dto.TodoDTO;

import java.util.List;

public interface TodoMapper {
    String getTime();
    void insert(TodoVO todoVO);
    List<TodoVO> selectAll();
    TodoVO selectOne(Long tno);

    void delete(Long tno);

    void update(TodoVO todoVO);

    void updateFinished(TodoVO todoVO);
}
