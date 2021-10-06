---
layout: post
title: Comprensión para evitar ITM
author: Nepo
tags: programacion
---

Conor Hoekstra le dió el nombre Initialize Then Modify.


```python
pares = []
for i in range(1, 11):
    pares.append(2*i)
```

```python
pares = [2*i for i in range(1, 11)]
```

```R
impares <- c()
for (i in 1:10) {
  impares <- append(impares, 2*i-1)
}
```

```R
library(comprehenr)
impares <- to_vec(for (i in 1:10) 2*i-1)
```