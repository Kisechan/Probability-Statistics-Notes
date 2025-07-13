#import "@preview/ori:0.2.2": *

#set heading(numbering: numbly("{1:一}、", default: "1.1  "))

#let font = (
  main: "IBM Plex Serif",
  mono: "IBM Plex Mono",
  cjk: "Source Han Serif SC",
  emph-cjk: "Source Han Serif SC",
  math: "New Computer Modern Math",
  math-cjk: "Source Han Serif SC",
)

#show: ori.with(
  title: "概率论与数理统计",
  author: "Kisechan",
  subject: "Probability Theorem and Mathematical Statistics",
  semester: "2025 春",
  date: datetime.today(),
  maketitle: true,
  makeoutline: true,
  first-line-indent: auto,
  font: font,
  outline-depth: 3,
  // size: 12pt,
  // theme: "dark",
  // media: "screen",
)

#align(center)[
  #heading(level: 1, numbering: none)[简介]
]

这份笔记是本人在本学期学习概率论与数理统计做的一些归纳，同时作为 Typst 排版的练习，内容整理自#link("https://blog.kisechan.space/2025/notes-ptms/")[这篇博客]，包括了概率论的基本概念、随机变量的分布、统计推断等方面的知识，非常非常不规范不专业，仅适用于非数学专业帮助复习和考试使用。

概率论可以说是数学基础课中最简单的一门，本人考前突击两天就拿了满绩。这课主要考的是前半部分概率论的内容，把这部分的题多做一些就能拿到相当多的分。数理统计部分要记的新概念稍微多一些，但考的不多也不难，背下来概念和解题方法也就足够了。假设检验完全没有考过大题。

本笔记使用 #link("https://typst.app/")[Typst] 编写，基于模板 #link("https://typst.app/universe/package/ori")[ori]（作者：OrangeX4）进行排版，使用 Source Han Serif SC 和 IBM Plex 字体，感谢这些开源贡献者！笔记源代码可以在#link("https://github.com/Kisechan/Probability-Statistics-Notes")[这个 GitHub 仓库]得到，遵循#link("https://creativecommons.org/licenses/by-sa/4.0/legalcode.txt")[CC BY-SA 4.0] 许可协议。

#align(right)[
  Kisechan\
  #link("github.com/Kisechan")\
  #link("mailto:admin@kisechan.space")\
  #datetime.today().display("[year]年[month]月[day]日")\
  笔记版本 v1.3
]

#pagebreak()

#align(center)[
  #heading(level: 1, numbering: none)[符号对照表]
]

#figure(three-line-table[
  | 符号 | 意义 |
  | - | - |
  | CDF | 概率分布函数 |
  | PDF | 概率密度函数 |
  | $bb(R)$ | 实数集 |
  | $bb(N)$ | 自然数集 |
  | $floor.l x floor.r$ | 向下取整 |
  | $cal(N)(mu, sigma^2)$ | 正态分布 |
  | $cal(N)(0, 1)$ | 标准正态分布 |
  | $U(a, b)$ | 均匀分布 |
  | $B(n, p)$ | 二项分布 |
  | $pi(lambda)$ | 泊松分布 |
  | $bb(E)X$ | 期望 |
  | $"D"X$ | 方差 |
  | $"Cov"(X, Y)$ | 协方差 |
  | $rho_(X Y)$ | 相关系数 |
  | $mu$ | 均值 |
  | $sigma^2$ | 方差 |
  | $sigma$ | 标准差 |
  | $macron(X)_n$ | 样本均值 |
  | $S^2$ | 样本方差 |
  | $S$ | 样本标准差 |
  | $hat(theta)$ | $theta$ 的估计量 |
  | $chi^2(k)$ | 自由度为 $k$ 的 $chi^2$ 分布 |
  | $t(k)$ | 自由度为 $k$ 的 $t$ 分布 |
  | $F(d_1, d_2)$ | 自由度为 $d_1$ 和 $d_2$ 的 $F$ 分布 |
  | $alpha$ | 显著性水平 |
  | $beta$ | 第二类错误概率 |
  | $H_0$ | 原假设 |
  | $H_1$ | 备择假设 |
  | $u_(alpha)$ | 标准正态分布分位点 |
  | $chi^2_(alpha)(n-1)$ | $chi^2$ 分布 $alpha$ 分位点 |
  | $t_(alpha)(n-1)$ | $t$ 分布 $alpha$ 分位点 |
  | $F_(alpha)(d_1, d_2)$ | $F$ 分布 $alpha$ 分位点 |
  | $~$ | 服从分布 |
  | $dot ~$ | 近似服从分布 |
]) <three-line-table>

