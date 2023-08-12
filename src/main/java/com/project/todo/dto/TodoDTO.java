package com.project.todo.dto;

import lombok.*;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;

@ToString
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TodoDTO {


    private Long tno;
    @NotEmpty(message = "내용을 입력해주세요.")
    private String title;

    @Future(message = "선택할 수 없는 날짜 입니다. 올바른 날짜를 입력해주세요.")
    private LocalDate dueDate;
    private boolean finished;

    @NotEmpty(message = "작성자를 입력해주세요.")
    private String writer;

}
