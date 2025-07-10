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
  [分布名称],
  [概率密度函数],
  [分布函数],
  [期望],
  [方差],
  [参数说明],

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
  [正态分布 $N(mu, sigma^2)$],
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
  [分布名称],
  [概率质量函数],
  [分布函数],
  [期望],
  [方差],
  [参数说明],

  // 伯努利分布
  [伯努利分布],
  [$P(X=1) = p, P(X=0) = 1 - p$],
  [$F(x) = cases(
    0 & "for " x < 0,
    1-p & "for " 0 <= x < 1,
    1 & "for " x >= 1
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

二项分布的众数为 $floor.l (n+1) p floor.r$

二项分布的极限情况就是泊松分布，此时，

- $n arrow.r infinity$
- $p arrow.r 0$
- $n p arrow.r lambda$

