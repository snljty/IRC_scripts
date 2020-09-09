# IRC_scripts

一些用来拆分IRC，得到每个点的Mayer键级并绘图，以及得到每个点的用DORI-sign(λ_2)ρ填色图并制作动画的脚本。

## 步骤1 使用Gaussian计算TS以及同水平下的IRC

没啥好说的。

## 步骤2 生成IRC每个点的Gaussian输入文件

参照Sobereva老师的博文《产生Gaussian的IRC和SCAN任务每个点的波函数文件的工具》http://sobereva.com/199

需要一个每个点的模板文件。建议保留chk和wfn

## 步骤3 使用Gaussian计算每个点的波函数，建议保留chk和wfn

使用BatRun.bat或BatchRun.sh脚本。

之后把每个chk都转成fchk。

在BatchRun脚本里面都有。

## 步骤4 提取每个单点能量

使用extract_total_energy.py或者extract_total_energy.sh

## 步骤5 使用Multiwfn计算每个点的DORI格点以及sl2r格点

使用DORI_generate脚本配合DORI_in.txt

## 步骤5 使用Multiwfn计算每个点的Mayer键级矩阵

使用Mayer_BO_generate脚本配合Mayer_BO_in.txt

## 步骤6 提取需要的Mayer键级信息

修改Mayer_read_in.txt，使用draw_Mayer.py提取。需要之前的每个单点的能量文件。

## 步骤7 用VMD载入TS的结构，调整视角。

首先用Multiwfn把TS点的结构转化为xyz格式，用vmd载入。调整视角到合适，预计IRC两端用这个视角看都不会有太大问题。source saveview.tcl，用dump_view命令来提取当前视角，粘贴到draw_DORI.tcl，保存。

## 步骤8 用VMD绘制DORI-sl2r填色图，生成每一帧渲染所需的dat文件。

在VMD中使用draw_DORI.tcl。

## 步骤9 渲染每一帧的dat文件为bmp

使用render_all.bat，注意里面的tachyon需要指定正确的版本和路径，核心数建议改成合适的。

## 步骤10 把DORI-sl2r的填色图制作成动画。

使用bmp2gif_animate.py

