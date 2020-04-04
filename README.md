# Quick note

> Quick note，一个便携的笔记本。
>
> 开发进度：
>
> - 浏览器 				:heavy_check_mark:
> - Windows 10       :x:
> - Android 8           :x:



# 接口设计

> API接口设计并没有遵循RESTful，私以为RESTful能表示的语义有限，太多的特殊语义不好表示（我太菜了）。
>
> API接口的设计参照的是Github上Germey的项目[Gerapy](https://github.com/Gerapy/Gerapy/blob/master/gerapy/server/core/urls.py)，大致的风格是：`api/resource/operation`



关于以下API表中参数符号的解释：

- (): 圆括号。表示该项可省。
- []: 方括号。被括起来的对象应当作一个整体。
- |: 或。应该对或符号两侧的对象进行二选一。

关于以下API表中返回值符号的解释：

- {}: JSON对象。
- []: JSON数组。
- |: 或。
- 出现错误时一律返回{"error": errorMessasge}
- 未给出返回值的项，如果成功则返回{"msg": successMessage}



| 方法   | 路径                         | 参数                                 | 返回值                                     | 说明                                       |
| ------ | ---------------------------- | ------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| POST   | /api/users/login             | username, password                   |                                            | 登录(仅限管理员)                           |
| POST   | /api/users/logout            |                                      |                                            | 注销(仅限管理员)                           |
| GET    | /api/blogs                   | ([categoryName, title] \| id)        | {id,title,content, createdDate,viewsCount} | 获取指定的博客或随机一些博客               |
|        |                              |                                      |                                            |                                            |
| PUT    | /api/blogs/rename            | [categoryName, title]\| id, newTitle |                                            | 重命名博客(仅限管理员)                     |
| POST   | /api/blogs/save              | [categoryName, title] \| id, content |                                            | 保存博客(仅限管理员)                       |
| POST   | /api/blogs/incre-views-count | [categoryName, title] \| id          |                                            | 增加博客的浏览量                           |
| DELETE | /api/blogs/delete            | [categoryName, title] \| id          |                                            | 删除博客(仅限管理员)                       |
| GET    | /api/blogs/categories        | (categoryName)                       | [{id,name}] \| [{name, children}]          | 获取某分类下的所有博客信息，或所有分类信息 |
| POST   | /api/blogs/categories/create | categoryName                         |                                            | 创建分类(仅限管理员)                       |
| PUT    | /api/blogs/categories/rename | categoryName, newCategoryName        |                                            | 重命名分类(仅限管理员)                     |
| DELETE | /api/blogs/categories/delete | categoryName                         |                                            | 删除分类(仅限管理员)                       |