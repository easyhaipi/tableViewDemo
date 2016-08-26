# tableViewDemo
##tableView加载不同的cell  可以根据需求再做更改，留着备用
###在同一个cell上添加不同的cell,便于控制的需要
###把EaseBlankPage拖到项目中去，就可以一行代码，来实现没有数据或者数据出错的页面显示
       
        [self.view configBlankPage:EaseBlankPageTypeView hasData:self.dataArray.count hasError:(self.dataArray.count>0)         reloadButtonBlock:^(id sender) {
            NSLog(@"重新加载的数据");
         }];
  
  
  ![效果图](https://github.com/easyhaipi/tableViewDemo/raw/master/tableViewDemo.gif)
