package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TExamPublish {
    private Integer id;

    private Integer examId;

    private Date startTime;

    private Date endTime;

    private Integer clazzId;

    private Integer status;

    private Integer publishPerson;
    

}