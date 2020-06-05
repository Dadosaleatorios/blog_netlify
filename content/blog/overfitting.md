+++
author = "Bruno Lucian"
date = 2020-05-28T20:41:40Z
draft = true
image = "images/blog/calltoaction_conceito.png"
tags = ["datascience", "ML"]
title = "Over-fitting: o que é e como evita-la."
undefined = ""

+++
# **Overfitting e Underfitting**

**Underfitting** e **Overfitting** são termos muito importantes no ramo do machine learning. **Um bom modelo não deveria sofrer de Underfitting nem de Overfitting**, por isso precisamos entender estes conceitos, e saber identificar suas ocorrências.

![](/uploads/fig-2-underfit-optimum-overfit.png)

No aprendizado supervisionado, os modelos são treinados em um subconjunto de dados, também conhecidos como dados de treinamento. Com a intenção de generalizar o aprendizado para fora do subconjunto.

O overfitting acontece quando o modelo aprende sinais e ruídos nos dados de treinamento e não tem um bom desempenho em novos dados sobre os quais o modelo não foi treinado.

Se o número de variáveis for muito alto, existe uma probabilidade de que o preenchimento de hipóteses seja adequado a todos os pontos nos dados de treinamento. Pode parecer uma coisa boa de acontecer, mas tem resultados contraditórios. 

Agora, há algumas maneiras de evitar o overfitting de seu modelo em dados de treinamento, como amostragem em **validação cruzada**, **redução do número de variáveis**, **regularização**, etc.

Não existe um método de **validação cruzada** único que funcione em todos os cenários. É importante entender se você está lidando com grupos, dados indexados por tempo ou se está vazando dados no seu procedimento de validação. Abaixo podemos ver alguns dos principais métodos disponíveis:

* _Train/test split_
* _k-Fold Cross-Validation_
* _Leave-one-out Cross-Validation_
* _Leave-one-group-out Cross-Validation_
* _Nested Cross-Validation_
* _Time-series Cross-Validation_
* _Wilcoxon signed-rank test_
* _McNemar’s test_
* _5x2CV paired t-test_
* _5x2CV combined F test_

O processo de r**edução do número de variáveis** pode ser feito de diversas formas, cada qual com sua peculiariedade, a seguir vamos elencar os principais.

* _Missing Values Ratio_
* _Low Variance Filter_
* _High Correlation Filter_
* _Random Forests / Ensemble Trees_
* _Principal Component Analysis (PCA)_
* _Backward Feature Elimination_
* _Forward Feature Construction_
* _t-Distributed Stochastic Neighbor Embedding (t-SNE)_

A **regularização** basicamente adiciona a penalidade à medida que a complexidade do modelo aumenta, fazendo assim que o modelo resultante seja mais simples. Dependendo do modelo podemos ter tipos diferentes de regularizações, as que eu considero as principais vão ser citadas a seguir.

* _Lasso (L1 Norm)_
* _Ridge Regression (L2 Norm)_
* _Dropout_