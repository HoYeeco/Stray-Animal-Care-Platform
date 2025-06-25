<h1>Stray Animal Care Platform</h1>
<h2>流浪动物关爱平台</h2>
<h3>技术栈</h3>
<ol>
  <li>前后端分离：Spring Boot3 + MyBaits Plus + Vue3</li>
  <li>接口：Restful API</li>
  <li>数据库：MySQL</li>
</ol>
<h3>其他要求</h3>
<ol>
  <li>网页数≥10</li>
  <li>CRUD功能模块数≥3</li>
  <li>数据表&单表字段≥5</li>
</ol>

```
package com.cupk.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cupk.common.Result;
import com.cupk.mapper.BookMapper;
import com.cupk.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookMapper bookMapper;

    //查询全部数据
//    @GetMapping("/books")
//    Result selectAll(){
//        List<Book> booklist=bookMapper.selectList(null);
//        for (Book book:booklist){
//            System.out.println(book);
//        }
//        return Result.success(booklist);
//    }

    //根据id查询信息
    @GetMapping("/books/{id}")
    Result selectById(@PathVariable Integer id){
        Book book=bookMapper.selectById(id);
        if (book!=null){
            System.out.println("data searched successfully");
            return Result.success(book);
        }else {
            System.out.println("data not found");
            return Result.error();
        }
    }

    //添加数据
    @PostMapping("/books")
    Result insertBook(@RequestBody Book book){
        int i = bookMapper.insert(book);
        if (i>0){
            System.out.println("insert successfully");
            return Result.success();
        }else {
            System.out.println("insert failed");
            return Result.error();
        }
    }

    //修改数据
    @PutMapping("/books")
    Result updateBook(@RequestBody Book book){
        int i = bookMapper.updateById(book);
        if (i>0){
            System.out.println("update successfully");
            return Result.success();
        }else {
            System.out.println("update failed");
            return Result.error();
        }
    }

    //根据id删除数据
    @DeleteMapping("/books/{id}")
    Result deleteById(@PathVariable Integer id){
        int i = bookMapper.deleteById(id);
        if (i>0){
            System.out.println("The data was deleted successfully");
            return Result.success();
        }else {
            System.out.println(" The data was not found");
            return Result.error();
        }
//        System.out.println(book);
    }

    //批量删除数据
    @DeleteMapping("/books")
    Result deleteBatch(@RequestBody List<Integer> ids){
        int i = bookMapper.deleteByIds(ids);
        if (i>0){
            System.out.println("The data was deleted successfully");
            return Result.success();
        }else {
            System.out.println(" The data was not found");
            return Result.error();
        }
//        System.out.println(book);
    }

    //查询全部数据-分页
    @GetMapping("/books")
    Result selectPages(@RequestParam(defaultValue = "")String name,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "5") Integer pageSize){
        Page<Book> page=new Page<>(pageNum,pageSize);
//        bookMapper.selectPage(page, );
        //用来封装查询条件的
        QueryWrapper<Book> queryWrapper=new QueryWrapper<>();

        queryWrapper.like("name",name);
        bookMapper.selectPage(page,queryWrapper);

//        List<Book> booklist=page.getRecords();//这里取得page里面相关的数据

//        System.out.println("当前的页数：" + page.getCurrent());
//        System.out.println("总记录数："+page.getTotal());
//        System.out.println("总页数:"+page.getPages());
//        System.out.println("是否有下一页："+page.hasNext());

        return Result.success(page);
    }


}
```
然后corsConfig
```
package com.cupk.config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
@Configuration
public class CorsConfig {
    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.addAllowedHeader("*");
        corsConfiguration.addAllowedMethod("*");
        corsConfiguration.addAllowedOrigin("*");
        //如果仍然提示跨域错误改为false
        corsConfiguration.setAllowCredentials(false);
        source.registerCorsConfiguration("/**", corsConfiguration);
        return new CorsFilter(source);
    }
}
```
