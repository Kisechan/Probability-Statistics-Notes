#import "@preview/ori:0.2.2": *

#set heading(numbering: numbly("{1:一}、", default: "1.1  "))

#show: ori.with(
  title: "概率论与数理统计",
  author: "Kisechan",
  subject: "Probability Theorem and Mathematical Statistics",
  semester: "Jun 2025",
  date: datetime.today(),
  maketitle: true,
  makeoutline: true,
  // theme: "dark",
  // media: "screen",
)

#let font = (
  main: "IBM Plex Serif",
  mono: "IBM Plex Mono",
  cjk: "Noto Serif SC",
  emph-cjk: "KaiTi",
  math: "New Computer Modern Math",
  math-cjk: "Noto Serif SC",
)

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
  [分布名称], [概率密度函数], [分布函数], [期望], [方差], [参数说明],

  // 均匀分布
  [均匀分布 $U(a, b)$],
  [$f(x) = 1/(b - a), a <= x <= b$],
  [$F(x) = (x - a)/(b - a), a <= x <= b$],
  [$(a + b)/2$],
  [$((b-a)^2)/12$],
  [$a < b$],

  // 指数分布
  [指数分布],
  [$f(x) = lambda e^(-lambda x), x >= 0$],
  [$F(x) = 1 - e^(-lambda x), x >= 0$],
  [$1/lambda$],
  [$1/lambda^2$],
  [$lambda > 0$],

  // 正态分布
  [正态分布 $cal(N)(mu, sigma^2)$],
  [$f(x) = 1/(sqrt(2 pi sigma^2)) e^(-((x - mu)^2)/(2 sigma^2))$],
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
  [分布名称], [概率质量函数], [分布函数], [期望], [方差], [参数说明],

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
  [$P(X = k) = (lambda^k e^(-lambda))/(k!), k = 0,1,2,dots$],
  [],
  [$lambda$],
  [$lambda$],
  [$lambda > 0$],
)

#theorem(title: "二项分布的众数")[
  二项分布的众数为 $floor.l (n+1) p floor.r$。
] <theorem>

#theorem(title: "二项分布的极端情况")[
  二项分布的极限情况就是泊松分布，此时，

  - $n arrow.r infinity$
  - $p arrow.r 0$
  - $n p arrow.r lambda$

] <theorem>

== 标准正态分布

#lemma(title: "Gauss 积分")[
  $
    integral^(-infinity)_(+infinity) 1 / (sqrt(2 pi)) e^(-x^2/2) dif x = 1
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
  f(x) = 1 / (sqrt(2 pi)) e^(-x^2/2)
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
  使用本公式时注意变量的区间。
]

== 二维正态分布

#definition(title: "二维正态分布")[
  $
    (X, Y) ~ cal(N)(mu_1, mu_2, sigma_1^2, sigma_2^2, rho)
  $

  $
    f(x, y) = 1 / (2pi sigma_1 sigma_2 sqrt(1 - rho^2)) e^(-1/(2(1-rho^2)) ((x-mu_1)^2/sigma_1^2 + (y-mu_2)^2/sigma_2^2 - (2 rho (x-mu_1)(y-mu_2))/(sigma_1 sigma_2)))
  $
] <definition>

#theorem(title: "正态分布的可加性")[
  正态分布满足*可加性*：
  $
    X_i ~ cal(N)(mu_i, sigma_i^2)
  $

  $sum c_i X_i ~ cal(N)(sum c_i mu_i, sum ($c_i^2$) sigma_i^2)$
] <theorem>

== 二维随机变量函数的分布

注意*这里涉及到的都是 CDF*

=== $Z = X+Y$ 型

#align(center)[
  $
    F_Z(z) = P(Z <= z) & = P(X + Y <= z)                                                                      \
                       & = integral.double_(x+y <= z) f(x,y) dif x dif y                                      \
                       & = integral_(-infinity)^(+infinity) [ integral_(-infinity)^(z-x) f(x,y) dif y ] dif x \
                       & = (integral_(-infinity)^(+infinity) f(x, z-x) dif x)                                 \
                       & = (integral_(-infinity)^(+infinity) f(z-y, y) dif y)
  $
]
=== $Z = max(X, Y)$ 和 $Z = min(X, Y)$ 型

*独立同分布*，则有
$
  F_max (z) = P(Z <= z) = P(X <= z) P(Y <= z) = (F_X (z) F_Y (z) = F(z)^2)
$

$
  F_min (z) = 1 - P(Z > z) = 1 - P(X > z) P(Y > z) = (1 - [1 - F_X (z)][1 - F_Y (z)] = 1 - [1-F(z)]^2)
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
  #align()[
    $
      bb(E)(g(X)) & = sum g(x) times P { x = X_i } \
                  & = integral g(x) f(x) dif x
    $
  ]
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
  + $exists a, b, " s.t. " Y = a X + b$
  + $sigma_Y / sigma_X = abs(a)$
  + $"D"(X|Y) = "D"(Y|X) = 0$

] <theorem>
