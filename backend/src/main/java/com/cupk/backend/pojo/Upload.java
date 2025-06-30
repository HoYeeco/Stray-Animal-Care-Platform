package com.cupk.backend.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;

@Data
@TableName("t_upload_records")
public class Upload {
    @TableId(value = "upload_record_id", type = IdType.AUTO) 
    Integer uploadRecordId;
    String reporter;
    String reporterPhone;
    String name;
    String species;
    String gender;
    String healthStatus;
    String sterilizationStatus;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date discoveryTime;
    String discoveryPlace;
    String description;
    String imageUrl;
}
