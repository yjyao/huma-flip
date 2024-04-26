# 翻转虎码 Huma Flip

## 简介

面向 Dvorak 键盘布局用户的魔改版[虎码](https://tiger-code.com)输入方案。

## 背景与动机

虎码适配了 Qwerty 键盘布局。
强调左右手交替击键、避免难打手势。
这些也是虎码的长处之一。
如果在 Dvorak 键盘上直接采用 Qwerty 版虎码方案。
则放弃了这些手感上的优化。
甚为可惜。
为此。
本魔改版重新将原版 Qwerty 版虎码方案适配到 Dvorak 键盘上。

## 设计原理

### 问题剖析

由于键盘还是同一块键盘。
虎码既已对 Qwerty 布局优化过。
那么简单地把 Qwerty 布局映射到 Dvorak 布局。
再在 Dvorak 布局上输入。
不就和 Qwerty 用户打 Qwerty 版按的是一样的键了吗？
可惜不然。
虽然大部分的键会映射回原位。
但 Dvorak 更改了四个标点符号的键位：
将 `,`、`.`、`;`、`'` 从右手的右下部移至了左手的左上和左下部
（依次对应 Qwerty 的 `w`、`e`、`z`、`q` 等键）。
而一般的输入法是不支持使用标点键入码的。
即使输入法支持。
占用了标点键也将造成不便 ——
难道输入英文时用左手输句号。
而输入中文时用右手输句号吗？
所以为了保持使用二十六个字母来输入。
我们须要适配这四个标点键的变化。
除此四键以外。
其余皆可共用键位。
即是说。
不管你是打 Qwerty 的 `f`。还是打 Dvorak 的 `u`。
你都是用左手食指敲下带有突起的那个按键。

### 解决方案

如何解决标点键的冲突问题？
巧的是。
移动的四个按键皆是由右手变到了左手。
更皆是由右手右部变到了左手左部。
这一对称性意味着我们或许可以将整个 Qwerty 布局左右翻转。
以得到适合 Dvorak 布局的码表方案。
翻转虎码（Huma Flip）
也由此得名。

在这个整体思路上。
翻转后需要重新设计按键的只有原版虎码中的 `i`、`o`、`p` 这三个键。
他们左右翻转后会变成 Qwerty 下的 `e`、`w`、`q` 三键。
亦即 Dvorak 的 `.`、`,`、`'` 三键。
剩下一个标点键在 Qwerty 中也还是标点键。并不影响码表方案。
最简单的映射方案如下：

Qwerty 布局 | Dvorak 布局
---         | ---
`i`         | `j`
`o`         | `q`
`p`         | `a`

这样各键相对位置变化不大。只是上下翻转了一下。
如虎码中的 `i` 在右手中指上方。
翻转后移至左手中指下方的 `j`（即 Qwerty 的 `c`）。

### 额外优化

但翻转虎码为进一步优化手感。
采用了额外的映射。

我们可以发现。虎码的 `p` 映射至 Dvorak 后到了 `a` 键上。
这是一个所谓的「home row」键。
因为我们不需要移动手指就能直接按下他。
这样的按键按起来是最为便捷舒适的。
有了 Dvorak 提供的这个额外的 home row 键位。
也就有了额外优化的可能。

原版虎码中的 `p` 是右手小拇指上方。
而 Qwerty 用户并不常常需要用到右手小拇指
（Qwerty 中右手小拇指管辖的字母键仅有 `p` 而已）。
所以虎码设计刻意减少了 `p` 的使用[^1]。
如果将最难摁的 `p` 原封不动地放到最好摁的 `a` 键上。
就太过浪费了。
经过尝试。
本方案在简单的翻转映射之外。
互相调换了原版虎码中 `p`、`l`、`u` 的位置。
即翻转映射到 Dvorak 后 `a`、`o`、`p` 的位置。
具体调换方案请见下文。

[^1]: https://tiger-code.com/docs/image-20240127090931615.png

## 具体方案

翻转虎码将整个 Qwerty 布局左右翻转。
以适配 Dvorak 布局的标点键位置。
所以我们将键盘分成以下几区进行适配：

-   非翻转得出的特例键：

    虎码（Qwerty 布局） | 翻转虎码（Dvorak 布局）
    ---                 | ---
    `l`                 | `a`
    `u`                 | `o`
    `i`                 | `j`
    `o`                 | `q`
    `p`                 | `p`

-   其余键位。
    即将 Qwerty 左右翻转后。落在 Dvorak 布局上的键位。
    尤其是 Qwerty 的左手部分会完整地翻转到 Dvorak 的右手上。

    > [!CAUTION]
    > 注意这里说的是手上的按键位置对称。
    > 而非字母表上的对称。
    > 举例来说。
    > 「人」字在原版虎码方案中是 `j`。
    > 即**右手**食指带有突起的键。
    > 则「人」字在翻转虎码方案中就是**左手**食指带有突起的键。
    > 即 `u`（也即 Qwerty 布局下的 `f` 键）。

## 手感

我们适配 Dvorak 布局的初衷是继承虎码带来的流畅手感。
由于翻转虎码的主要布局基本和原版虎码左右对称。
所以和原版虎码的手感相去无多。

原版虎码的左右手平衡性较佳。
左右手使用比例和交替击打率都较高[^1]。
由于翻转虎码的布局完全交换了虎码的左右手。
原版虎码用左手时翻转虎码必用右手。
反之亦然。
所以翻转虎码也完全继承了原版虎码的左右手使用比例和交替击打率。

原版虎码的左手布局完整地左右对称翻转到了翻转虎码的右手上。
所以不需多讨论。

原版虎码的右手布局在左右对称翻转到翻转虎码的左手上时。
被动和主动地改变了一些位置。
可分两类：

-   原版 Qwerty 的 `i`、`o` 移到 Dvorak 的 `j`、`q`。
    使用的手指不变。仅由上列移到下列。
    手感应大致雷同。
    对手指长的人或有轻微影响。

-   原版 Qwerty 的 `p`、`l`、`u` 移到 Dvorak 的 `p`、`a`、`o`。
    这样一来。

    -   减少了一个难打键（Qwerty 的 `p`）。
    -   增加了一个好打键（Dvorak 的 `a`）。
    -   剩下两键键位仍然对称。

    同时。
    为了发挥从难打键到好打键的变化。

    -   将少用（2.9%[^1]）的「刀」字根从难打键 `p` 移到了食指上排的 `p`。
    -   将多用（5.81%）的「手」字根从食指上排的 `u` 移到了 home row 的 `o`。
    -   将次多用（3.58%）的「草」字根从 home row 无名指的 `n`
        移到了 home row 小拇指的 `a`。
        把 home row 无名指的 `o` 让位给「手」字根。

    此变更对手感有良好提升。

总体而言。
翻转虎码极大地继承了原版虎码的优良手感。
而由于 Dvorak 给我们新增了一个 home row 键位。
翻转虎码的手感更略优于原版虎码。

## 安装

该库同时作为我个人的[精灵五笔输入法](http://www.jlwubi.com)配置和词库的备份。
有意使用翻转虎码方案的。
可以查看下载该库中「用户词库」和「系统词库」文件导入精灵五笔。
也可以下载官方码表后针对码表内容用以下命令自行映射：

```shell
$ < extracted-dictionary.txt > huma-flip-dictionary.txt \
    tr 'qazwsxedcrfvtgbyhnujmikolp' 'lszrnvctwghmfdbyixoukjeqap'
```