#pagebreak()

= 概率论

== 连续型随机变量分布

#table(
  columns: 6,
  align: center + horizon,

  stroke: (
    x: 0.4pt + luma(180),
    y: 0.4pt + luma(180),
  ),

  // 表头
  [分布名称], [概率密度函数], [概率分布函数], [期望], [方差], [参数说明],

  // 均匀分布
  [均匀分布 $U(a, b)$],
  [$f(x) = 1/(b - a), a <= x <= b$],
  [$F(x) = (x - a)/(b - a), a <= x <= b$],
  [$(a + b)/2$],
  [$((b-a)^2)/12$],
  [$a < b$],

  // 指数分布
  [指数分布],
  [$f(x) = lambda "e"^(-lambda x), x >= 0$],
  [$F(x) = 1 - "e"^(-lambda x), x >= 0$],
  [$1/lambda$],
  [$1/lambda^2$],
  [$lambda > 0$],

  // 正态分布
  [正态分布 $cal(N)(mu, sigma^2)$],
  [$f(x) = 1/(sqrt(2 pi sigma^2)) "e"^(-((x - mu)^2)/(2 sigma^2))$],
  [],
  [$mu$],
  [$sigma^2$],
  [$mu in bb(R), sigma > 0$],
)

== 离散型随机变量分布

#table(
  columns: 6,
  align: center + horizon,

  stroke: (
    x: 0.4pt + luma(180),
    y: 0.4pt + luma(180),
    // top: none,
    // bottom: none,
    // left: none,
    // right: none,
  ),

  // 表头
  [分布名称], [概率密度函数], [概率分布函数], [期望], [方差], [参数说明],

  // 伯努利分布
  [伯努利分布],
  [$P(X = i) = cases(
      p & " " i = 1,
      1-p & " " i = 0,
    )$],
  [$F(x) = cases(
      0 & " " x < 0,
      1-p & " " 0 <= x < 1,
      1 & " " x >= 1
    )$],
  [$p$],
  [$p(1 - p)$],
  [$0 < p < 1$],

  // 二项分布
  [二项分布 $text(B)(n, p)$],
  [$P(X = k) = binom(n, k) p^k (1 - p)^(n-k)$],
  [],
  [$n p$],
  [$n p(1 - p)$],
  [$n in bb(N), 0 < p < 1$],

  // 几何分布
  [几何分布],
  [$P(X = k) = (1 - p)^(k-1) p, k = 1,2,...$],
  [$F(k) = 1 - (1 - p)^k$],
  [$1/p$],
  [$(1 - p)/p^2$],
  [$0 < p < 1$],

  // 泊松分布
  [泊松分布 $pi(lambda)$],
  [$P(X = k) = (lambda^k "e"^(-lambda))/(k!), k = 0,1,2,dots$],
  [],
  [$lambda$],
  [$lambda$],
  [$lambda > 0$],
)

#theorem(title: "二项分布的众数")[
  二项分布 $"B"(n, p)$ 的众数为 $floor.l (n+1) p floor.r$。
] <theorem>

#theorem(title: "二项分布的极端情况")[
  二项分布 $"B"(n, p)$ 的极限情况就是泊松分布 $pi(lambda)$，此时，

  - $n arrow.r infinity$
  - $p arrow.r 0$
  - $n p arrow.r lambda$

] <theorem>

== 标准正态分布

#lemma(title: "Gauss 积分")[
  $
    integral^(-infinity)_(+infinity) 1 / (sqrt(2 pi)) "e"^(-x^2/2) dif x = 1
  $
] <lemma>

#definition(title: "标准正态分布")[
  #align(center)[
    $
                                 若 X & ~ cal(N)(mu, sigma^2) \
      arrow.r.double (X - mu) / sigma & ~ cal(N)(0, 1)
    $
  ]
  标准正态分布满足：
  - $mu = 0$
  - $sigma = 1$
] <definition>

标准正态分布的概率密度函数为：
$
  f(x) = 1 / (sqrt(2 pi)) "e"^(-x^2/2)
$

且，

$
  bb(E) X^2 = 1
$

