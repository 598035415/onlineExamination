package com.ssm.pojo;

import java.util.Date;
import java.util.List;

import com.ssm.vo.YExamQuestionTrueSelectVO;

import lombok.Data;

@Data
public class TStudentExamAnswer {
    private Integer id;

    private Integer examPulishId;

    private Integer studentId;

    private Integer questionId;

    private String myAnswer;

    private Integer status;

    private Date createTime;

    private Date updateTime;
    
    // 用户下的一组答案
    private List<YExamQuestionTrueSelectVO> answerList;
    
    

}