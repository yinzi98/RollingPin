# RollingPin
> #### 一种弱类型动态编程语言的实现 (toy-like programming language)

## 环境准备
由于开发阶段依赖更新比较频繁，建议使用Docker + VSCode的组合开发/体验。

### Docker方式
1. 安装必要依赖
```bash
sudo apt update && sudo apt install -y vim curl python-pip git docker
pip install docker-compose
```
2. 安装 Docker

    国内用户使用脚本一键安装: `sudo curl -sSL https://get.daocloud.io/docker | sh`  
    国外用户使用脚本一键安装: `sudo curl -sSL get.docker.com | sh`
    
    详细步骤参照： [https://docs.docker.com/install/](https://docs.docker.com/install/)

**未完待续...**


### 手动编译方式
开发环境：Manjaro，理论上其他平台也可以。

```bash
sudo apt update && sudo apt install -y g++ flex bison
git clone https://github.com/yinzi98/RollingPin.git
cd RollingPin
```
**未完待续...**

## 语法设计
### 关键字
RolllingPin 关键字包含以下单词，不能作为变量名或函数使用
```
for while break continue if elif else 
func return true false
```

### 标识符
RolllingPin 采用类 C 表示符规则
- 以英文字母（A~Z，a~z）或者是下划线开头
- 除标识符首位，其他字符可以使英文字母、下划线或者数字（0~9）

## FAQ
#### 为什么会有这个项目 ？
因为毕业设计想做相关方向，就拿这个作为练手，可以看作是毕设版本的Lite？（不过毕设的实现是一种静态强类型语言，两者差别还是蛮大的）

#### 为什么起这个名字 ？
~~特殊癖好~~  

传统艺能，其他项目名称都是 XX饼、XX面，语言作为底层核心，叫这个名字挺自然的。


## 许可
The [MIT](http://opensource.org/licenses/MIT) License