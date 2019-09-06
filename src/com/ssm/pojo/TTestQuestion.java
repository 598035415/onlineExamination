package com.ssm.pojo;

import lombok.Data;

@Data
public class TTestQuestion {
    private Integer id;

    private Integer testRecordId;

    private Integer questionId;

    private Integer myAnswer;
}