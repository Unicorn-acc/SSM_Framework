package com.atguigu.ssm.mapper;

import com.atguigu.ssm.pojo.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author MiracloW
 * @date 2022-10-17 10:47
 */
public interface EmployeeMapper {
    /**
     * 查询所有的员工信息
     * @return
     */
    List<Employee> getAllEmployee();

    Employee getEmployeeById(@Param("id") Integer id);
}
