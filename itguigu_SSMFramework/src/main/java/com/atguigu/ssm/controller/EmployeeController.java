package com.atguigu.ssm.controller;

import com.atguigu.ssm.pojo.Employee;
import com.atguigu.ssm.service.EmployeeService;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 查询所有的员工信息-->/employee-->get
 * 查询员工的分页信息-->/employee/page/1-->get
 * 根据id查询员工信息-->/employee/1-->get
 * 跳转到添加页面-->/to/add-->get（待完善toAdd）
 * 添加员工信息-->/employee-->post(待完善addEmployee)
 * 修改员工信息-->/employee-->put（待完善updateEmployee）
 * 删除员工信息-->/employee/1-->delete（待完善deleteEmployee）
 * @author MiracloW
 * @date 2022-10-17 09:19
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/employee/page/{pageNum}", method = RequestMethod.GET)
    public String getEmployeePage(@PathVariable("pageNum") Integer pageNum, Model model){
        //获取员工的分页信息
        PageInfo<Employee> page = employeeService.getEmployeePage(pageNum);
        //将分页数据共享到请求域中
        model.addAttribute("page", page);
        //跳转到employee_list.html
        return "employee_list";
    }

    @RequestMapping(value = "/employee", method = RequestMethod.GET)
    public String getAllEmployee(Model model){
        //查询所有的员工信息
        List<Employee> list = employeeService.getAllEmployee();
        //将员工信息在请求域中共享
        model.addAttribute("list", list);
        //跳转到employee_list.html
        return "employee_list";
    }

    @RequestMapping(value = "/employee", method = RequestMethod.POST)
    public String addEmployee(Employee employee){
        //保存员工信息
        //employeeDao.save(employee);
        //重定向到列表功能：/employee/page/1
        return "redirect:/employee/page/1";
    }

    //根据id查询员工信息-->/employee/1-->get
    @RequestMapping(value = "/employee/{id}", method = RequestMethod.GET)
    public String toUpdate(@PathVariable("id") Integer id, Model model){
        //根据id查询员工信息
        Employee employee = employeeService.get(id);
        //将员工信息共享到请求域中
        model.addAttribute("employee", employee);
        //跳转到employee_update.html
        return "employee_update";
    }

    @RequestMapping(value = "/to/add",method = RequestMethod.GET)
    public String toAdd(){
        return "employee_add";
    }

    @RequestMapping(value = "/employee", method = RequestMethod.PUT)
    public String updateEmployee(Employee employee){
        //修改员工信息
        //employeeDao.save(employee);
        //重定向到列表功能：/employee/page/1
        return "redirect:/employee/page/1";
    }

    @DeleteMapping(value = "/employee/{id}")
    public String deleteEmployee(@PathVariable("id") Integer id){
        //删除员工信息
        //employeeDao.delete(id);
        //重定向到列表功能：/employee/page/1
        return "redirect:/employee/page/1";
    }

}
