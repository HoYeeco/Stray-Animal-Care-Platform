package com.cupk.backend.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;

@Data
@TableName("t_adoption_info")
public class AdoptionInfo {
    @TableId(value = "adoption_info_id", type = IdType.AUTO)
    private Integer adoptionInfoId;
    private String name;
    private String species;
    private String gender;
    private String healthStatus;
    private String sterilizationStatus;
    private String baseName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date discoveryTime;
    private String discoveryPlace;
    private String description;
    private String imageUrl;
    private String adoptionStatus;
    private Integer uploadRecordId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date adoptedTime;
}