#theorem()[
  若 $X, Y ~ cal(N)(mu_i, sigma_i)$ 且相互独立，则有：

  - $bb(E)(X Y) = "Cov"(X, Y) + mu_X mu_Y = mu_X mu_Y$
  - $"D"(X Y) = mu_X^2 sigma_Y^2 + mu_Y^2 sigma_X^2 + sigma_X^2 sigma_Y^2$
  - $X Y$ 一般*不再是正态分布*
] <theorem>

== 随机变量函数的分布

#theorem(title: "随机变量函数的分布")[
  如果 $x = g(y)$ 且 $f(x)$ 为 $X$ 的 PDF，且 $g(y)$ 单调，则
  $
    f_Y (y) = f_X (g(y)) abs(g'(y))
  $


] <theorem>

#warning-box()[
  使用本公式时注意变量的定义区间。
]

== 二维正态分布

#definition(title: "二维正态分布")[
  $
    (X, Y) ~ cal(N)(mu_1, mu_2, sigma_1^2, sigma_2^2, rho)
  $

  $
    f(x, y) = 1 / (2pi sigma_1 sigma_2 sqrt(1 - rho^2)) exp (-1/(2(1-rho^2)) ((x-mu_1)^2/sigma_1^2 + (y-mu_2)^2/sigma_2^2 - (2 rho (x-mu_1)(y-mu_2))/(sigma_1 sigma_2)))
  $
] <definition>

#theorem(title: "正态分布的可加性")[
  正态分布满足*可加性*：
  $
            X_i & ~ cal(N)(mu_i, sigma_i^2)                   \
    sum c_i X_i & ~ cal(N)(sum c_i mu_i, sum c_i^2 sigma_i^2)
  $
] <theorem>

== 二维随机变量函数的分布

注意*这里涉及到的都是 CDF*。

=== $Z = X+Y$ 型

#align(center)[
  $
    F_Z(z) = P(Z <= z) & = P(X + Y <= z)                                                                      \
                       & = limits(integral.double)_(x+y <= z) f(x,y) dif x dif y                              \
                       & = integral_(-infinity)^(+infinity) [ integral_(-infinity)^(z-x) f(x,y) dif y ] dif x \
                       & = integral_(-infinity)^(+infinity) f(x, z-x) dif x                                   \
                       & = integral_(-infinity)^(+infinity) f(z-y, y) dif y
  $
]
=== $Z = max(X, Y)$ 和 $Z = min(X, Y)$ 型

*独立同分布*，则有
$
  F_max (z) = P(Z <= z) = P(X <= z) P(Y <= z) = F_X (z) F_Y (z) = F(z)^2
$

$
  F_min (z) = 1 - P(Z > z) = 1 - P(X > z) P(Y > z) = 1 - [1 - F_X (z)][1 - F_Y (z)] = 1 - [1-F(z)]^2
$

== 随机变量的数字特征

=== $bb(E) X$

#definition(title: "数学期望")[
  - *离散型随机变量* $bb(E)X = sum x_i p_i$
  - *连续型随机变量* $bb(E)X = integral_(-infinity)^(+infinity) x f(x) dif x$
] <definition>

#theorem(title: "期望的线性性质")[
  + $bb(E)(c) = c$, $c$ 为常数
  + $bb(E)(a X + b Y) = a bb(E)X + b bb(E)Y$
  + $bb(E)(X Y) = bb(E)X bb(E)Y$, $X, Y$ 相互独立
] <theorem>

#theorem(title: "随机变量函数的期望")[
  $
    bb(E)(g(X)) = cases(
      sum g(x_i) p_i & "，离散型随机变量",
      integral_(-infinity)^(+infinity) g(x) f(x) dif x & "，连续型随机变量",
    )
  $
] <theorem>

=== $"D" X$

#definition(title: "方差")[
  $
    "D" X = bb(E)(X^2) - (bb(E)X)^2
  $
] <definition>

#warning-box()[
  一般计算样本的方差使用的是无偏方差，*注意分母不是 $n$*！
  $
    S^2 equiv 1 / (n-1) sum_(i=1)^n (X_i - macron(X))^2
  $
]

#theorem(title: "方差的非线性性质")[
  + $"D"(a X + b) = a^2 "D" X$
  + $"D"(X plus.minus Y) = "D" X + "D" Y plus.minus 2 "Cov"(X, Y)$
] <theorem>

#definition(title: "标准差")[
  $
    sigma_X = sqrt("D" X)
  $
] <definition>

#warning-box()[
  特别注意标准差和方差要不要开方的问题。
]

=== $"Cov"(X, Y)$

