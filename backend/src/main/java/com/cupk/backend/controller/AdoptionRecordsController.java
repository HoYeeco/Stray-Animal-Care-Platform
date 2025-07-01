package com.cupk.backend.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cupk.backend.common.Result;
import com.cupk.backend.mapper.AdoptionRecordsMapper;
import com.cupk.backend.pojo.AdoptionRecords;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/adoption")
public class AdoptionRecordsController {
    @Autowired
    private AdoptionRecordsMapper adoptionRecordsMapper;

    //查询全部领养记录-分页
    @GetMapping("/records")
    Result selectPages(@RequestParam(defaultValue = "")String petName,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "5") Integer pageSize){
        Page<AdoptionRecords> page=new Page<>(pageNum,pageSize);
        QueryWrapper<AdoptionRecords> queryWrapper=new QueryWrapper<>();
        queryWrapper.like("pet_name",petName);
        adoptionRecordsMapper.selectPage(page,queryWrapper);
        return Result.success(page);
    }

    //根据id查询领养记录
    @GetMapping("/records/{id}")
    Result selectById(@PathVariable Integer id){
        AdoptionRecords adoptionRecords=adoptionRecordsMapper.selectById(id);
        if (adoptionRecords!=null){
            System.out.println("成功查询领养记录。");
            return Result.success(adoptionRecords);
        }else {
            System.out.println("查询领养记录失败。");
            return Result.error();
        }
    }

    //添加领养记录
    @PostMapping("/records")
    Result insertAdoptionRecords(@RequestBody AdoptionRecords adoptionRecords){
        int i = adoptionRecordsMapper.insert(adoptionRecords);
        if (i>0){
            System.out.println("成功添加领养记录。");
            return Result.success();
        }else {
            System.out.println("添加领养记录失败。");
            return Result.error();
        }
    }

    //修改领养记录
    @PutMapping("/records")
    Result updateAdoptionRecords(@RequestBody AdoptionRecords adoptionRecords){
        int i = adoptionRecordsMapper.updateById(adoptionRecords);
        if (i>0){
            System.out.println("成功修改领养记录。");
            return Result.success();
        }else {
            System.out.println("修改领养记录失败。");
            return Result.error();
        }
    }

    //根据id删除领养记录
    @DeleteMapping("/records/{id}")
    Result deleteById(@PathVariable Integer id){
        int i = adoptionRecordsMapper.deleteById(id);
        if (i>0){
            System.out.println("成功精准删除领养记录。");
            return Result.success();
        }else {
            System.out.println("精准删除失败。");
            return Result.error();
        }
    }

    //批量删除领养记录
    @DeleteMapping("/records")
    Result deleteBatch(@RequestBody List<Integer> ids){
        int i = adoptionRecordsMapper.deleteByIds(ids);
        if (i>0){
            System.out.println("成功批量删除领养记录。");
            return Result.success();
        }else {
            System.out.println("批量删除失败。");
            return Result.error();
        }
    }

}
