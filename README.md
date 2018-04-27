 ## Skeleton
 * 展示加载中的一种方式
 
 ## 文件
UIView+skeleton.h
UIButton+skeleton.h
UITableViewCell+skeleton.h

## 使用
将skeleton文件夹里的文件导入你的工程
```
#import "WXSkeleton.h"
```
给需要展示前占位的控件设置属性
```
view.isSkeleton = 1;
```
数据请求成功展示数据
```
[view endSkeleton];
view.backgroundColor = [UIColor redColor];
```

