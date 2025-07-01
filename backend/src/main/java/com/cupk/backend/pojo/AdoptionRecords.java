package com.cupk.backend.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;

@Data
@TableName("t_adoption_records")
public class AdoptionRecords {
    @TableId(value = "adoption_record_id", type = IdType.AUTO)
     Integer adoptionRecordId;
     Integer adoptionInfoId;
     String petName;
     String adopterName;
     String adopterGender;
     Integer age;
     String idCard;
     String address;
     String contactPhone;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
     Date adoptionTime;
}
