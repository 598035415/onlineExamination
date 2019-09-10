package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TExamPublish {
    private Integer id;

    private Integer examId;

    private Date startTime;
    
    private String startTimes;
    
    private Integer currentType;

    private Date endTime;

    private String endTimes;
    
    private Integer clazzId;

    private Integer status;

    private Integer publishPerson;
    

}