#definition(title: "协方差")[
  $
    "Cov"(X, Y) = bb(E)(X Y) - bb(E)X bb(E)Y
  $
] <definition>

#theorem(title: "协方差的线性性质")[
  + $"Cov"(X, X) = "D" X$
  + $"Cov"(X, c) = 0$
  + $"Cov"(a X, Y) = a "Cov"(X, Y)$
  + $"Cov"(X+Y, Z) = "Cov"(X, Z) + "Cov"(Y, Z)$
] <theorem>

=== $rho_(X Y)$

#definition(title: "相关系数")[
  $
    rho_(X Y) = ("Cov"(X,Y))/(sqrt("D" X "D" Y)) in [-1, 1]
  $
] <definition>

取值范围由 Cauchy-Schwarz 不等式得到，因为方差永远大于 $0$。
$
  [bb(E)(U V)]^2 <= bb(E)(U^2) bb(E)(V^2)
$

#theorem(title: "完全正相关或反相关的性质")[
  $
    rho_(X Y) = plus.minus 1 =>
  $
  + $exists a, b, "使" Y = a X + b$
  + $sigma_Y / sigma_X = abs(a)$
  + $"D"(X|Y) = "D"(Y|X) = 0$

] <theorem>

== 不等式与极限定理

=== Chebyshev 不等式

#theorem(title: "Chebyshev 不等式")[
  $
    P(abs(X - mu) >= epsilon) < sigma^2 / epsilon^2
  $
] <theorem>

=== 大数定律

#theorem(title: "大数定律")[
  记 $macron(X)_n$ 为样本均值，$forall epsilon > 0$，有
  $
    lim_(n -> +infinity) P{ abs(macron(X)_n - mu) < epsilon } = 1
  $
  也就是说，$n -> +infinity$ 时，样本均值依概率收敛于数学期望。
] <theorem>

=== 中心极限定理

#theorem(title: "中心极限定理")[
  记 $macron(X)_n$ 为样本均值，$Z_n$ 为其标准化形式。
  $
    Z_n = (macron(X)_n - bb(E)macron(X)_n) / ("D"macron(X)_n) = (macron(X)_n - mu) / (sigma \/ sqrt(n)) ~ cal(N)(0, 1)
  $
  也就是说，不管 $X_i$ 服从什么分布，其样本均值的标准化形式 $Z_n$ 都近似服从标准正态分布，其非标准化形式满足：

  $ macron(X)_n dot~ cal(N)(mu, sigma^2/n) $
]

#pagebreak()
= 数理统计

== 正态总体

#lemma(title: "Fisher's Lemma")[
  $X_n$ 是从正态总体 $cal(N)(mu, sigma^2)$ 中抽取的一群样本，则样本均值和样本方差满足以下说法：

  + $macron(X)_n ~ cal(N)(mu, sigma^2/n)$
    - $bb(E) macron(X)_n = mu$
    - $D macron(X)_n = sigma^2/n$

  + $((n-1)S^2)/sigma^2 ~ chi^2(n-1)$
    - 注意，$S^2$ 计算是使用的 $macron(X)$。
    - 如果使用均值 $mu$ 计算方差，*则不会损失自由度*，它会遵从 $chi^2(n)$ 分布。
    - $bb(E)S^2 = sigma^2$
    - $D S^2 = (2sigma^4)/(n-1)$

  + $S^2$ 和 $macron(X)$ 是*相互独立的*。
]

== 统计量的 $chi^2$ 分布，$t$ 分布和 $F$ 分布

=== $chi^2$ 分布

#figure(image("assets/chi-square.svg", width: 20em), caption: [
  $chi^2$ 分布 #link("https://en.wikipedia.org/wiki/Chi-squared_distribution")[来源 Wikipedia]
])

#definition(title: $chi^2$ + "分布")[
  $X_1, X_2, ..., X_k$ 满足 $X_k ~ cal(N)(0,1)$，则
  $
    Z = sum X_i^2 ~ chi^2(k)
  $
] <definition>

#theorem(title: $chi^2$ + "分布的期望和方差")[
  - $bb(E)Z = k$
  - $D Z = 2k$
] <theorem>

#theorem(title: $chi^2$ + "分布的可加性")[
  若 $Z_i$ 独立，则满足可加性：
  $
    sum Z_i ~ chi^2(sum k_i)
  $
] <theorem>

=== $t$ 分布

#figure(image("assets/student_t.svg", width: 20em), caption: [
  $t$ 分布 #link("https://en.wikipedia.org/wiki/Student%27s_t-distribution")[来源 Wikipedia]
])

