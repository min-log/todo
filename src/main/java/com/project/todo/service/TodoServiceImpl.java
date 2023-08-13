package com.project.todo.service;

import com.project.todo.domain.TodoVO;
import com.project.todo.dto.PageRequestDTO;
import com.project.todo.dto.PageResponseDTO;
import com.project.todo.dto.TodoDTO;
import com.project.todo.mapper.TodoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {
    private final TodoMapper todoMapper;
    private final ModelMapper modelMapper;

    @Override
    public void register(TodoDTO todoDTO) {
        log.info("저장 로직 ------------------");
        TodoVO vo = modelMapper.map(todoDTO, TodoVO.class);
        todoMapper.insert(vo);
    }

    @Override
    public List<TodoDTO> getAll() {
        List<TodoVO> todoVOList = todoMapper.selectAll();
        List<TodoDTO> todoDTOList = todoVOList.stream().map(i -> modelMapper.map(i, TodoDTO.class)).collect(Collectors.toList());
        return todoDTOList;
    }

    @Override
    public PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO) {
        List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);
        List<TodoDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, TodoDTO.class))
                .collect(Collectors.toList());

        int total = todoMapper.getCount(pageRequestDTO);

        PageResponseDTO<TodoDTO> pageResponseDTO = PageResponseDTO.<TodoDTO>withAll()
                .dtoList(dtoList)
                .total(total)
                .pageRequestDTO(pageRequestDTO)
                .build();

        return pageResponseDTO;
    }


    @Override
    public TodoDTO getOne(Long tno) {
        TodoVO todoVO = todoMapper.selectOne(tno);
        TodoDTO todoDTO = modelMapper.map(todoVO, TodoDTO.class);
        return todoDTO;
    }

    @Override
    public void delete(Long tno) {
        todoMapper.delete(tno);
    }

    @Override
    public void modify(TodoDTO todoDTO) {
        TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
        todoMapper.update(todoVO);
    }

    @Override
    public boolean modifyFinish(Long tno) {
        TodoVO vo = todoMapper.selectOne(tno);
        TodoDTO dto = modelMapper.map(vo, TodoDTO.class);
        boolean finished = vo.isFinished();
        if (finished == true){
            dto.setFinished(false);
        }else {
            dto.setFinished(true);
        }

        todoMapper.updateFinished(modelMapper.map(dto, TodoVO.class));
        boolean result = dto.isFinished();
        return result;
    }
}
