# SSM_Framework

SSM：https://www.bilibili.com/video/BV1Ya411S7aT

## 整合SSM

1.pom.xml中导入spring,springmvc,mybatis的相关依赖
2.在Project Structure中的项目web下，添加web.xml配置文件,添加Filter，Servlet,listener

```
web.xml需要配置两个过滤器，Serlet前端控制器，监听器，上下文参数
```

下面进行整合：

### 一、整合Spring和SpringMVC

3.添加springmvc.xml配置springmvc的配置文件

```
创建Controller
```

3.1 需要什么就配置什么:

​	①注解配置要扫描包中的组件context:component-scan（只扫控制层）
​	②配置视图解析器
​	③配置访问首页的视图控制 同时要开启MVC的注解驱动，配置默认的servlet处理静态资源
​	配置tomcat进行测试，Deployment部署并重命名路径热部署等：
​	发生错误

​	①：An error happened during template parsing (template: "class path resource [templates/index.html]")
原因是WEB-INF/templates，我们没有配置web作为一个web根目录，表现就是没那个蓝点，在module.web下面添加

​	②：Tomcat配置deployment时Application context /ssm要与Serverurl一致localhost:8080/ssm/，这样才能正确访问



4.添加spring.xml配置文件

```
创建Service
```

​	扫描组件，除了控制层， 因为：只有控制层组件交给Springmvc来管理，其他的要交给spring来管理

​	4.1在spring.xml中添加扫描组件，同时排除控制层组件

​	4.2配置Druid数据源

​	配置数据源时引入jdbc.properties的配置文件，方便更改

### 二、整合MyBatis进入项目

5.1添加mybatis-config.xml模板,包括环境,映射文件等

```
创建Mapper和对应名字相同xml：com/atguigu/ssm/mapper
```

5.2创建mapper,注意在resources下要与java包下名字一致

5.3**在Spring.xml中配置SqlSessionFactoryBean**

​	5.3.1配置进ioc容器后,可以直接获取工厂bean提供的对象SqlSessionFactory.可以省略获取工厂这个步骤

​	5.3.2同时也可以添加相关标签,比如说配置Mybatis的核心配置文件路径,配置数据源,设置类型别名所对应的包,设置设置映射文件的路径 等

- **如果在这里配置了,可以在Mybatis的核心配置文件中省去相应的配置**

  ​5.4配置扫描mapper的接口配置MapperScannerConfigurer

  ​可以把指定的包下面所有mapper接口,通过SqlSessionFactory提供的SqlSession对象,来创建这些mapper接口的代理实现类对象,将这些对象交给ioc来管理

  ​此时在Service实现类中直接装配mapper接口对象就可以了,不需要自动装配SqlSessionFactory对象了,

### 三、事务和日志

1.配置事务管理器，

2.开启事务驱动

​	为什么要开启？aop思想，将使用注解@Transactional表示的方法或类中所有的方法进行事务管理



### 四、进行测试

员工列表功能和展示分页功能

---



## 分页插件

分页相关数据

```
PageInfo{

pageNum=8, pageSize=4, size=2, startRow=29, endRow=30, total=30, pages=8,

list=Page{count=true, pageNum=8, pageSize=4, startRow=28, endRow=32, total=30,pages=8, reasonable=false, pageSizeZero=false},

prePage=7, nextPage=0, isFirstPage=false, isLastPage=true, hasPreviousPage=true,
hasNextPage=false, navigatePages=5, navigateFirstPage4, navigateLastPage8,

navigatepageNums=[4, 5, 6, 7, 8]
}

```

pageNum：当前页的页码
pageSize：每页显示的条数
size：当前页显示的真实条数
total：总记录数
pages：总页数
prePage：上一页的页码
nextPage：下一页的页码
isFirstPage/isLastPage：是否为第一页/最后一页
hasPreviousPage/hasNextPage：是否存在上一页/下一页
navigatePages：导航分页的页码数
navigatepageNums：导航分页的页码，[1,2,3,4,5]