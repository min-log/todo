package com.project.todo.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {

    @Builder.Default
    @Min(value = 1)
    @Positive
    private int page=1;

    @Builder.Default
    @Min(value = 10)
    @Max(value = 100)
    @Positive
    private int size = 10;

    private String link;


    //검색 필요 변수
    private String[] types; //검색 유형
    private String keyword; // 키워드
    private boolean finished; // 완료 여부
    private LocalDate from; // 시작일
    private LocalDate to; // 종료일


    public int getSkip(){
        return ( page - 1) * 10;
    }

    //조회 페이지에서 다시 기존 목록 페이지로 이동
    public String getLink() {
        StringBuilder builder = new StringBuilder();

        builder.append("page=" + this.page);

        builder.append("&size=" + this.size);
        
        //검색 관련
        if(finished){
            builder.append("&finished=on");
        }

        if(types != null && types.length > 0){
            for (int i = 0; i < types.length ; i++) {
                builder.append("&types=" + types[i]);
            }
        }

        if(keyword != null){
            try {
                builder.append("&keyword=" + URLEncoder.encode(keyword,"UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        if(from != null){
            builder.append("&from=" + from.toString());
        }

        if(to != null){
            builder.append("&to=" + to.toString());
        }

        return builder.toString();
    }
}
