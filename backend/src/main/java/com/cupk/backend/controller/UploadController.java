package com.cupk.backend.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cupk.backend.common.Result;
import com.cupk.backend.mapper.UploadMapper;
import com.cupk.backend.pojo.Upload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/upload")
public class UploadController {
    @Autowired
    private UploadMapper uploadMapper;

    //查询全部上报记录-分页
    @GetMapping("/records")
    Result selectPages(@RequestParam(defaultValue = "")String name,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "5") Integer pageSize){
        Page<Upload> page=new Page<>(pageNum,pageSize);
        QueryWrapper<Upload> queryWrapper=new QueryWrapper<>();
        queryWrapper.like("name",name);
        uploadMapper.selectPage(page,queryWrapper);
        return Result.success(page);
    }

    //根据id查询上报记录
    @GetMapping("/records/{id}")
    Result selectById(@PathVariable Integer id){
        Upload upload=uploadMapper.selectById(id);
        if (upload!=null){
            System.out.println("成功查询上报记录。");
            return Result.success(upload);
        }else {
            System.out.println("查询上报记录失败。");
            return Result.error();
        }
    }

    //添加上报记录
    @PostMapping("/records")
    Result insertUpload(@RequestBody Upload upload){
        int i = uploadMapper.insert(upload);
        if (i>0){
            System.out.println("成功添加上报记录。");
            return Result.success();
        }else {
            System.out.println("添加上报记录失败。");
            return Result.error();
        }
    }

    //修改上报记录
    @PutMapping("/records")
    Result updateUpload(@RequestBody Upload upload){
        int i = uploadMapper.updateById(upload);
        if (i>0){
            System.out.println("成功修改上报记录。");
            return Result.success();
        }else {
            System.out.println("修改上报记录失败。");
            return Result.error();
        }
    }

    //根据id删除上报记录
    @DeleteMapping("/records/{id}")
    Result deleteById(@PathVariable Integer id){
        int i = uploadMapper.deleteById(id);
        if (i>0){
            System.out.println("成功精准删除上报记录。");
            return Result.success();
        }else {
            System.out.println("精准删除失败。");
            return Result.error();
        }
    }

    //批量删除上报记录
    @DeleteMapping("/records")
    Result deleteBatch(@RequestBody List<Integer> ids){
        int i = uploadMapper.deleteByIds(ids);
        if (i>0){
            System.out.println("成功批量删除上报记录。");
            return Result.success();
        }else {
            System.out.println("批量删除失败。");
            return Result.error();
        }
    }

}