#definition(title: $t$ + "分布")[
  若：
  + $Z ~ cal(N)(0,1)$
  + $U ~ chi^2(k)$
  + 二者相互独立

  则，
  $
    T = Z / sqrt(U\/k) ~ t(k)
  $
] <definition>

#theorem(title: $t$ + "分布的可加性")[
  - $bb(E)T = 0, "如果" k > 1$
  - $D T = k/(k-2), "如果" k > 2$
] <theorem>

$k -> +infinity$ 时，$t$ 分布收敛于 $cal(N)(0,1)$。

对于从正态总体中抽取的样本 $X_i$，有
$
  (macron(X)_n - mu)/(sigma \/ sqrt(n)) ~ cal(N)(0,1) \
  ((n-1)S^2)/sigma^2 ~ chi^2(n-1)
$
则，
$
  T & = (macron(X)_n - mu) / (S\/sqrt(n))                                          \
    & = (((X)n - mu) / (sigma\/sqrt(n))) / (sqrt(S^2\/sigma^2))                    \
    & = ((macron(X)_n - mu)/sigma\/sqrt(n)) / (sqrt((chi^2(n-1))\/(n-1))) ~ t(n-1)
$

=== $F$ 分布

#figure(image("assets/f-distribution.svg", width: 20em), caption: [
  $F$ 分布 #link("https://en.wikipedia.org/wiki/F-distribution")[来源 Wikipedia]
])

#definition(title: $F$ + "分布")[
  若：
  - $U ~ chi^2(d_1)$
  - $V ~ chi^2(d_2)$
  - 二者相互独立

  则，
  $
    F = (U\/d_1)/(V\/d_2) ~ F(d_1, d_2)
  $
  且，
  $
    "如果" T ~ t(k)"，则"
    T^2 ~ F(1, k)
  $

] <definition>

== 点估计法

=== 矩估计法

核心思想：令
$
  bb(E)X^t (theta) = macron(X)_n^t
$
求解出矩估计量 $hat(theta) = f(macron(x))$。


=== 最大似然估计法

核心思想：令
$
  L(theta) = product p(x_i; theta) =
  cases(
    product P{X=x_i; theta} & "，离散型随机变量",
    product f(x_i; theta) & "，连续型随机变量",
  )
$
取对数后求其驻点：
$
  (dif ln L(theta))/(dif theta) = sum (p'(x_i; theta))/(p(x_i; theta)) = 0
$

如果有多个待估参数，例如正态分布的 $mu$ 和 $sigma^2$，则需要求它们的偏导，组成一个方程组：
$
  cases(
    (partial ln L(theta_i))/(partial theta_1) & = 0,
    (partial ln L(theta_i))/(partial theta_2) & = 0,
    & dots.v,
    (partial ln L(theta_i))/(partial theta_n) & = 0,
  )
$
更严谨的话还要检查一下 Hessian 矩阵。

当似然函数满足以下条件时，参数的最大似然估计值可能是 $max{X_i}$ 或 $min{X_i}$：
- *是单调函数*
- $x_i$ *依赖于待估计的参数*

例如，均匀分布的观察值 $X_i$ 必须处在某个和 $theta$ 相关的区间内时，会涉及到这种情况。

== 估计量的评选标准

=== 无偏性

若 $bb(E) hat(theta) = theta$，则称 $hat(theta)$ 为 $theta$ 的无偏估计量。

#lemma[
  一些无偏估计量：
  - $bb(E) macron(X)_n = mu$
  - $bb(E) S^2 = sigma^2$ (若样本方差 $S^2$ 计算使用的是无偏公式，即分母为 $n-1$)
] <lemma>

=== 有效性

若 $hat(theta)_i$ 和 $hat(theta)_j$ 都是 $theta$ 的无偏估计量，且
$
  "D" hat(theta)_i <= "D" hat(theta)_j
$
则称 $hat(theta)_i$ 比 $hat(theta)_j$ 更有效。

=== 一致性

当 $n -> +infinity$ 时，估计量 $hat(theta)_n$ 依概率收敛于 $theta$，即
$
  forall epsilon > 0, quad lim_(n->+infinity) P{ abs(hat(theta)_n - theta) < epsilon } = 1
$
则称 $hat(theta)_n$ 为 $theta$ 的一致估计量。

== 区间估计

#caution-box()[
  注意分位点是一个*坐标*，而不是长度。
]

