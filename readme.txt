1、在可访问的mysql服务上执行service模块resource目录下的create.sql。
2、修改service模块resource目录下的application.yml文件(根据实际情况修改)：
    1）数据库url信息中服务器ip和端口号
    2）数据库用户名和密码
    3）邮箱相关的配置信息，主要有host，username，password 和 port
3、需要启动一个能访问到的zookeeper服务
4、修改service和web模块resource目录下的spring-dubbo.xml文件中的zookeeper地址信息。
5、编译项目，编译成功后执行下面的操作
6、运行service模块下的ProviderApplication
7、运行web模块下的ConsumerApplication

以上几步都执行成功后
8、打开浏览器输入 http://localhost:8080/user/ （如果不是本地部署，根据实际情况修改ip和端口，端口号在web模块的application.yml文件中可修改）
9、在页面中可操作用户的查询，新增，编辑和删除。

附注：使用了 springboot+dubbo 搭建了微服务框架

