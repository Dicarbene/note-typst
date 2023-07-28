#import "simplepaper.typ": *

#show: project.with(
  title: "SimplePaper 中文模板使用说明",
  authors: (
    "张三",
  ),
)

= 模版简介

SimplePaper 是 Typst 的模版，用于生成简单的论文。

= 使用说明

模版默认使用的字体包括 "FZShuSong-Z01", "FZXiaoBiaoSong-B05", "FZHei-B01", "FZKai-Z03", "FZFangSong-Z02", "DejaVu Sans Mono for Powerline"，我们推荐你在方正官网安装这些字体。

如果你的系统没有安装这些字体，你需要在模版中修改字体。

= 使用示例 <example>

== 特殊标记 <bug1>

你可以 Typst 的语法对文本进行特殊标记，我们为如下标记设定了样式：

+ *突出*

+ _强调_
+ 引用 @example
+ `raw text` 

=== 注意事项

由于 Typst 的语法， 如果你使用 `*本文*` 来标记突出，那么你需要在 `*` 前面加上一个空格，但这会导致你 *突出的文本* 前后附带一个空格，如果你#strong("不想要这个空格")，你可以使用 `#strong("本文")` 来代替。

在列表中使用 raw text 可能会导致不正确的显示，如 @bug1 中的列表。

raw text 中的中文字体可能较小，这是因为 Typst 无法为不同的中英文字体设置不同的字号，所以我们将中英文的字体设置为了相同的字号，这对于英文来说是合适的，但对于中文来说可能不合适。如`raw text: English 中文`。

== 图片

我们为图片标题默认设置了 "FZKai-Z03" 字体，效果如@img 如果你想要使用其他字体，你可以自行修改模版。

#figure(image("sample.svg"),
  caption: [
    示例图片
  ],
)<img>

== 表格

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 10pt,
    align: horizon,
    [], [周一], [周二],[周三],[周四],[周五],
    "早上", "编译原理", "操作系统", "计算机网络", "操作系统", "计算机网络",
    "下午", "数据挖掘", "计算机网络", "操作系统", "计算机网络", "分布式系统"
  ),
  caption: "示例表格"
)