=== 求 $mu$

- *若方差已知*，置信水平为 $1-alpha$ 时，枢轴量 $(macron(X) - mu)/(sigma \/ sqrt(n)) ~ cal(N)(0,1)$ 的值需要在 $(-u_(alpha/2), u_(alpha/2))$ 区间内。解出 $mu$ 的置信区间为：
  $
    mu in (macron(X) plus.minus u_(alpha/2) sigma/sqrt(n))
  $
- *若方差未知*，置信水平为 $1-alpha$ 时，枢轴量 $(macron(X) - mu)/(S \/ sqrt(n)) ~ t(n-1)$ 的值需要在 $(-t_(alpha/2)(n-1), t_(alpha/2)(n-1))$ 区间内。解出 $mu$ 的置信区间为：
  $
    mu in (macron(X) plus.minus t_(alpha/2)(n-1) S/sqrt(n))
  $

=== 求 $sigma^2$

- *若期望未知*，置信水平为 $1-alpha$ 时，枢轴量 $((n-1)S^2)/sigma^2 ~ chi^2(n-1)$ 的值需要在 $(chi^2_(1-alpha/2)(n-1), chi^2_(alpha/2)(n-1))$ 区间内。解出 $sigma^2$ 的置信区间为：
  $
    sigma^2 in ( ((n-1)S^2)/(chi^2_(alpha/2)(n-1)), ((n-1)S^2)/(chi^2_(1-alpha/2)(n-1)))
  $
- *若期望已知*，枢轴量为 $(sum(X_i - mu)^2)/sigma^2 ~ chi^2(n)$，则置信区间为：
  $
    sigma^2 in (sum(X_i - mu)^2/(chi^2_(alpha/2)(n)), (sum(X_i - mu)^2)/(chi^2_(1-alpha/2)(n)))
  $

求单侧置信区间只需要把 $alpha/2$ 变成 $alpha$ 即可。

== 假设检验

假设检验的结果可能犯两类错误：
- *第一类错误* (弃真)：当原假设 $H_0$ 为真时，却拒绝 $H_0$。犯此类错误的概率以 $alpha$ 表示：
  $
    P{"拒绝" H_0 | H_0 "为真"} = alpha
  $
- *第二类错误* (取伪)：当原假设 $H_0$ 为假时，却接受 $H_0$。犯此类错误的概率以 $beta$ 表示：
  $
    P{"接受" H_0 | H_0 "为假"} = beta
  $

#table(
  columns: (auto, 1fr, 1fr),
  align: center + horizon,
  stroke: (
    top: none,
    bottom: none,
    left: none,
    right: none,
  ),
  [], [*$H_0$ 为真*], [*$H_0$ 为假*],
  [*接受*], [正确], [第二类错误],
  [*拒绝*], [第一类错误], [正确],
)

=== 检验 $mu$

+ *提出假设*：$H_0: mu = mu_0$，$H_1: mu != mu_0$。
+ *选择检验统计量*：
  - *方差已知*：选 $(macron(X) - mu_0)/(sigma\/sqrt(n)) ~ cal(N)(0,1)$，进行 *U 检验*。
  - *方差未知*：选 $(macron(X) - mu_0)/(S\/sqrt(n)) ~ t(n-1)$，进行 *T 检验*。
+ *根据显著性水平 $alpha$ 求出拒绝域*：
  - *U 检验*：拒绝域 $W = (-infinity, -u_(alpha/2)) union (u_(alpha/2), +infinity)$。
  - *T 检验*：拒绝域 $W = (-infinity, -t_(alpha/2)(n-1)) union (t_(alpha/2)(n-1), +infinity)$。
+ *做出检验*：将样本值代入检验统计量，计算出结果。若结果落在拒绝域 $W$ 内，则拒绝 $H_0$；否则接受 $H_0$。

=== 检验 $sigma^2$

+ *提出假设*：$H_0: sigma^2 = sigma_0^2$，$H_1: sigma^2 != sigma_0^2$。
+ *选择检验统计量*：$((n-1)S^2)/sigma_0^2 ~ chi^2(n-1)$，进行 *$chi^2$ 检验*。
+ *求拒绝域*：$W = (0, chi^2_(1-alpha/2)(n-1)) union (chi^2_(alpha/2)(n-1), +infinity)$。
+ *做出检验*：将样本值代入检验统计量，若结果落在拒绝域 $W$ 内，则拒绝 $H_0$；否则接受 $H_0$。
