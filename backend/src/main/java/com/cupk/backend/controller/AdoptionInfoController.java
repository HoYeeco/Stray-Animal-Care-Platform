package com.cupk.backend.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cupk.backend.common.Result;
import com.cupk.backend.mapper.AdoptionInfoMapper;
import com.cupk.backend.pojo.AdoptionInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/adoption")
public class AdoptionInfoController {
    @Autowired
    private AdoptionInfoMapper adoptionInfoMapper;

    //查询全部领养信息-分页
    @GetMapping("/info")
    Result selectPages(@RequestParam(defaultValue = "")String name,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "5") Integer pageSize){
        Page<AdoptionInfo> page=new Page<>(pageNum,pageSize);
        QueryWrapper<AdoptionInfo> queryWrapper=new QueryWrapper<>();
        queryWrapper.like("name",name);
        adoptionInfoMapper.selectPage(page,queryWrapper);
        return Result.success(page);
    }

    //根据id查询领养信息
    @GetMapping("/info/{id}")
    Result selectById(@PathVariable Integer id){
        AdoptionInfo adoptionInfo=adoptionInfoMapper.selectById(id);
        if (adoptionInfo!=null){
            System.out.println("成功查询领养信息。");
            return Result.success(adoptionInfo);
        }else {
            System.out.println("查询领养信息失败。");
            return Result.error();
        }
    }

    //添加领养信息
    @PostMapping("/info")
    Result insertAdoptionInfo(@RequestBody AdoptionInfo adoptionInfo){
        int i = adoptionInfoMapper.insert(adoptionInfo);
        if (i>0){
            System.out.println("成功添加领养信息。");
            return Result.success();
        }else {
            System.out.println("添加领养信息失败。");
            return Result.error();
        }
    }

    //修改领养信息
    @PutMapping("/info")
    Result updateAdoptionInfo(@RequestBody AdoptionInfo adoptionInfo){
        int i = adoptionInfoMapper.updateById(adoptionInfo);
        if (i>0){
            System.out.println("成功修改领养信息。");
            return Result.success();
        }else {
            System.out.println("修改领养信息失败。");
            return Result.error();
        }
    }

    //根据id删除领养信息
    @DeleteMapping("/info/{id}")
    Result deleteById(@PathVariable Integer id){
        int i = adoptionInfoMapper.deleteById(id);
        if (i>0){
            System.out.println("成功精准删除领养信息。");
            return Result.success();
        }else {
            System.out.println("精准删除失败。");
            return Result.error();
        }
    }

    //批量删除领养信息
    @DeleteMapping("/info")
    Result deleteBatch(@RequestBody List<Integer> ids){
        int i = adoptionInfoMapper.deleteByIds(ids);
        if (i>0){
            System.out.println("成功批量删除领养信息。");
            return Result.success();
        }else {
            System.out.println("批量删除失败。");
            return Result.error();
        }
    }

}
